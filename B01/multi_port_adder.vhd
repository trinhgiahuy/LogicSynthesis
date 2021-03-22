-------------------------------------------------------------------------------
-- Title      : Bonus 1 : Multilpe Port Adder
-- Project    : 
-------------------------------------------------------------------------------
-- File       : multi_port_adder.vhd
-- Author     : Trinh Gia Huy, Rajesh Singapati
-- Company    : 
-- Created    : 2020-11-20
-- Last update: 2021-03-23
-- Platform   : 
-- Standard   : VHDL'93/02
-------------------------------------------------------------------------------
-- Description:  a multiport adder using a previous adder architecture
-------------------------------------------------------------------------------
-- Copyright (c) 2020 
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2020-11-20  1.0      bdgitr  Created
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use IEEE.math_real.all;
use ieee.numeric_std.all;

entity multi_port_adder is
  generic (operand_width_g   : integer := 16;
           exponent_of_operands_g : integer := 3);
  port (
    clk         : in  std_logic;
    rst_n       : in  std_logic;
    operands_in : in  std_logic_vector((operand_width_g*2**exponent_of_operands_g) -1 downto 0);
    sum_out     : out std_logic_vector(operand_width_g downto 0)
    );
end multi_port_adder;

architecture structural of multi_port_adder is
  component adder is
    generic(
      operand_width_g : integer);
    port(
      clk, rst_n : in  std_logic;
      a_in, b_in : in  std_logic_vector(operand_width_g - 1 downto 0);
      sum_out    : out std_logic_vector (operand_width_g downto 0));
  end component;

  --Constant for the number of operands
  constant num_of_operands_c : integer := 2**exponent_of_operands_g;

  type adder_array is array (num_of_operands_c - 1 downto 0) of std_logic_vector(operand_width_g-1 downto 0);
  signal input_array : adder_array;

  signal incrementer : integer := 0;

  type sum_adder_array is array (num_of_operands_c downto 0) of std_logic_vector(operand_width_g downto 0);
  
  signal sum_array : sum_adder_array;
  --signal total    : std_logic_vector(operand_width_g+1 downto 0);


  --signal a_1      : std_logic_vector(operand_width_g-1 downto 0);
  --signal a_2      : std_logic_vector(operand_width_g-1 downto 0);
  --signal b_1      : std_logic_vector(operand_width_g-1 downto 0);
  --signal b_2      : std_logic_vector(operand_width_g-1 downto 0);
  --signal sumout : std_logic_vector(operand_width_g-1 downto 0);

  
begin
  --assert (num_of_operands_g = 4) report "The num_of_operands_g should only be 4" severity failure;

  assign_input : process (rst_n, clk)
  begin
    if (rst_n = '0') then
      clear_input : for i in 0 to num_of_operands_c-1 loop
        input_array(i) <= (others => '0');
      end loop clear_input;

      clear_sum :for i in 0 to num_of_operands_c loop
        sum_array(i) <= (others => '0');
      end loop clear_sum;

  elsif (clk'event and clk = '1') then
    extract_input : for i in 0 to num_of_operands_c-1 loop
      input_array(i)<=operands_in(((i+1)*operand_width_g)-1 downto i*operand_width_g);
    end loop extract_input;
  end if;
  end process assign_input;
  
  g_adder : for index in 0 to num_of_operands_c -1 generate
    adder_1 : adder generic map (
      operand_width_g => operand_width_g)
    port map (
      clk   => clk,
      rst_n => rst_n,
      a_in  => sum_array(index)(operand_width_g -1 downto 0),
      b_in  => operands_in(((index+1)*operand_width_g)-1 downto index*operand_width_g),
      sum_out => sum_array(index+1));
  end generate g_adder;
  
  sum_out <= sum_array(num_of_operands_c);

end structural;
