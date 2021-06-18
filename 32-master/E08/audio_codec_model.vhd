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

entity audio_codec_model is
  -- Defining the generic data operand width
  generic (data_width_g : integer := 16
           );
  port (
    aud_data_in     : in  std_logic;
    aud_bclk_in     : in  std_logic;
    aud_lrclk_in    : in  std_logic;
    rst_n           : in  std_logic;
    value_left_out  : out std_logic_vector(data_width_g-1 downto 0);
    value_right_out : out std_logic_vector(data_width_g-1 downto 0)
    );
end audio_codec_model;

-------------------------------------------------------------------------------

architecture codec_architecture of audio_codec_model is
  
  -- Enumeration type for the states
  type states_type is (wait_for_input, read_left, read_right);
  -- Signal to be used as register for current state
  signal present_state_r : states_type;
  -- Output value register
  signal value_out_r     : std_logic_vector(data_width_g -1 downto 0);

begin
  -- Implementation of a Finite State Machine using a synchronous process
  -- sensitive to lrclk
  audio_codec_fsm : process(rst_n, aud_lrclk_in, value_out_r)
  begin
    -- Checking for reset signal
    if (rst_n = '0') then
      -- Resetting the outputs and putting initial state
      present_state_r <= wait_for_input;
      value_left_out  <= (others => '0');
      value_right_out <= (others => '0');
	  
    -- Detecting the rising and falling edge of lrclk  
    elsif aud_lrclk_in'event then
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
end codec_architecture;
