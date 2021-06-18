-------------------------------------------------------------------------------
-- Title      : TIE-50206 Logic Synthesis , Exercise 08
-- Project    : Audio codec controller
-------------------------------------------------------------------------------
-- File       : audio_ctrl.vhd
-- Author     : Anh Huy Bui 293257 & Mohamed Ibrahim 292998
-- Company    : Tampere University
-- Created    : 2020-01-17
-- Last update: 2020-01-25
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

architecture rtl of audio_ctrl is

  -- Constant to use in the division of counters between bit and word
  constant two_words_c : integer := 2 * data_width_g;

  -- Maximum limit for the word frequency counter
  constant word_frequency_divider_c : integer := ref_clk_freq_g / (2 * sample_rate_g);
  -- Maximum limit for the bit frequency counter
  constant bit_frequency_divider_c  : integer := ref_clk_freq_g / (sample_rate_g * two_words_c);

  -- Counter for the bit clock process
  signal b_counter_r  : integer;
  -- Counter for the word clock process
  signal lr_counter_r : integer;

  -- Registers to hold the snapshots data
  signal data_snapshot_word_r : std_logic_vector(data_width_g -1 downto 0);
  signal data_snapshot_bit_r  : std_logic_vector(data_width_g -1 downto 0);

  -- Register to hold the output data of the two clocks
  signal aud_bclk_out_r  : std_logic;
  signal aud_lrclk_out_r : std_logic;

  -- Flag signal to detect the edges of lr_clk with default value '0'
  signal lrclk_flag_r		 : std_logic := '0';

begin

  -- Clocked process for bclk creation
  bclk_process : process(rst_n, clk)
  begin
    -- Checking for reset signal
    if (rst_n = '0') then
      -- Resetting the internal signals, counter and outputs
      aud_data_out        <= '0';
      aud_bclk_out_r      <= '0';
      b_counter_r           <= 0;
      data_snapshot_bit_r <= (others => '0');
	  
    elsif (clk'event and clk = '1') then
	  
	  -- Checking if wclk changes in order to fetch the new data snapshot
	  if lrclk_flag_r ='1' then
		-- Loading new 16-bit data snapshot to be shifted and extracted bit by bit
		data_snapshot_bit_r <= data_snapshot_word_r;
	  end if;

      -- Checking if the bit counter has reached the maximum limit
      if b_counter_r = bit_frequency_divider_c-1 then
        -- Resetting bit counter
        b_counter_r      <= 0;
        -- Inverting the bit clock value, will be executed after process exits
        aud_bclk_out_r <= not aud_bclk_out_r;
		
		-- Detecting the rising edge of bclock
		if (aud_bclk_out_r = '0') then	-- Checking if bclk_out is/was '0' since it is not updated yet
		
			-- Shifting the snapshot to the left and extracting one bit each bit
			-- clock cycle
			data_snapshot_bit_r(data_width_g-1 downto 1) <= data_snapshot_bit_r(data_width_g-2 downto 0);
			data_snapshot_bit_r(0)                       <= '0';
		end if;
		
      else
        -- If counter has not reached the maximum value, increment coutner
        b_counter_r <= b_counter_r + 1;
      end if;
	  
	-- Assigning the MSB of the shifted signal to the bit data output
    aud_data_out <= data_snapshot_bit_r(data_width_g-1);
	end if;
  end process bclk_process;
  
  -- Clocked process for lrclk creation
  wclk_process : process(rst_n, clk) 
  begin
  
	
    -- Checking for reset signal
    if (rst_n = '0') then
      -- Resetting the internal signals and counter
      aud_lrclk_out_r      <= '1';
      lr_counter_r           <= 0;
      data_snapshot_word_r <= (others => '0');
	  
    elsif (clk'event and clk = '1') then
	  -- Initializing the lrclk flag with '0'
	  lrclk_flag_r <= '0';
	  
      -- Checking if the word counter has reached the maximum limit
      if lr_counter_r = word_frequency_divider_c-1 then
        -- Resetting the word counter
        lr_counter_r      <= 0;
        -- Inverting the word clock value
        aud_lrclk_out_r <= not aud_lrclk_out_r;
		
		-- In case of lrclk inversion, flag goes high
		lrclk_flag_r <= '1';
		
        -- Checking for the 'low' half of the word cycle to read from the right data 
        if aud_lrclk_out_r = '0' then
          data_snapshot_word_r <= left_data_in;
		  
        -- Else, the 'high' half of the word cycle to read from the right data
        else
          data_snapshot_word_r <= right_data_in;
        end if;
		
      else
        -- If counter has not reached the maximum value, increment coutner
        lr_counter_r <= lr_counter_r + 1;
      end if;
    end if;
  end process wclk_process;


  -- Assigning both the internal signals for bclk and lrclk to the outputs
  aud_bclk_out  <= aud_bclk_out_r;
  aud_lrclk_out <= aud_lrclk_out_r;

end rtl;
