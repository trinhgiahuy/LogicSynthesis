-------------------------------------------------------------------------------
-- Title      : EX05: Testbench of multi_port_adder
-- Project    : 
-------------------------------------------------------------------------------
-- File       : tb_multi_port_adder.vhd
-- Author     :   Trinh Huy
-- Company    : 
-- Created    : 2020-11-29
-- Last update: 2021-01-16
-- Platform   : 
-- Standard   : VHDL'93/02
-------------------------------------------------------------------------------
-- Description: A test bench for multi-port adder design
-------------------------------------------------------------------------------
-- Copyright (c) 2020 
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author          Description
-- 2020-11-29  1.0      Trinh Huy       Created
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all;

entity tb_multi_port_adder is
  generic(operand_width_g : integer := 3);
end entity tb_multi_port_adder;

architecture test_bench of tb_multi_port_adder is
  constant period_c         : time    := 10 ns;
  constant num_of_operands_c : integer := 4;
  constant duv_delay_c      : integer := 2;

  signal clk       : std_logic := '0';
  signal rst_n     : std_logic := '0';
  -- Input operand as single concatented vector.
  signal operands_r : std_logic_vector(operand_width_g*num_of_operands_c -1 downto 0);
  signal sum       : std_logic_vector(operand_width_g -1 downto 0);
  --Counter for addressing adder delay
  signal output_valid_r : std_logic_vector(duv_delay_c downto 0);
  

  file input_f      : text open read_mode  is "input.txt";
  file ref_results_f : text open read_mode is "ref_results.txt";
  file output_f     : text open write_mode is "output.txt";


  component multi_port_adder is
    generic (operand_width_g   : integer;
             num_of_operands_g : integer
             );
    port (clk, rst_n : in  std_logic;
         operands_in : in  std_logic_vector(operand_width_g*num_of_operands_g -1 downto 0);
         sum_out    : out std_logic_vector(operand_width_g -1 downto 0)
         );
  end component multi_port_adder;

begin
  clk   <= not clk after period_c/2;
  rst_n <= '1'     after period_c*4;

  i_adder : component multi_port_adder
    generic map (
    operand_width_g   => operand_width_g,
    num_of_operands_g => num_of_operands_c
    )
  port map(
    clk         => clk,
    rst_n       => rst_n,
    operands_in => operands_r,
    sum_out     => sum
    );

  -- process for readin input file and directing it to adder input.
  input_reader : process (clk, rst_n)
    type value_array_t is array (3 downto 0) of integer;
    variable line_v        : line;
    variable input_value_v : value_array_t;

  begin
    if(rst_n = '0') then
      operands_r      <= (others => '0');
      output_valid_r <= (others => '0');
    elsif (clk'event and clk = '1') then
      -- Shift output_valid_r one bit to left and set LSB to 1
      output_valid_r(duv_delay_c downto 0) <= output_valid_r(duv_delay_c - 1 downto 0) & '1';
      if not endfile(input_f) then
        readline(input_f, line_v);
        -- read 4 space seperated value from line
        for i in 3 downto 0 loop
          read(line_v, input_value_v(i));
          --set corresponding bit of operand_r to the value of input_value_v(i);
          operands_r((i+1)*operand_width_g -1 downto i*operand_width_g) <=
            std_logic_vector(to_signed(input_value_v(i), operand_width_g));
        end loop;
      end if;
    end if;
  end process;

  --Process for checking the output of adder matches to reference value.
  checker : process (clk, rst_n)
    variable line_in_v       : line;
    variable line_out_v      : line;    --variable for line of  output 
    variable ref_output_v    : integer;
    variable sum_out_integer : integer;
  begin
    if (clk'event and clk = '1') then
      --wait for MSV of output_valid_r turn 1;
      if (output_valid_r(duv_delay_c) = '1') then
        -- Read sigle line from ref_results to line_in_v
        if not endfile(ref_results_f) then
          readline(ref_results_f, line_in_v);
          read(line_in_v, ref_output_v);
        else
          assert false report "Simulation done" severity failure;
        end if;

        --convert adder result into integer and write it to the output file.
        sum_out_integer := to_integer(signed(sum));
        write(line_out_v, sum_out_integer);
        writeline(output_f, line_out_v);

        --Assert correct result
        assert sum_out_integer = ref_output_v
          report "Expected : " & integer'image(ref_output_v)&". Got: " & integer'image(sum_out_integer)
          severity failure;
      end if;
    end if;
  end process;
end architecture test_bench;









