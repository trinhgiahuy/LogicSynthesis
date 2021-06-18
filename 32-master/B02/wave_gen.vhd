-------------------------------------------------------------------------------
-- Title      : TIE-50206 Logic Synthesis , Bonus 02
-- Project    : Sine wave generator
-------------------------------------------------------------------------------
-- File       : wave_generator.vhd
-- Author     : Anh Huy Bui 293257 & Mohamed Ibrahim 292998
-- Company    : Tampere University
-- Created    : 2019-11-28
-- Last update: 2020-02-25
-- Platform   : 
-- Standard   : VHDL'93/02
-------------------------------------------------------------------------------
-- Description: Produces a sine wave with adjustable frequency that can be 
--				controlled through the generic "step"
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
		   step_g : integer);	-- Defining the generic step 
		   
  -- Defining synchronous clear input, clock & reset inputs and value_out output
  port (
    sync_clear_n_in : in  std_logic;	
    clk     : in  std_logic;
    rst_n   : in  std_logic;
    value_out : out std_logic_vector(width_g-1 downto 0));
end wave_gen;


-------------------------------------------------------------------------------

architecture sine_wave of wave_gen is

  -- Constant values to be used in performing the recursive sine wave formula
  constant two_c : integer  := 2;
  constant one_c : integer  := 1;
  -- The maximum value of the 16-bit output
  constant max_c       : integer := ((two_c**(width_g-one_c)-one_c)/ step_g)*step_g;
  -- Definging the reference clock frequency to calculate the sampling rate
  -- i.e. how many reference clock cycles will each point in the sine wave take
  constant ref_clk_c : integer :=  50000000 ; 
  -- Frequency of the sine wave generator, it can be controlled by the step generic
  constant frequency_c : integer := (step_g * 100000); -- Defining frequency as 1 MHz.
  -- Initial values for Cn and Sn
  constant s0_c		   : integer  := 0;
  constant c0_c		   : integer  := max_c;
  constant N_c		   : integer  := ref_clk_c / frequency_c;
  -- The incremental value to be added every point
  signal d_c		   : integer  := (two_c * two_c * max_c) / N_c;
  

  -- Signals to hold the current value of the Cn and Sn
  signal cn_r			   : integer;
  signal sn_r			   : integer;

begin  -- rtl design
  -- Clocked process for the wave generation
  wave_generation:process (rst_n, clk)
  
  begin
    -- Checking for reset signal
    if (rst_n = '0') then
      -- Resetting the internal Cn & Sn signals
	  sn_r <= 0;
	  cn_r <= c0_c;
      
    elsif (clk'event and clk = '1') then
		-- Implementing the synchronous reset
		if (sync_clear_n_in = '0') then
			sn_r <= 0;
		else
			-- The recursive formulas to generate next Cn & Sn
			cn_r <= cn_r - d_c * sn_r / max_c;			
			sn_r <= sn_r + d_c * cn_r / max_c;
			-- Detecting the overflow condition for Sn
			if sn_r > max_c - d_c + 1 then
				-- If Sn reaches one step before the positive maximum value
				-- keep it as it is to prevent infinite sine wave growth
				sn_r <= max_c - d_c + 1;
				-- And put Cn back to its initial value
				cn_r <= 0;
				
			-- Detecting the overflow condition for Sn
			elsif sn_r < -(max_c - d_c - 1) then
				-- If Sn reaches one step before the negative maximum value
				-- keep it as it is to prevent infinite sine wave growth
				sn_r <= -(max_c - d_c - 1);
				-- And put Cn back to its initial value
				cn_r <= 0;
			end if;			
		end if;
    end if;
  end process;
  
 -- Assign the Sn register signal to the output of the wave generator
 value_out <= std_logic_vector(to_signed(sn_r, width_g));
end architecture sine_wave;
