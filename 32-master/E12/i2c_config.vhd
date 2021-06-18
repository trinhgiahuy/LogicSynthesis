-------------------------------------------------------------------------------
-- Title      : TIE-50206 Logic Synthesis , Exercise 12
-- Project    : I2C Bus Controller 
-------------------------------------------------------------------------------
-- File       : i2c_config.vhd
-- Author     : Anh Huy Bui 293257 & Mohamed Ibrahim 292998
-- Company    : Tampere University
-- Created    : 2020-02-24
-- Last update: 2020-02-24
-- Platform   : 
-- Standard   : VHDL'93/02
-------------------------------------------------------------------------------
-- Description: I2C Bus Controller
-------------------------------------------------------------------------------
-- Copyright (c) 2020 
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2020-02-24  1.0      vbmoad	Created
-------------------------------------------------------------------------------



library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity i2c_config is
  -- Defining clock frequency parameters, num of registers and leds
  generic (ref_clk_freq_g : integer := 50000000;
		   i2c_freq_g	  : integer := 20000;
		   n_params_g	  : integer := 15;
		   n_leds_g	  : integer := 4
           );
  port (
    clk    		    	: in  std_logic;
	rst_n           	: in  std_logic;
    sdat_inout      	: inout  std_logic;	
	sclk_out 			: out std_logic;
    param_status_out	: out  std_logic_vector(n_leds_g-1 downto 0);
    finished_out 		: out std_logic
    );
end i2c_config;

-------------------------------------------------------------------------------

architecture bus_controller_architecture of i2c_config is
  
  -- Enumeration type for the states
  type states_type is (initial_state, start_state, end_state, transmit_data, device_address, register_address, wait_for_acknowledgment);
  -- Signal to be used as register for current state
  signal present_state_r : states_type;
  -- Signal to be used as register to store the state before assign to present_state_r
  signal temp_state_r : states_type;
  
   -- Signal for the number of states went through
  signal last_state_r : states_type;
  
  -- Maximum limit for the i2c_sclk counter
  constant sclk_maximum_c     : integer := ref_clk_freq_g / (2 * i2c_freq_g);
  
  -- Create sclk shifted that is same as sclk but with phase -pi/2 compare to sclk
  -- Maximum limit for the sclk_shifted_r counter
  constant sclk_shifted_limit_c     : integer := sclk_maximum_c/2; 
  constant start_stop_state_change_c     : integer := sclk_maximum_c/n_leds_g; 
  constant end_c     : integer := 2; 
 
  -- Signal for the sclk counter
  signal sclk_counter_r	: integer;
  -- Signal for the sclk_shifted_r counter
  signal sclk_counter_shifted_r : integer;
  -- Signal for the bit counter inside of each transmission state
  signal bit_counter_r	: integer;
  -- Signal for the register counter to counter until all registers and data are transmitted
  signal register_counter_r	: integer := 0;
  
  signal start_stop_counter_r	: integer := 0;
  -- Register to hold the value for the sdat_inout generated in the process 
  signal internal_sda_r: std_logic;
  
  -- Register to hold the value for the sclk generated in the process  
  signal sclk_r  : std_logic;
  -- Register to hold the value for the sclk_shifted generated in the process  
  signal sclk_shifted_r : std_logic;
  -- Register to hold the value for the sclk_shifted generated in the previous cycle  
  signal sclk_shifted_old_r : std_logic;
  -- Register to hold the value for the finished_out generated in the process    
  signal finished_out_r : std_logic ;
   
  -- Create an array to contain the registers and their data to transmit
  TYPE array_type is array (0 to 1, 0 to n_params_g-1) of std_logic_vector((2*n_leds_g)-1 downto 0);
  signal database_array : array_type ;
  
  -- device address
  signal audio_address_c: std_logic_vector((2*n_leds_g)-1 downto 0):= "00110100";
  -- dai_ctrl = 1000 0001 = 0h81

begin
	
   -- cif_ctrl
  database_array(0,0) <= "00011101";
  database_array(1,0) <= "10000000";
  -- pll_ctrl
  database_array(0, 1) <= "00100111";
  database_array(1, 1) <= "00000100";
  -- sr                        
  database_array(0, 2) <= "00100010";
  database_array(1, 2) <= "00001011";
  -- dai_clk_mode              
  database_array(0, 3) <= "00101000";
  database_array(1, 3) <= "00000000";
  -- dai_ctrl                  
  database_array(0, 4) <= "00101001";
  database_array(1, 4) <= "10000001";
  -- dac_l_ctrl                
  database_array(0, 5) <= "01101001";
  database_array(1, 5) <= "00001000";
  -- dac_r_ctrl                
  database_array(0, 6) <= "01101010";
  database_array(1, 6) <= "00000000";
  -- cp_ctrl                   
  database_array(0, 7) <= "01000111";
  database_array(1, 7) <= "11100001";
  -- hp_l_ctrl                 
  database_array(0, 8) <= "01101011";
  database_array(1, 8) <= "00001001";
  -- hp_r_ctrl                 
  database_array(0, 9) <= "01101100";
  database_array(1, 9) <= "00001000";
  -- mixout_l_select
  database_array(0, 10) <= "01001011";
  database_array(1, 10) <= "00001000";
  -- mixout_r_select            
  database_array(0, 11) <= "01001100";
  database_array(1, 11) <= "00001000";
  -- mixout_l_ctrl              
  database_array(0, 12) <= "01101110";
  database_array(1, 12) <= "10001000";
  -- mixout_r_ctrl              
  database_array(0, 13) <= "01101111";
  database_array(1, 13) <= "10001000";
  -- system_modes_output        
  database_array(0, 14) <= "01010001";
  database_array(1, 14) <= "11110001";
  
  -- Implementation of a Finite State Machine using a synchronous process
  i2c_fsm_state_process : process(rst_n, clk)
  begin
    -- Checking for reset signal
    if (rst_n = '0') then
      -- Resetting the outputs and putting initial state
 
      sclk_r           <= '0';
	  sclk_shifted_r <= '0';
 	  sclk_counter_r <= 0;
	  sclk_counter_shifted_r <= 0;
    -- Detecting the rising and falling edge of lrclk  
    elsif (clk'event and clk = '1') then
		-- Update sclk_shifted state in previous cycle
		sclk_shifted_old_r <= sclk_shifted_r;
		
		-- Generation of sclk_shifted
		-- "sclk_shifted_limit_c" is the value of 1/4 cycle, inverting point of "sclk_shifted"
		-- "sclk_shifted_r" is inverted after reaching "sclk_shifted_limit_c"
		
		if sclk_counter_shifted_r = sclk_shifted_limit_c then
			sclk_shifted_r <= not sclk_shifted_r;
			-- but the counter still increments
			sclk_counter_shifted_r <= sclk_counter_shifted_r + 1;
			
		-- Reset counter when it reaches 2*"sclk_shifted_limit_c"
		elsif sclk_counter_shifted_r >= sclk_shifted_limit_c*2 then 
			sclk_counter_shifted_r <= 0;
			
		-- the counter increments
		else
			sclk_counter_shifted_r <= sclk_counter_shifted_r + 1; 
		end if;
		
		-- Generation of sclk
		-- Checking if the sclk counter has reached the maximum limit
	    if sclk_counter_r = sclk_maximum_c then
			-- Reset "sclk_counter_r" to start new cycle
			sclk_counter_r <= 0;
			
			-- Inverting the sclk value, will be executed after process exits
			sclk_r <= not sclk_r;
		
		else
			-- Increment the counter when it does not reach maximum yet
			sclk_counter_r <= sclk_counter_r + 1;
			
		end if;
    end if;

  end process i2c_fsm_state_process;

 
  
		
  -- Output process clocked by clk
  output_process : process(rst_n, clk)
  begin
  
	if (rst_n = '0') then
		internal_sda_r <= '1';
		finished_out_r <= '0';
		present_state_r <= initial_state;
		temp_state_r <= initial_state;
		bit_counter_r <= 2*n_leds_g;
		register_counter_r <= 0;
	elsif (clk'event and clk = '1') then 
			-- Output is pushed on "sclk_shifted" rising edge
			-- which is a quarter cycle early to "sclk" rising edge
		  if sclk_shifted_r = '1' and sclk_shifted_old_r = '0' then	-- Checking if sclk is/was '0' since it is not updated yet
					
				-- Transition between states
				CASE present_state_r is
				
				
				when device_address =>
					-- Checking all 8 bits of byte are transmitted, wait for ACK
					if bit_counter_r = (0) then
						present_state_r <= wait_for_acknowledgment;
						last_state_r <= present_state_r;
						internal_sda_r <= 'Z';
						bit_counter_r <= 2*n_leds_g;
					else
						internal_sda_r <= audio_address_c(bit_counter_r - 1);
						bit_counter_r <= bit_counter_r - 1;
					end if;
				when register_address =>
					-- Checking all 8 bits of byte are transmitted, wait for ACK
					if bit_counter_r = (0) then
						present_state_r <= wait_for_acknowledgment;
						last_state_r <= present_state_r;
						internal_sda_r <= 'Z';
						bit_counter_r <= 2*n_leds_g;
					else 
						internal_sda_r <= database_array(0,register_counter_r)(bit_counter_r - 1);
						bit_counter_r <= bit_counter_r - 1;
					end if;
				when transmit_data =>
					-- Checking all 8 bits of byte are transmitted, wait for ACK
					if bit_counter_r = (0) then
						present_state_r <= wait_for_acknowledgment;
						last_state_r <= present_state_r;
						internal_sda_r <= 'Z';
						bit_counter_r <= 2*n_leds_g;
					else
						internal_sda_r <= database_array(1,register_counter_r)(bit_counter_r - 1);
						bit_counter_r <= bit_counter_r - 1;
					end if;				
				when wait_for_acknowledgment =>
					present_state_r <= temp_state_r;
				when others =>
					present_state_r <= present_state_r;
				END CASE;
			end if;
			
		if sclk_r = '1' then		
			CASE present_state_r is
				when start_state =>			
					if start_stop_counter_r = start_stop_state_change_c then
						start_stop_counter_r <= 0;
						if register_counter_r = n_params_g then
							finished_out_r <= '1';
							present_state_r <= present_state_r;
						else 
							internal_sda_r <= '0';
							present_state_r <= device_address;
						end if;
					else 
						start_stop_counter_r <= start_stop_counter_r +1;
					end if;
				when end_state =>
					-- increments register counter to transmit the next register data
					
					if start_stop_counter_r = start_stop_state_change_c then
						start_stop_counter_r <= 0;
						internal_sda_r <= '0';
						register_counter_r <= register_counter_r + 1;
						bit_counter_r <= 2*n_leds_g;
						
						-- If all registers are transmitted, send the finish flag
						
						present_state_r <= initial_state;
					else 
						start_stop_counter_r <= start_stop_counter_r +1;
					end if;
					
					
				-- Raise the sda to high so as to trigger rising/falling edge (end/start condition)
				when initial_state =>
					if start_stop_counter_r = start_stop_state_change_c then
						start_stop_counter_r <= 0;
						internal_sda_r <= '1';
						bit_counter_r <= 2*n_leds_g;
						present_state_r <= start_state;
					else 
						start_stop_counter_r <= start_stop_counter_r +1;
					end if;
				when wait_for_acknowledgment =>
					-- If ACK has been received, the next state is end_state
					-- it is now assigned to present state
					internal_sda_r <= sdat_inout;
					if sdat_inout = '0' then
						-- Checking the byte that needs to transmit next 
						-- Or end transmission if 3 bytes are transmitted
						-- Store the next state (next byte in "temp_state_r"
						-- so as to assign it to present_state_r on rising edge
						if last_state_r = device_address then
							present_state_r <= register_address;
						elsif last_state_r = register_address then
							present_state_r <= transmit_data;
						else
							if sclk_shifted_r = '0' and sclk_shifted_old_r = '1' then
								temp_state_r <= end_state;
							end if;
						end if;
						
					-- If NACK received and other cases
					elsif sdat_inout = '1' then
						temp_state_r <= initial_state;
					elsif sdat_inout = 'Z' then
						temp_state_r <= present_state_r;
					else
						temp_state_r <= present_state_r;
					end if;
				when others =>
					present_state_r <= present_state_r;
			END CASE;	
		end if;	
    end if;
  end process output_process;
   -- Push sclk register to output
  sclk_out <= sclk_r;
  -- Output is pushed from internal register
  finished_out <= finished_out_r;
  sdat_inout <= internal_sda_r;
  param_status_out <= std_logic_vector(to_unsigned(register_counter_r, n_leds_g));

end bus_controller_architecture;
