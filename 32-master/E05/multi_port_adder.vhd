-------------------------------------------------------------------------------
-- Title      : TIE-50206 Logic Synthesis , Exercise 04
-- Project    : Multi port adder (Structural description)
-------------------------------------------------------------------------------
-- File       : multi_port_adder.vhd
-- Author     : Anh Huy Bui 293257 & Mohamed Ibrahim 292998
-- Company    : Tampere University
-- Created    : 2019-11-19
-- Last update: 2019-11-27
-- Platform   : 
-- Standard   : VHDL'93/02
-------------------------------------------------------------------------------
-- Description: Adds input operands of different sizes
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

entity multi_port_adder is
  -- Defining the generic operands width
  generic (operand_width_g   : integer := 16;
           num_of_operands_g : integer := 4);
  -- 
  port (
    operands_in : in  std_logic_vector((operand_width_g*num_of_operands_g)-1 downto 0);
    sum_out     : out std_logic_vector(operand_width_g-1 downto 0);
    clk         : in  std_logic;
    rst_n       : in  std_logic);
end multi_port_adder;


-------------------------------------------------------------------------------

architecture structural of multi_port_adder is
  -- Declaring the adder as a component in this top level module
  component adder
    generic (
      operand_width_g : integer
      );
    port (
      clk     : in  std_logic;
      rst_n   : in  std_logic;
      a_in    : in  std_logic_vector(operand_width_g-1 downto 0);
      b_in    : in  std_logic_vector(operand_width_g-1 downto 0);
      sum_out : out std_logic_vector(operand_width_g downto 0));
  end component;

  -- Creating the adder_array type
  type adder_array is array (0 to num_of_operands_g/2-1) of std_logic_vector(operand_width_g downto 0);
  signal subtotal : adder_array;        -- subtotal signal of type adder_array
  signal total    : std_logic_vector(operand_width_g+1 downto 0);  -- total signal for the whole sum     

begin

  -- First addition stage
  subtotal_0 : adder
    generic map (  -- mapping I/O with the second component
      operand_width_g => operand_width_g)
    port map (
      clk     => clk,
      rst_n   => rst_n,
      a_in    => operands_in(operand_width_g-1 downto 0),
      b_in    => operands_in(2*operand_width_g-1 downto operand_width_g),
      sum_out => subtotal(0));

  -- Second addition stage
  subtotal_1 : adder
    generic map (  -- mapping the I/O between top level and component
      operand_width_g => operand_width_g)
    port map (
      clk     => clk,
      rst_n   => rst_n,
      a_in    => operands_in(3*operand_width_g-1 downto 2*operand_width_g),
      b_in    => operands_in(4*operand_width_g-1 downto 3*operand_width_g),
      sum_out => subtotal(1));

  total_stage : adder
    generic map (                       -- mapping for the total stage
      operand_width_g => operand_width_g+1)
    port map (
      clk     => clk,
      rst_n   => rst_n,
      a_in    => subtotal(0),
      b_in    => subtotal(1),
      sum_out => total);

  sum_out <= total(operand_width_g-1 downto 0);  -- assigning the signal total to the sum_out output
  assert num_of_operands_g = 4
    report "severity failure"
    severity failure;


end structural;
