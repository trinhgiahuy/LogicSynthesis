-------------------------------------------------------------------------------
-- Title      : TIE-50206 Logic Synthesis , Exercise 08
-- Project    : Audio codec controller
-------------------------------------------------------------------------------
-- File       : audio_ctrl.vhd
-- Author     : Anh Huy Bui 293257 & Mohamed Ibrahim 292998
-- Company    : Tampere University
-- Created    : 2020-01-17
-- Last update: 2020-01-17
-- Platform   : 
-- Standard   : VHDL'93/02
-------------------------------------------------------------------------------
-- Description: Audio Controller for the DA7212 Audio codec 
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

entity audio_ctrl is
  -- Defining the generic data operand width, reference clock frequency and
  -- sample rate
  generic (ref_clk_freq_g : integer := 12288000;
           sample_rate_g  : integer := 48000;
           data_width_g   : integer := 16
           );
  port (
    left_data_in  : in  std_logic_vector(data_width_g -1 downto 0);
    right_data_in : in  std_logic_vector(data_width_g -1 downto 0);
    clk           : in  std_logic;
    rst_n         : in  std_logic;
    aud_bclk_out  : out std_logic;
    aud_data_out  : out std_logic;
    aud_lrclk_out : out std_logic
    );
end audio_ctrl;

-------------------------------------------------------------------------------

architecture audio_ctrl_architecture of audio_ctrl is

  -- Constant to use in the division of counters between bit and word
  constant two_words : integer := integer(32);

  -- Counter for the bit clock process
  signal b_counter  : integer;
  -- Counter for the word clock process
  signal lr_counter : integer;

  -- Maximum limit for the word frequency counter
  signal word_frequency_divider : integer := ref_clk_freq_g / sample_rate_g;
  -- Maximum limit for the bit frequency counter
  signal bit_frequency_divider  : integer := ref_clk_freq_g / (sample_rate_g * two_words);

  -- Registers to hold the snapshots data
  signal data_snapshot_word_r : std_logic_vector(data_width_g -1 downto 0);
  signal data_snapshot_bit_r  : std_logic_vector(data_width_g -1 downto 0);

  -- Register to hold the output data of the two clocks
  signal aud_bclk_out_r  : std_logic;
  signal aud_lrclk_out_r : std_logic;
  
begin  
  -- Clocked process for bclk creation
  bclk_process : process(rst_n, clk)
  begin
    -- Checking for reset signal
    if (rst_n = '0') then
      -- Resetting the internal signals, counter and outputs
      b_counter           <= 0;  
    elsif (clk'event and clk = '1') then
	  
      -- Checking if the bit counter has reached the maximum limit
      if b_counter = bit_frequency_divider-1 then
        -- Resetting bit counter
        b_counter      <= 0;
        -- Inverting the bit clock value
        aud_bclk_out_r <= not aud_bclk_out_r;
		if aud_bclk_out_r = '0' then
			bclk_flag <= '1';
		end if;
      else
        -- If counter has not reached the maximum value, increment coutner
        b_counter <= b_counter + 1;
      end if;
	end if;
	-- Assigning the MSB of the shifted signal to the bit data output
	aud_data_out <= data_snapshot_bit_r(data_width_g-1);
  end process bclk_process;

  data_process : process(rst_n, clk)
    begin
	if (rst_n = '0') then
	  data_snapshot_bit_r <= (others => '0');
	  aud_bclk_out_r      <= '0';
	  aud_data_out        <= '0';
	elsif (clk'event and clk = '1') then
	
	  -- Detecting the rising edge of bclock
	  if (bclk_flag = '1') then
        -- Shifting the snapshot to the left and extracting one bit each bit
        -- clock cycle
        data_snapshot_bit_r(data_width_g-1 downto 1) <= data_snapshot_bit_r(data_width_g-2 downto 0);
        data_snapshot_bit_r(0)                       <= '0';
	  end if;
	  
	  -- Checking if the word clock changes
      if wclk_flag  then
        -- Loading new 16 bits to be shifted and extracted bit by bit
        data_snapshot_bit_r <= data_snapshot_word_r;
	  --elsif aud_lrclk_out_r'Event and aud_lrclk_out_r = '1' then
	    -- Loading new 16 bits to be shifted and extracted bit by bit
        --data_snapshot_bit_r <= data_snapshot_word_r;
      end if; 
	  
	end process data_process;   


  -- Clocked process for lrclk creation
  wclk_process : process(rst_n, clk)
  begin
    -- Checking for reset signal
    if (rst_n = '0') then
      -- Resetting the internal signals and counter
      aud_lrclk_out_r      <= '1';
      lr_counter           <= 0;
      data_snapshot_word_r <= (others => '0');
	  
    elsif (clk'event and clk = '1') then
      -- Checking if the word counter has reached the maximum limit
      if lr_counter = word_frequency_divider-1 then
        -- Resetting the word counter
        lr_counter      <= 0;
        -- Inverting the word clock value
        aud_lrclk_out_r <= not aud_lrclk_out_r;
		
        -- Checking for the 'low' half of the word cycle to read from the right data 
        if aud_lrclk_out_r = '0' then
          data_snapshot_word_r <= left_data_in;
		 
        -- Else, the 'high' half of the word cycle to read from the right data
        else
          data_snapshot_word_r <= right_data_in;
        end if;
		
      else
        -- If counter has not reached the maximum value, increment coutner
        lr_counter <= lr_counter + 1;
      end if;
    end if;
  end process wclk_process;

  -- Assigning both the internal signals for bclk and lrclk to the outputs
  aud_bclk_out  <= aud_bclk_out_r;
  aud_lrclk_out <= aud_lrclk_out_r;

end audio_ctrl_architecture;
