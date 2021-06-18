-------------------------------------------------------------------------------
-- Title      : TIE-50206 Logic Synthesis , Exercise 08
-- Project    : VHDL Test bench for audio codec controller
-------------------------------------------------------------------------------
-- File       : tb_audio_ctrl.vhd
-- Author     : Anh Huy Bui 293257 & Mohamed Ibrahim 292998
-- Company    : Tampere University
-- Created    : 2020-01-17
-- Last update: 2020-01-17
-- Platform   : 
-- Standard   : VHDL'93/02
-------------------------------------------------------------------------------
-- Description: Top level testbench to verify the correct functionality of the audio controller
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

entity synthesizer is 
  -- Defining the generic operands data width, reference clock and sample rate
  generic (clk_freq_g : integer := 12288000;
           sample_rate_g  : integer := 48000;
           data_width_g   : integer := 16;
		   n_keys_g		  : integer := 4
           );
  port (
    keys_in  	  : in  std_logic_vector(n_keys_g -1 downto 0);
    clk           : in  std_logic;
    rst_n         : in  std_logic;
    aud_bclk_out  : out std_logic;
    aud_data_out  : out std_logic;
    aud_lrclk_out : out std_logic
    );
end  synthesizer;

-------------------------------------------------------------------------------

architecture structural of  synthesizer is

  -- Internal signals for ourputs of the wave generators
  signal wave_gen_outputs : std_logic_vector((n_keys_g*data_width_g)-1 downto 0);

  -- Internal signals for output of the multi port adder
  signal sum_out_internal : std_logic_vector(data_width_g-1 downto 0);

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

  -- Defining the multiport adder component
  component multi_port_adder is
  -- Defining the generic operands width
  generic (operand_width_g   : integer := 16;
           num_of_operands_g : integer := 4);
  -- 
  port (
    operands_in : in  std_logic_vector((operand_width_g*num_of_operands_g)-1 downto 0);
    sum_out     : out std_logic_vector(operand_width_g-1 downto 0);
    clk         : in  std_logic;
    rst_n       : in  std_logic);
end component;


begin  -- structural

  -- Instantiating the left 4 wave generator components and mapping their I/Os and generics
  generate_wave_gen : FOR step IN 0 TO 3 GENERATE
    i_wave : wave_gen
      generic map (
        width_g => data_width_g,
        step_g  => 2**step
        )
      port map (
        rst_n           => rst_n,
        clk             => clk,
        sync_clear_n_in => keys_in(step),
        value_out       => wave_gen_outputs(((step+1)*(data_width_g)-1) downto step*data_width_g)
        );
  END GENERATE generate_wave_gen;
  
  -- Instantiating the multi port adder and mapping its I/Os
  multiport_adder : multi_port_adder
    generic map (
	  operand_width_g 	=> data_width_g,
	  num_of_operands_g => n_keys_g
	  )
	port map (
	  operands_in 	=> wave_gen_outputs,
	  sum_out		=> sum_out_internal,
	  clk           => clk,
      rst_n         => rst_n
	);
	
  -- Instantiating the audio controller and mapping its I/Os
  audio_controller : audio_ctrl
    generic map (
      ref_clk_freq_g => clk_freq_g,
      sample_rate_g  => sample_rate_g,
      data_width_g   => data_width_g
      )
    port map (
      left_data_in  => sum_out_internal,
      right_data_in => sum_out_internal,
      clk           => clk,
      rst_n         => rst_n,
      aud_bclk_out  => aud_bclk_out,
      aud_data_out  => aud_data_out,
      aud_lrclk_out => aud_lrclk_out
      );

end structural;
