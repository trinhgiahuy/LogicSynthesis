-------------------------------------------------------------------------------
-- Title      : TIE-50206 Logic Synthesis , Exercise 08
-- Project    : VHDL Test bench for audio codec controller
-------------------------------------------------------------------------------
-- File       : tb_audio_ctrl.vhd
-- Author     : Anh Huy Bui 293257 & Mohamed Ibrahim 292998
-- Company    : Tampere University
-- Created    : 2020-01-17
-- Last update: 2020-02-24
-- Platform   : 
-- Standard   : VHDL'93/02
-------------------------------------------------------------------------------
-- Description: Top level testbench to verify the correct functionality of the audio controller
--				This testbench also performs data validation between the fed in values and the output values
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

entity tb_audio_ctrl is
  -- Defining the generic operands data width, reference clock and sample rate
  generic (ref_clk_freq_g : integer := 20000000;
           sample_rate_g  : integer := 48000;
           data_width_g   : integer := 16
           );
end tb_audio_ctrl;

-------------------------------------------------------------------------------

architecture testbench of tb_audio_ctrl is
  -- Constants for the width and delay of the synchronous clear from 1 ms to 2 ms
  constant clear_delay_c    : integer := 20000;
  constant clear_duration_c : integer := 20000;

  -- Constant for data width
  constant width_c : integer := 16;

  -- Step values for left and right data
  constant step_left_c  : integer := 2;
  constant step_right_c : integer := 10;

  -- Reference clock period value 
  constant period_c : time := 50 ns;

  -- Internal signals for ourputs of the wave generators
  signal l_data_wg_actrl : std_logic_vector(data_width_g-1 downto 0);
  signal r_data_wg_actrl : std_logic_vector(data_width_g-1 downto 0);

  -- Internal signals for outputs of the audio controller
  signal aud_bit_clk : std_logic;
  signal aud_lr_clk  : std_logic;
  signal aud_data    : std_logic;

  -- Signals for the output of the audio codec model
  signal l_data_codec_tb : std_logic_vector(data_width_g-1 downto 0);
  signal r_data_codec_tb : std_logic_vector(data_width_g-1 downto 0);

  -- Signals for clock, reset and synchronous clear
  signal clk        : std_logic := '0';
  signal rst_n      : std_logic := '0';
  signal sync_clear : std_logic;
  
  -- Flag to check the correct output left data is not the same as the fed in value
  signal left_error : std_logic;
  
  -- Flag to check the correct output right data is not the same as the fed in value
  signal right_error : std_logic;

  -- Defining the wave generator component
  component wave_gen
    generic (
      width_g : integer;
      step_g  : integer);
    port (
      rst_n           : in  std_logic;
      clk             : in  std_logic;
      sync_clear_n_in : in  std_logic;
      value_out       : out std_logic_vector(width_g-1 downto 0));
  end component;

  -- Defining the audio controller component
  component audio_ctrl is
    generic (ref_clk_freq_g : integer;
             sample_rate_g  : integer;
             data_width_g   : integer
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
  end component;

  -- Defining the audio codec model component
  component audio_codec_model is
    generic (data_width_g : integer
             );
    port (
      aud_data_in     : in  std_logic;
      aud_bclk_in     : in  std_logic;
      aud_lrclk_in    : in  std_logic;
      rst_n           : in  std_logic;
      value_left_out  : out std_logic_vector(data_width_g-1 downto 0);
      value_right_out : out std_logic_vector(data_width_g-1 downto 0)
      );
  end component;

begin  -- testbench
  -- Clock and reset generation for the testbench
  clk   <= not clk after period_c/2;
  rst_n <= '1'     after period_c*4;

  -- Assigning the synchronous clear signal low from 1 ms to 2 ms
  sync_clear <= '1',
                '0' after period_c*clear_delay_c,
                '1' after period_c*(clear_delay_c+clear_duration_c);

  -- Instantiating the left wave generator and mapping I/Os 
  left_wave_gen : wave_gen
    generic map (
      width_g => width_c,
      step_g  => step_left_c
      )
    port map (
      rst_n           => rst_n,
      clk             => clk,
      sync_clear_n_in => sync_clear,
      value_out       => l_data_wg_actrl
      );

  -- Instantiating the right wave generator and mapping I/Os 
  right_wave_gen : wave_gen
    generic map (
      width_g => width_c,
      step_g  => step_right_c
      )
    port map (
      rst_n           => rst_n,
      clk             => clk,
      sync_clear_n_in => sync_clear,
      value_out       => r_data_wg_actrl
      );

  -- Instantiating the audio controller and mapping its I/Os
  audio_controller : audio_ctrl
    generic map (
      ref_clk_freq_g => ref_clk_freq_g,
      sample_rate_g  => sample_rate_g,
      data_width_g   => data_width_g
      )
    port map (
      left_data_in  => l_data_wg_actrl,
      right_data_in => r_data_wg_actrl,
      clk           => clk,
      rst_n         => rst_n,
      aud_bclk_out  => aud_bit_clk,
      aud_data_out  => aud_data,
      aud_lrclk_out => aud_lr_clk
      );

  -- Instantiating the audio codec model and mapping its I/Os
  audio_codec : audio_codec_model
    generic map (
      data_width_g => data_width_g
      )
    port map (
      aud_data_in     => aud_data,
      aud_bclk_in     => aud_bit_clk,
      aud_lrclk_in    => aud_lr_clk,
      rst_n           => rst_n,
      value_left_out  => l_data_codec_tb,
      value_right_out => r_data_codec_tb
      );
	
	checker_process : process (clk, rst_n)
	begin
	  if (rst_n = '0') then
	    right_error <= '0';
		left_error <= '0';
      
	  elsif (clk'event and clk='1') then
		-- In case of any difference in left data, 
		if (l_data_wg_actrl > l_data_codec_tb) or (l_data_wg_actrl < l_data_codec_tb) then
			-- Raise the left data flag
			left_error <= '1';
		end if;
		-- In case of any difference in right data, 
		if (r_data_wg_actrl > r_data_codec_tb) or (r_data_wg_actrl < r_data_codec_tb) then
			-- Raise the right data flag
			right_error <= '1';
		end if;
	  end if;
	end process checker_process;
	
	-- Checking for right data error
	assert right_error = '0' report "Right data error! The fed in value is different from the output value" severity error;
	-- Checking for left data error
	assert left_error = '0' report "Left data error! The fed in value is different from the output value" severity error;

end testbench;
