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
  constant two_c : INTEGER  := integer(2);
  constant one_c : INTEGER  := integer(1);
  constant minus_one_c : INTEGER  := integer(-1);
  
  -- Internal signal to use it as a register in the clocked process
  signal internal_wave_value : signed(width_g-1 downto 0);

  -- Creating signals to hold the maximum and minimum values
  signal maximum_value : signed(width_g-1 downto 0) := to_signed(((two_c**(width_g-one_c)-one_c)/ step_g)*step_g, width_g);
  signal minimum_value : signed(width_g-1 downto 0) := to_signed((minus_one_c * ((two_c**(width_g-one_c)-one_c) / step_g)*step_g), width_g);

  -- Direction of incrementing '1' is up & '0' is down
  signal counting_direction : std_logic := '1' ;




begin  -- rtl design
  -- Clocked process for the wave generation
  wave_generation:process (rst_n, clk)
  
  begin
    -- Checking for reset signal
    if (rst_n = '0') then
      -- Resetting the internal signal
      internal_wave_value <= (others => '0');
    elsif (clk'event and clk = '1') then
		-- Implementing the synchronous reset
		if (sync_clear_n_in = '0') then
			-- Resetting the internal_wave signal and the counting direction
			internal_wave_value <= (others => '0');
			counting_direction <= '1';
		else
			internal_wave_value <= (others => '0');
			-- Stop counting when we reach the maximum positive value and change counting direction
			if internal_wave_value = maximum_value-step_g then
				counting_direction <= '0';
			-- Stop counting when we reach the minimum negative value and change counting direction
			elsif internal_wave_value = minimum_value+step_g then
				counting_direction <= '1';
			end if;
			-- Count up when counting_direction = '1'
			if counting_direction = '1' then
				internal_wave_value <= internal_wave_value + step_g;
			else
			-- Count down when counting_direction = '0'
				internal_wave_value <= internal_wave_value - step_g;
			end if;		
		end if;
    end if;
  end process;
 -- Assign the internal_wave_signal to the output of the wave generator
 value_out <= std_logic_vector(internal_wave_value);
end architecture triangular_wave;
