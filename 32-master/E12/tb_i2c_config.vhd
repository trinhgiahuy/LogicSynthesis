-------------------------------------------------------------------------------
-- Title      : TIE-50206 Logic Synthesis , Exercise 12
-- Project    : I2C controller testbench
-------------------------------------------------------------------------------
-- File       : tb_i2c_config.vhd
-- Author     : Anh Huy Bui 293257 & Mohamed Ibrahim 292998
-- Company    : Tampere University
-- Created    : 2020-02-24
-- Last update: 2020-02-27
-- Platform   : 
-- Standard   : VHDL'93/02
-------------------------------------------------------------------------------
-- Description: A testbench for the I2C Bus Controller
-------------------------------------------------------------------------------
-- Copyright (c) 2020 
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2020-02-24  1.0      vbmoad  Created
-------------------------------------------------------------------------------



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

  -- Every transmission consists several bytes and every byte contains given
  -- amount of bits. 
  constant n_bytes_c       : integer                                      := 3;
  constant bit_count_max_c : integer                                      := 8;
  -- Signal to hold the device address "0011 1000"
  constant audio_address_c : std_logic_vector(bit_count_max_c-1 downto 0) := "00110100";

  -- These values are used for simulation of NACK in 3 different states
  constant NACK_device_address_c   : integer := 5;
  constant NACK_register_address_c : integer := 8;
  constant NACK_data_c             : integer := 12;

  -- Signals fed to the DUV
  signal clk   : std_logic := '0';  -- Remember that default values supported
  signal rst_n : std_logic := '0';      -- only in synthesis

  -- The DUV prototype
  component i2c_config
    generic (
      ref_clk_freq_g : integer;
      i2c_freq_g     : integer;
      n_params_g     : integer;
      n_leds_g       : integer);
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
  signal bit_counter_r  : integer range 0 to bit_count_max_c;
  signal byte_counter_r : integer range 0 to n_bytes_c-1;

  -- States for the FSM
  type states is (wait_start, read_byte, send_ack, wait_stop);
  signal curr_state_r : states;

  -- Previous values of the I2C signals for edge detection
  signal sdat_old_r : std_logic;
  signal sclk_old_r : std_logic;

  -- Register to store received byte
  signal byte_receiver_r : std_logic_vector(bit_count_max_c-1 downto 0);

  -- Signal to flag an error in the device address "Audio device address 0011 1000"
  signal device_address_error_r   : integer := 0;
  -- Signals to check the register address and its corresponding data
  signal register_address_error_r : integer := 0;
  signal data_error_r             : integer := 0;


  signal transmission_counter_r : integer := 0;

  -- Registers to hold the values received from the bus controller
  -- these values will be checked against the reference values
  signal address_holder_r : std_logic_vector(bit_count_max_c-1 downto 0);
  signal data_holder_r    : std_logic_vector(bit_count_max_c-1 downto 0);

  signal previous_address_holder_r : std_logic_vector(bit_count_max_c-1 downto 0);

begin  -- testbench

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
      n_leds_g       => n_leds_c)
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
  begin  -- process fsm_proc
    if rst_n = '0' then                 -- asynchronous reset (active low)

      curr_state_r <= wait_start;
      sdat_old_r   <= '0';
      sclk_old_r   <= '0';

      -- Initializing counters and data holder registers
      byte_counter_r            <= 0;
      bit_counter_r             <= 0;
      data_holder_r             <= (others => '0');
      address_holder_r          <= (others => '0');
      previous_address_holder_r <= (others => '0');
      sdat_r                    <= 'Z';

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
          sdat_r <= '0';

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
          sdat_r <= 'Z';
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


            if bit_counter_r < bit_count_max_c then

              byte_receiver_r <= byte_receiver_r(bit_count_max_c-2 downto 0) & sdat;

              -- Normally just receive a bit
              bit_counter_r <= bit_counter_r + 1;

            else
              -- 1st byte, check for device address
              if byte_counter_r = 0 then
                if byte_receiver_r < audio_address_c or byte_receiver_r > audio_address_c then
                  device_address_error_r <= device_address_error_r + 1;
                end if;
              -- 2nd byte, check register address
              elsif byte_counter_r = 1 then


                -- Checking if there was no NACK before, and this is not an old register address resent
                if previous_address_holder_r = "00000000" then
                  address_holder_r <= byte_receiver_r;
                  case byte_receiver_r is
					-- Store data that come with received address
                    when "00011101" =>
                      data_holder_r <= "10000000";
                    when "00100111" =>
                      data_holder_r <= "00000100";
                    when "00100010" =>
                      data_holder_r <= "00001011";
                    when "00101000" =>
                      data_holder_r <= "00000000";
                    when "00101001" =>
                      data_holder_r <= "10000001";
                    when "01101001" =>
                      data_holder_r <= "00001000";
                    when "01101010" =>
                      data_holder_r <= "00000000";
                    when "01000111" =>
                      data_holder_r <= "11100001";
                    when "01101011" =>
                      data_holder_r <= "00001001";
                    when "01101100" =>
                      data_holder_r <= "00001000";
                    when "01001011" =>
                      data_holder_r <= "00001000";
                    when "01001100" =>
                      data_holder_r <= "00001000";
                    when "01101110" =>
                      data_holder_r <= "10001000";
                    when "01101111" =>
                      data_holder_r <= "10001000";
                    when "01010001" =>
                      data_holder_r <= "11110001";
                    when others =>
                                        -- In case the register address is not recognized,
                                        -- incremenet register address counter
                      register_address_error_r <= register_address_error_r + 1;
                  end case;
                -- If last transmission failed, that register address has to be resent
                else
                  if byte_receiver_r /= previous_address_holder_r then
                    register_address_error_r <= register_address_error_r + 1;
                  end if;
                                        -- Clear the address_holder_r
                  previous_address_holder_r <= (others => '0');
                end if;
              -- 3rd byte, check for data contents
              elsif byte_counter_r = 2 then
                if byte_receiver_r < data_holder_r or byte_receiver_r > data_holder_r then
                  data_error_r <= data_error_r + 1;
                end if;
              end if;

              -- When terminal count is reached, let's send the ack
              curr_state_r  <= send_ack;
              bit_counter_r <= 0;

            end if;  -- Bit counter terminal count

          end if;  -- sclk rising clock edge

        --------------------------------------------------------------------
        -- Send acknowledge
        when send_ack =>
          -- Simulation transmission failed after 8 bits of device address of 5th transmission 
          -- Simulation transmission failed after 8 bits of register address of 8th transmission 
          if (transmission_counter_r = NACK_register_address_c and byte_counter_r = 1)
            or (transmission_counter_r = NACK_device_address_c) then
            -- Send NACK
            sdat_r <= '1';

            -- If clock is not high yet, wait for start condition
            if sclk_old_r = '0' then
              byte_counter_r         <= 0;
              curr_state_r           <= wait_start;
              transmission_counter_r <= transmission_counter_r + 1;
            end if;
          -- Simulation transmission failed after 8 bits of data of 12th transmission 
          elsif (transmission_counter_r = NACK_data_c and byte_counter_r = 2)then

                                        -- Send NACK
            sdat_r                    <= '1';
                                        -- Store transmitted address to check if the register address is resent
            previous_address_holder_r <= address_holder_r;

                                        -- If clock is not high yet, wait for start condition
            if sclk_old_r = '0' then
              byte_counter_r         <= 0;
              curr_state_r           <= wait_start;
              transmission_counter_r <= transmission_counter_r + 1;
            end if;
          -- send ACK
          else
            sdat_r <= '0';
            -- Transmission continues
            if sclk_old_r = '1' and sclk = '0' then
              sdat_r <= 'Z';
              if byte_counter_r < n_bytes_c-1 then
                byte_counter_r <= byte_counter_r + 1;
                curr_state_r   <= read_byte;
              else
                                        -- Transmission is about to stop
                byte_counter_r <= 0;
                curr_state_r   <= wait_stop;
              end if;
            end if;
          end if;


        ---------------------------------------------------------------------
        -- Wait for the stop condition
        when wait_stop =>
          sdat_r <= 'Z';
          -- Stop condition detection: sdat rises while sclk stays high
          if sclk = '1' and sclk_old_r = '1' and
            sdat_old_r = '0' and sdat = '1' then
            transmission_counter_r <= transmission_counter_r + 1;
            curr_state_r           <= wait_start;
          end if;
      end case;
    end if;
  end process fsm_proc;

  -----------------------------------------------------------------------------
  -- Asserts for verification
  -----------------------------------------------------------------------------

  -- SDAT should never contain X:s.
  assert sdat /= 'X' report "Three state bus in state X" severity error;
  -- In case of any device address errors
  assert device_address_error_r = 0 report "Device Address was not received correctly" severity error;
  -- In case of any register address errors
  assert register_address_error_r = 0 report "Register Address was not received correctly" severity error;
  -- In case of any configuration data errors
  assert data_error_r = 0 report "Data Value was not received correctly" severity error;

  -- End of simulation, but not during the reset and not until the controller says it is finished
  assert finished = '0' or rst_n = '0' report
    "Simulation done" severity failure;

end testbench;
