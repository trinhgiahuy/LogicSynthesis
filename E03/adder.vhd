-------------------------------------------------------------------------------
-- Title      : Exercise 3
-- Project    : 
-------------------------------------------------------------------------------
-- File       : adder.vhd
-- Author     : group 9
-- Company    : 
-- Created    : 2020-11-11
-- Last update: 2021-01-31
-- Platform   : 
-- Standard   : VHDL'93/02
-------------------------------------------------------------------------------
-- Description: Adder module (RTL)
-------------------------------------------------------------------------------
-- Copyright (c) 2020 
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2020-11-11  1.0      bdgitr  Created
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity adder is
  generic(operand_width_g : integer);
  port(
    clk, rst_n : in  std_logic;
    a_in, b_in : in  std_logic_vector(operand_width_g - 1 downto 0);
    sum_out    : out std_logic_vector (operand_width_g downto 0)
    );
end adder;

---------------------------------------------------------------------------------
architecture rtl of adder is
  signal result_r : signed(operand_width_g downto 0) := (others => '0');
  begin
  --register for the output
  sum_out <= std_logic_vector(result_r);
    sync : process(rst_n, clk)
    begin
      if (rst_n = '0') then
        result_r <= (others => '0');
      elsif (clk = '1' and clk'event) then
        --- resize the input , convert them into signed & calculate sum_out
        result_r <= resize(signed(a_in), operand_width_g + 1) + resize(signed(b_in), operand_width_g + 1);
      end if;
    end process sync;
  end architecture rtl;
