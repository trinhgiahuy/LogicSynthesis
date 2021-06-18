-------------------------------------------------------------------------------
-- Title      : TIE-50206 Logic Synthesis , Exercise 08
-- Project    : Audio_Codec_Model
-------------------------------------------------------------------------------
-- File       : audio_codec_model.vhd
-- Author     : Anh Huy Bui 293257 & Mohamed Ibrahim 292998
-- Company    : Tampere University
-- Created    : 2020-01-17
-- Last update: 2020-01-18
-- Platform   : 
-- Standard   : VHDL'93/02
-------------------------------------------------------------------------------
-- Description: A model for the audio codec
-------------------------------------------------------------------------------
-- Copyright (c) 2020 
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2020-01-17  1.0      vbmoad  Created
-------------------------------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity i2c_config is
  -- Defining the generic data operand width
  generic (ref_clk_freq_g : integer := 50000000;
		   i2c_freq_g	  : integer := 20000;
		   n_params_g	  : integer := 15;
		   n_leds_g	  : integer := 4;
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
  type states_type is (start_state, end_state, transmit_data, transmit_address, wait_for_acknowledgment);
  -- Signal to be used as register for current state
  signal present_state_r : states_type;
  
  
  -- Maximum limit for the i2c_sclk counter
  constant sclk_maximum_c     : integer := ref_clk_freq_g / (2 * i2c_freq_g);
  
  signal sclk_counter_r	: integer;
  
  -- Register to hold the value for the sclk generated in the process  
  signal sclk_r  : integer;
  
  
  -- dai_ctrl = 1000 0001 = 0h81

begin
  -- Implementation of a Finite State Machine using a synchronous process
  -- sensitive to lrclk
  i2c_fsm : process(rst_n, clk)
  begin
    -- Checking for reset signal
    if (rst_n = '0') then
      -- Resetting the outputs and putting initial state
      present_state_r <= wait_for_input;
      sclk_r           <= 0;
      sdat_inout  	   <= '0';
	  sclk_counter_r <= '0';
      finished_out  	   <= '0';
	  
    -- Detecting the rising and falling edge of lrclk  
    elsif clk'event then
	
      -- Checking if the sclk counter has reached the maximum limit
	  if sclk_counter_r = sclk_maximum_c then
	  
		sclk_counter_r <= 0;
		
        -- Inverting the sclk value, will be executed after process exits
        sclk_r <= not sclk_r;
		
		
		
		-- Detecting the rising edge of sclk
		else
			if (sclk_r = '0') then	-- Checking if sclk is/was '0' since it is not updated yet
		

			-- Add the data_out functionality
			
		
		end if;
		
--
-- The rest of the code still needs work now
--		
     
	 -- In case of rising edge, read from left
      if aud_lrclk_in = '0' then
        -- State transition
        present_state_r <= read_left;
        -- Output assigning
        value_left_out  <= value_out_r;
      -- In case of falling edge, read from right
      elsif aud_lrclk_in = '1' then
        -- State transition
        present_state_r <= read_right;
        -- Output assigning
        value_right_out <= value_out_r;
	  else
	    present_state_r <= wait_for_input;
		value_left_out  <= (others => '0');
        value_right_out <= (others => '0');
      end if;
    end if;
  end process audio_codec_fsm;
  
  -- Shifting process clocked by bclk
  bit_clocked_process : process(rst_n, aud_bclk_in)
  begin
	if (rst_n = '0') then
	  -- Resetting the register
	  value_out_r <= (others => '0');
    -- Checking for the rising edge of bclk
    elsif (aud_bclk_in'event and aud_bclk_in = '1') then
      -- Checking if we are not in the initial state
      if present_state_r /= wait_for_input then
        -- Shift the output left and put the input bit data at the LSB location
        value_out_r <= value_out_r(data_width_g-2 downto 0) & aud_data_in;
      end if;
    end if;
  end process bit_clocked_process;
end bus_controller_architecture;
