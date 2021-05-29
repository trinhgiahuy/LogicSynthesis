-------------------------------------------------------------------------------
-- Title      : Simple testbench for the audio synthesizer.
--              Note! No automatic checking!
--              You must "manually" check the waveforms, which is not nice.
-- Project    : 
-------------------------------------------------------------------------------
-- File       : tb_synthesizer.vhd
-- Author     : Erno Salminen  <ege@tiibetinhanhi.cs.tut.fi>
-- Company    : 
-- Last update: 2019-01-13
-- Platform   : 
-------------------------------------------------------------------------------
-- Description: 
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2009/02/12  1.0      ege     Created
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.all;


entity tb_synthesizer is

end tb_synthesizer;


architecture structural of tb_synthesizer is

  component synthesizer
    generic (
      clk_freq_g    : integer;
      sample_rate_g : integer;
      data_width_g  : integer;
      n_keys_g      : integer);
    port (
      clk           : in  std_logic;
      rst_n         : in  std_logic;
      keys_in       : in  std_logic_vector(n_keys_g-1 downto 0);
      aud_bclk_out  : out std_logic;
      aud_lrclk_out : out std_logic;
      aud_data_out  : out std_logic);
  end component;

  component audio_codec_model
    generic (
      data_width_g : integer);
    port (
      rst_n           : in  std_logic;
      aud_bclk_in     : in  std_logic;
      aud_lrclk_in    : in  std_logic;
      aud_data_in     : in  std_logic;
      value_left_out  : out std_logic_vector(data_width_g-1 downto 0);
      value_right_out : out std_logic_vector(data_width_g-1 downto 0));
  end component;

  --constant clk_freq_c    : integer := 20000000;
  constant clk_freq_c    : integer := 12288000;
  constant sample_rate_c : integer := 48000;
  constant data_width_c  : integer := 16;
  constant n_keys_c      : integer := 4;


  constant clk_period_c : time      := 50 ns;  -- i.e. 20 MHz
  signal clk            : std_logic := '0';    -- global clock
  signal rst_n          : std_logic := '0';    -- low active reset

  signal keys_tb_synth : std_logic_vector (n_keys_c-1 downto 0);

  signal aud_bclk_synth_model  : std_logic;
  signal aud_lrclk_synth_model : std_logic;
  signal aud_data_synth_model  : std_logic;
  signal value_left_model_tb   : std_logic_vector (data_width_c-1 downto 0);
  signal value_right_model_tb  : std_logic_vector (data_width_c-1 downto 0);


  signal counter_r         : integer;
  constant button_period_c : integer := 2**data_width_c * 10;


begin  -- structural



  clk   <= not clk after clk_period_c/2;  -- kellon generointi
  rst_n <= '1'     after 4*clk_period_c;  -- reset pois neljän kellojakson jälkeen

  i_duv_synth : synthesizer
    generic map (
      clk_freq_g    => clk_freq_c,
      sample_rate_g => sample_rate_c,
      data_width_g  => data_width_c,
      n_keys_g      => n_keys_c
      )
    port map (
      clk           => clk,
      rst_n         => rst_n,
      keys_in       => keys_tb_synth,
      aud_bclk_out  => aud_bclk_synth_model,
      aud_lrclk_out => aud_lrclk_synth_model,
      aud_data_out  => aud_data_synth_model
      );


  i_acm : audio_codec_model
    generic map (
      data_width_g => data_width_c)
    port map (
      rst_n           => rst_n,
      aud_bclk_in     => aud_bclk_synth_model,
      aud_lrclk_in    => aud_lrclk_synth_model,
      aud_data_in     => aud_data_synth_model,
      value_left_out  => value_left_model_tb,
      value_right_out => value_right_model_tb
      );


  press_buttons : process (clk, rst_n)
  begin  -- process press_buttons
    if rst_n = '0' then                 -- asynchronous reset (active low)

      counter_r     <= 0;
      --keys_tb_synth <= (others => '1');
      keys_tb_synth <= (others => '0');  --oh

    elsif clk'event and clk = '1' then  -- rising clock edge

      if counter_r = button_period_c then
        counter_r     <= 0;
        --keys_tb_synth <= not std_logic_vector (unsigned(not keys_tb_synth)+1);
        --keys_tb_synth <= std_logic_vector (unsigned(keys_tb_synth)-1); 
        keys_tb_synth <= std_logic_vector (unsigned(keys_tb_synth)+1);  --oh

      else
        counter_r <= counter_r + 1;
      end if;


    end if;
  end process press_buttons;


end structural;
