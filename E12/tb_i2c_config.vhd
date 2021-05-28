-------------------------------------------------------------------------------
-- Title      : Ex12 - Testbench for I2C-bus controller
-- Project    : 
-------------------------------------------------------------------------------
-- File       : tb_i2c_config.vhd
-- Author     : Trinh Gia Huy,Rajesh Singapati
-- Company    : 
-- Created    : 2021-02-25
-- Last update: 2021-02-25
-- Platform   : 
-- Standard   : VHDL'93/02
-------------------------------------------------------------------------------
-- Description: Test bench for i2c_config
-------------------------------------------------------------------------------
-- Copyright (c) 2021 
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author                          Description
-- 2021-02-25  1.0      Trinh Huy,Rajesh Singapati	Created
-------------------------------------------------------------------------------

-- TODO: Add header

library ieee;
use ieee.std_logic_1164.all;

-------------------------------------------------------------------------------
-- Empty entity
-------------------------------------------------------------------------------

entity tb_i2c_config is
end tb_i2c_config;

-------------------------------------------------------------------------------
-- Architecture
-------------------------------------------------------------------------------
architecture testbench of tb_i2c_config is

  -- Number of parameters to expect
  constant n_params_c     : integer := 15;
  constant n_leds_c       : integer := 4;
  constant i2c_freq_c     : integer := 20000;
  constant ref_freq_c     : integer := 50000000;
  constant clock_period_c : time    := 20 ns;
  constant timeout_c      : time    := 100 ms;
  
  -- Every transmission consists several bytes and every byte contains given
  -- amount of bits. 
  constant n_bytes_c       : integer := 3;
  constant bit_count_max_c : integer := 8;

  -- Signals fed to the DUV
  signal clk   : std_logic := '0';      -- Remember that default values supported
  signal rst_n : std_logic := '0';      -- only in synthesis

  -- The DUV prototype
  component i2c_config
    generic (
      ref_clk_freq_g : integer;
      i2c_freq_g     : integer;
      n_params_g     : integer;
	  n_leds_g : integer);
    port (
      clk              : in    std_logic;
      rst_n            : in    std_logic;
      sdat_inout       : inout std_logic;
      sclk_out         : out   std_logic;
      param_status_out : out   std_logic_vector(n_leds_g-1 downto 0);
      finished_out     : out   std_logic
      );
  end component;

  -- Signals coming from the DUV
  signal sdat         : std_logic := 'Z';
  signal sclk         : std_logic;
  signal param_status : std_logic_vector(n_leds_c-1 downto 0);
  signal finished     : std_logic;

  -- To hold the value that will be driven to sdat when sclk is high.
  signal sdat_r : std_logic;

  -- Counters for receiving bits and bytes
  signal bit_counter_r  : integer range -1     to bit_count_max_c-1;
  signal byte_counter_r : integer range 0 to n_bytes_c-1;
  
  --Add counter signal for param
  signal param_counter_r : integer range 0 to n_params_c -1;
  
  --Add array for received bytes
  type received_bytes_array is array (0 to n_params_c*n_bytes_c -1) of std_logic_vector(bit_count_max_c -1 downto 0);
  --Signal for register received bytes
  signal received_bytes_r : received_bytes_array;

  --Add a signal that tell that NACK signal is already sent
  --such that the testbench continue with ACK
  signal nack_sent_r : std_logic;

  -- States for the FSM
  type   states is (wait_start, read_byte, send_ack, wait_stop, finished_state);
  signal curr_state_r : states;

  -- Previous values of the I2C signals for edge detection
  signal sdat_old_r : std_logic;
  signal sclk_old_r : std_logic;

  
  --Add constant for configuration and address correction
  constant device_address_c : std_logic_vector(6 downto 0):="0011010";
  type param_array_type is array (0 to n_params_c -1) of std_logic_vector(bit_count_max_c-1 downto 0);
  constant param_address_c : param_array_type := ("00011101",
                                                  "00100111",
                                                  "00100010",
                                                  "00101000",
	                                          "00101001",
	                                          "01101001",
	                                          "01101010",
	                                          "01000111",
	                                          "01101011",
	                                          "01101100",
	                                          "01001011",
	                                          "01001100",
	                                          "01101110",
	                                          "01101111",
	                                          "01010001");
  constant param_value_c : param_array_type := (  "10000000",
	                                          "00000100",
	                                          "00001011",
	                                          "00000000",
	                                          "10000001",
	                                          "00001000",
	                                          "00000000",
	                                          "11100001",
	                                          "00001001",
	                                          "00001000",
	                                          "00001000",
	                                          "00001000",
	                                          "10001000",
                                                  "10001000",
                                                  "11110001");

  
begin                           -- testbench

  clk   <= not clk after clock_period_c/2;
  rst_n <= '1'     after clock_period_c*4;

  -- Assign sdat_r when sclk is active, otherwise 'Z'.
  -- Note that sdat_r is usually 'Z'
  with sclk select
    sdat <=
    sdat_r when '1',
    'Z'    when others;


  -- Component instantiation
  i2c_config_1 : i2c_config
    generic map (
      ref_clk_freq_g => ref_freq_c,
      i2c_freq_g     => i2c_freq_c,
      n_params_g     => n_params_c,
      n_leds_g => n_leds_c)
    port map (
      clk              => clk,
      rst_n            => rst_n,
      sdat_inout       => sdat,
      sclk_out         => sclk,
      param_status_out => param_status,
      finished_out     => finished);

  -----------------------------------------------------------------------------
  -- The main process that controls the behavior of the test bench
  fsm_proc : process (clk, rst_n)
  begin                                 -- process fsm_proc
    if rst_n = '0' then                 -- asynchronous reset (active low)

      curr_state_r <= wait_start;

      sdat_old_r <= '0';
      sclk_old_r <= '0';

      byte_counter_r <= 0;
      bit_counter_r  <= bit_count_max_c - 1;

      sdat_r <= 'Z';

      nack_sent_r <= '0';

      for i in received_bytes_r'range loop
        received_bytes_r(i) <= (others => '0');
      end loop;
      
      
    elsif clk'event and clk = '1' then  -- rising clock edge

      -- The previous values are required for the edge detection
      sclk_old_r <= sclk;
      sdat_old_r <= sdat;


      -- Falling edge detection for acknowledge control
      -- Must be done on the falling edge in order to be stable during
      -- the high period of sclk
      if sclk = '0' and sclk_old_r = '1' then        
        -- If we are supposed to send ack
        if curr_state_r = send_ack then
          -- Send ack (low = ACK, high = NACK)
          -- Send NACK in some arbitrary parameter-byte -combinations.
          if ((param_counter_r = 3 and byte_counter_r = 0) or (param_counter_r = 6 and byte_counter_r = 2)) then
            --Send NACK only once.
            if (nack_sent_r = '0') then
              sdat_r <= '1';
              nack_sent_r <= '1';
            else
              sdat_r <= '0';
              nack_sent_r <= '0';
            end if;
          else            
            sdat_r <= '0';
          end if;          
        else          
          -- Otherwise, sdat is in high impedance state.
          sdat_r <= 'Z';          
        end if;        
      end if;
      
      -------------------------------------------------------------------------
      -- FSM
      case curr_state_r is

        -----------------------------------------------------------------------
        -- Wait for the start condition
        when wait_start =>
          -- While clk stays high, the sdat falls
          if sclk = '1' and sclk_old_r = '1' and
            sdat_old_r = '1' and sdat = '0' then

            curr_state_r <= read_byte;

          end if;

          --------------------------------------------------------------------
          -- Wait for a byte to be read
        when read_byte =>

          -- Detect a rising edge
          if sclk = '1' and sclk_old_r = '0' then
            received_bytes_r(param_counter_r*n_bytes_c + byte_counter_r)(bit_counter_r) <= sdat;
            bit_counter_r                                                               <= bit_counter_r -1;
            if bit_counter_r = 0 then
              -- At this rising edge, we will capture the last bit, but also
              -- ready change state to send_ack.
              curr_state_r <= send_ack;
              bit_counter_r <= bit_count_max_c - 1;
                          
            end if;  -- Bit counter terminal count
            
          end if;  -- sclk rising clock edge

          --------------------------------------------------------------------
          -- Send acknowledge
        when send_ack =>

          -- Detect a rising edge
          if sclk = '1' and sclk_old_r = '0' then
            --If ACK, continue receiving bytes.
            if (sdat_r = '0') then
              
              if byte_counter_r /= n_bytes_c-1 then

                -- Transmission continues
                byte_counter_r <= byte_counter_r + 1;
                curr_state_r   <= read_byte;
              
              else

                -- Transmission is about to stop
                byte_counter_r <= 0;
                curr_state_r   <= wait_stop;
              
              end if;
              -- If NACK, cancel to begining of the current param.
            elsif (sdat_r = '1') then
              byte_counter_r <= 0;
              curr_state_r <= wait_start;
            end if;
            
          end if;

          ---------------------------------------------------------------------
          -- Wait for the stop condition
        when wait_stop =>
          param_counter_r  <= param_counter_r;
          curr_state_r     <= curr_state_r;
          
          -- Stop condition detection: sdat rises while sclk stays high
          if sclk = '1' and sclk_old_r = '1' and
            sdat_old_r = '0' and sdat = '1' then

            if (param_counter_r /= n_params_c -1)then
              param_counter_r <= param_counter_r +1;              
              curr_state_r <= wait_start;
            else
              curr_state_r <= finished_state;
            end if;
                        
          end if;
          
          ---------------------------------------------------------------------
          -- Implement finish state
        when finished_state =>
          curr_state_r <= finished_state;
      end case;

    end if;

    --Timout assertion have to be in the process.
    assert now < timeout_c report "Simulation timed out" severity failure;    
  end process fsm_proc;

  -----------------------------------------------------------------------------
  -- Asserts for verification
  -----------------------------------------------------------------------------



  check_received_bytes : process(finished, received_bytes_r)

    --function is used for converting std_logic_vector to string
    function slv_to_string(vec: std_logic_vector) return string is
      variable ret : string(vec'length downto 1) := (others => NUL);
    begin
      for i in  vec'length -1 downto 0 loop
        ret(i+1) := std_logic'image(vec(i))(2);
      end loop;
      return ret;
    end function;


    -- procedure to assert that 2 byte equals.
    procedure assert_byte(received_byte: std_logic_vector(bit_count_max_c -1 downto 0);
                         expected_value : std_logic_vector(bit_count_max_c-1 downto 0);
                         error_msg_base: string
                         )is
    begin
      assert received_byte = expected_value
        report error_msg_base & "Expected: " & slv_to_string(expected_value) & ", but got " & slv_to_string(received_byte)
        severity failure;
    end procedure;


  begin --begin process check_received_bytes
    if (finished = '1') then
      for i in 0 to n_params_c -1 loop
        --Correct device address and write-bit was always sent
        assert_byte(received_bytes_r(i*n_bytes_c + 0), device_address_c & '0', "Incorrect device address received. ");
        --Correct parameter address are sent.
        assert_byte(received_bytes_r(i*n_bytes_c + 1), param_address_c(i), "Incorrect parameter  address received. ");
        --Correct parameter value are sent.
        assert_byte(received_bytes_r(i*n_bytes_c + 2), param_value_c(i), "Incorrect parameter value received. ");
      end loop;
    end if;
  end process check_received_bytes;

  
  -- SDAT should never contain X:s.
  assert sdat /= 'X' report "Three state bus in state X" severity error;

  -- End of simulation, but not during the reset
  assert finished = '0' or rst_n = '0' report
    "Simulation done" severity failure;
  
end architecture testbench;
