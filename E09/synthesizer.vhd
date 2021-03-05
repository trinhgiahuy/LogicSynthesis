-------------------------------------------------------------------------------
-- Title      : Exercise 9 : Synthesizer
-- Project    : 
-------------------------------------------------------------------------------
-- File       : synthesizer.vhd
-- Author     : Trinh Gia Huy, Rajesh Singapati
-- Company    : 
-- Created    : 2021-01-30
-- Last update: 2021-03-02
-- Platform   : 
-- Standard   : VHDL'93/02
-------------------------------------------------------------------------------
-- Description: <cursor>
-------------------------------------------------------------------------------
-- Copyright (c) 2021 
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author                  Description
-- 2021-01-30  1.0      Trinh Huy               Created
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity synthesizer is
  generic (
    clk_freq_g : integer := 12288000;
    sample_rate_g : integer := 48000;
    data_width_g : integer := 16 ;
    n_keys_g : integer := 4);
  port (
    clk,rst_n : in std_logic;
    keys_in : in std_logic_vector (n_keys_g -1 downto 0);
    aud_bclk_out : out std_logic;
    aud_data_out : out std_logic;
    aud_lrclk_out : out std_logic
    );

end entity synthesizer;

architecture RTL of synthesizer is
  signal wave_0, wave_1, wave_2, wave_3 : std_logic_vector (data_width_g - 1 downto 0);

  signal wave_input : std_logic_vector (data_width_g*n_keys_g -1 downto 0);
  signal wave_data : std_logic_vector (data_width_g - 1 downto 0);

  --Define components
  
  component wave_gen is
    generic (
      width_g : integer;
      step_g : integer
      );
    port (
      clk, rst_n, sync_clear_n_in : in std_logic;
      value_out : out std_logic_vector (width_g -1 downto 0)
      );
  end component wave_gen;

  
  component multi_port_adder is  
    generic (
      num_of_operands_g : integer := 4;
      operand_width_g : integer := 16
      );
    port (
      clk,rst_n : in std_logic;
      operands_in : in std_logic_vector (operand_width_g* num_of_operands_g - 1 downto 0);
      sum_out : out std_logic_vector (operand_width_g - 1 downto 0)
      );
  end component multi_port_adder;

  component audio_ctrl is
    generic (
      ref_clk_freq_g : integer := 12288000;
      sample_rate_g : integer := 48000;
      data_width_g : integer := 16
      );

    port(
      clk,rst_n : in std_logic;
      left_data_in, right_data_in : in std_logic_vector(data_width_g -1 downto 0);
      aud_bclk_out : out  std_logic;
      aud_data_out : out std_logic;
      aud_lrclk_out : out std_logic
      );
  end component audio_ctrl;

  -- Beigin architecture
begin
  wave_input <= wave_3 & wave_2 & wave_1 & wave_0;

  assert (n_keys_g = 4)
  report "There must be exactly 4 buttons"
  severity failure;


  -- instantiate component
  i_wave_gen_0 : entity work.wave_gen
    generic map (
      width_g => data_width_g,
      step_g => 1
      )
  port map (
    clk => clk,
    rst_n => rst_n,
    sync_clear_n_in => keys_in(0),
    value_out => wave_0
    );

  i_wave_gen_1 : entity work.wave_gen
    generic map (
      width_g => data_width_g,
      step_g => 2
      )
  port map (
    clk => clk,
    rst_n => rst_n,
    sync_clear_n_in => keys_in(1),
    value_out => wave_1
    );

  
  i_wave_gen_2 : entity work.wave_gen
    generic map (
      width_g => data_width_g,    
      step_g => 4
      )
  port map (
    clk => clk,
    rst_n => rst_n,
    sync_clear_n_in => keys_in(2),
    value_out => wave_2
    );
  
  i_wave_gen_3 : entity work.wave_gen
    generic map (
      width_g => data_width_g,
      step_g => 8
      )
  port map (
    clk => clk,
    rst_n => rst_n,
    sync_clear_n_in => keys_in(3),
    value_out => wave_3
    );

  i_multi_port_adder : multi_port_adder
    generic map (
      num_of_operands_g => n_keys_g,
      operand_width_g => data_width_g
      )
  port map  (
    clk => clk,
    rst_n => rst_n,
    operands_in => wave_input,
    sum_out => wave_data
    );

  i_audio_ctrl : entity work.audio_ctrl
    generic map (
      ref_clk_freq_g => clk_freq_g,
      data_width_g => data_width_g,
      sample_rate_g => sample_rate_g
      )
  port map (
    clk => clk,
    rst_n => rst_n,
    left_data_in => wave_data,
    right_data_in => wave_data,
    aud_lrclk_out => aud_lrclk_out,
    aud_data_out => aud_data_out,
    aud_bclk_out => aud_bclk_out  
    );

end architecture RTL;

  


  
  
  
