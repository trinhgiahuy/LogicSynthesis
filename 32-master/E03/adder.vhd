-------------------------------------------------------------------------------
-- Title      : TIE-50206 Logic Synthesis , Exercise 03
-- Project    : Generic adder (RTL description)
-------------------------------------------------------------------------------
-- File       : adder.vhd
-- Author     : Anh Huy Bui 293257 & Mohamed Ibrahim 292998
-- Company    : Tampere University
-- Created    : 2019-11-14
-- Last update: 2019-11-14
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

entity adder is
  -- Defining the generic operands width
  generic (operand_width_g : integer);
  -- 
  port (
    a_in    : in  std_logic_vector(operand_width_g-1 downto 0);
    b_in    : in  std_logic_vector(operand_width_g-1 downto 0);
    sum_out : out std_logic_vector(operand_width_g downto 0);
    clk     : in  std_logic;
    rst_n   : in  std_logic);
end adder;


-------------------------------------------------------------------------------

architecture rtl of adder is

  -- Internal signal to use it as a register in the clocked process

  signal internal_sum : signed (operand_width_g downto 0);

begin  -- rtl

  -- Assigning the output to the internal signal concurrently
  sum_out <= std_logic_vector(internal_sum);
  -- Clocked process for summation
  summation : process(rst_n, clk)
  begin
    -- Checking for reset signal
    if (rst_n = '0') then
      -- Resetting the internal signal
      internal_sum <= (others => '0');
    elsif (clk'event and clk = '1') then
      -- Converting both of the inputs to signed and then resizing them to be 1 bit
      -- longer to hole the possible carry out 
      internal_sum <= resize(signed(a_in), operand_width_g+1) + resize(signed(b_in), operand_width_g+1);
    end if;
  end process summation;
end rtl;
