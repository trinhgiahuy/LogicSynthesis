-------------------------------------------------------------------------------
-- Title      : TIE-50206 Logic Synthesis , Exercise 06
-- Project    : Triangular wave generator
-------------------------------------------------------------------------------
-- File       : wave_generator.vhd
-- Author     : Anh Huy Bui 293257 & Mohamed Ibrahim 292998
-- Company    : Tampere University
-- Created    : 2019-11-28
-- Last update: 2019-12-08
-- Platform   : 
-- Standard   : VHDL'93/02
-------------------------------------------------------------------------------
-- Description: Adds different sizes of input operands
-------------------------------------------------------------------------------
-- Copyright (c) 2019 
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2019-11-14  1.0      vbmoad  Created
-------------------------------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use IEEE.math_real.all;


entity wave_gen is
  generic (width_g : integer;	-- Defining the generic width of the generated wave
		   frequency_g : integer;
		   ref_clk_g : integer;
		   step_g : integer);	-- Defining the generic step 
		   
  -- Defining synchronous clear input, clock & reset inputs and value_out output
  port (
    sync_clear_n_in : in  std_logic;	
    clk     : in  std_logic;
    rst_n   : in  std_logic;
    value_out : out std_logic_vector(width_g-1 downto 0));
end wave_gen;


-------------------------------------------------------------------------------

architecture triangular_wave of wave_gen is

  -- Constant values to convert real numbers to integers to use them in the equation
  --signal maximum_value : signed(width_g-1 downto 0) := to_signed();
  constant two_c : integer  := 2;
  constant one_c : integer  := 1;
  constant max_c       : integer := ((two_c**(width_g-one_c)-one_c)/ step_g)*step_g;
  --constant ref_clk_c : integer :=  50000000 ; -- Definging the reference clock frequency
  --constant frequency_c : integer := (step_g * 100000); -- Defining frequency as 1 MHz.
  constant s0_c		   : integer  := 0;
  constant c0_c		   : integer  := max_c;
  constant N_c		   : integer  := ref_clk_g / frequency_g;
  signal d_c		   : integer  := (two_c * two_c * max_c) / N_c;
  

  -- Creating signals to hold the maximum and minimum values
  signal cn_r			   : integer;
  signal sn_r			   : integer;
  
  signal scaled_wave : integer ;

begin  -- rtl design
  -- Clocked process for the wave generation
  wave_generation:process (rst_n, clk)
  
  begin
    -- Checking for reset signal
    if (rst_n = '0') then
      -- Resetting the internal signal
	  sn_r <= 0;
	  cn_r <= c0_c;
      
    elsif (clk'event and clk = '1') then
		-- Implementing the synchronous reset
		if (sync_clear_n_in = '0') then
			sn_r <= 0;
		else
			cn_r <= cn_r - d_c * sn_r / max_c;			
			sn_r <= sn_r + d_c * cn_r / max_c;
			if sn_r > max_c - d_c - 1 then
				sn_r <= max_c - d_c - 1;
				cn_r <= 0;
			elsif sn_r < -32638 then 
				sn_r <= -32638;
				cn_r <= 0;
			end if;
			
			
		end if;
    end if;
	
  end process;
 -- Assign the internal_wave_signal to the output of the wave generator
 value_out <= std_logic_vector(to_signed(sn_r, width_g));
end architecture triangular_wave;
