-------------------------------------------------------------------------------
-- Title      : Bonus 1: Generic multi port adder
-- Project    : 
-------------------------------------------------------------------------------
-- File       : multi_port_adder.vhd
-- Author     : Anh Huy Bui 293257 & Mohamed Ibrahim 292998
-- Company    : Tampere University
-- Created    : 2020-01-31
-- Last update: 2020-01-31
-- Platform   : 
-- Standard   : VHDL'93/02
-------------------------------------------------------------------------------
-- Description: Multiport adder for 2^n input values when n >= 1
-------------------------------------------------------------------------------
-- Copyright (c) 2020 
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2020-01-31  1.0      vbmoad  Created
-------------------------------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;
use IEEE.math_real.all;
use ieee.numeric_std.all;

entity multi_port_adder is
  -- Defining the generic operands width
  generic (operand_width_g        : integer := 16;
           exponent_of_operands_g : integer := 2;
		   num_of_operands_g	  : integer := 4);
  -- 
  port (
    operands_in : in  std_logic_vector((operand_width_g*2**exponent_of_operands_g)-1 downto 0);
    sum_out     : out std_logic_vector(operand_width_g downto 0);
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

  -- Constant for the number of operands
  constant num_of_operands_c : integer := 2**exponent_of_operands_g;

  -- Creating the adder_array type
  type adder_array is array (0 to num_of_operands_c-1) of std_logic_vector(operand_width_g-1 downto 0);

  -- Holder array for input and ouput of type adder_array
  signal Input_array         : adder_array;  

  signal incrementer : integer := 0;
  type sum_adder_array is array (0 to num_of_operands_c) of std_logic_vector(operand_width_g downto 0);

  -- Holder array for input and ouput of type adder_array
  signal Sum_array : sum_adder_array;
  
begin

  -- Process to assign adn read input
  assign_input : process (rst_n, clk)

  begin
    -- Checking for reset signal
    if (rst_n = '0') then
      
      -- Loop to reset the input array
      clear_input : for i in 0 to num_of_operands_c-1 loop
        Input_array(i) <= (others => '0');
      end loop clear_input;

      -- Loop to reset the sum array      
      clear_sum : for i in 0 to num_of_operands_c loop
        Sum_array(i) <= (others => '0');
      end loop clear_sum;
  
    elsif (clk'event and clk = '1') then

      -- Loop to extract the input
      --extract_input : for i in 0 to num_of_operands_c-1 loop
        --Input_array(i) <= operands_in(((i+1)*operand_width_g)-1 downto i*operand_width_g);
      --end loop extract_input;
    end if;
  end process;

  g_adder : for index in 0 to num_of_operands_c-1 generate
    i_adder : adder
      generic map (  -- mapping I/O with the second component
        operand_width_g => operand_width_g)
      port map (
        clk     => clk,
        rst_n   => rst_n,
        a_in    => Sum_array(index)(operand_width_g-1 downto 0),
        b_in    => operands_in(((index+1)*operand_width_g)-1 downto index*operand_width_g),
        sum_out => Sum_array(index+1));
  end generate g_adder;

  -- Assigning the signal total to the sum_out output
  sum_out <= Sum_array(num_of_operands_c); 

end structural;
