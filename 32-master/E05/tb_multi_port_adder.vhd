-------------------------------------------------------------------------------
-- Title      : TIE-50206 Logic Synthesis , Exercise 05
-- Project    : VHDL Test bench design
-------------------------------------------------------------------------------
-- File       : tb_multi_port_adder.vhd
-- Author     : Anh Huy Bui 293257 & Mohamed Ibrahim 292998
-- Company    : Tampere University
-- Created    : 2019-11-25
-- Last update: 2020-01-24
-- Platform   : 
-- Standard   : VHDL'93/02
-------------------------------------------------------------------------------
-- Description: Testbench for the multi port adder
-------------------------------------------------------------------------------
-- Copyright (c) 2020 
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2019-11-25  1.0      vbmoad  Created
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all;


entity tb_multi_port_adder is
  -- Defining the generic operands width
  generic (operand_width_g   : integer := 3);
end tb_multi_port_adder;


-------------------------------------------------------------------------------

architecture testbench of tb_multi_port_adder is

  -- Defining clock period length, number of operands and delay value constants
  constant clock_cycle_length_c : time    := 10 ns;
  constant number_of_operands_c : integer := 4;
  constant duv_delay_c        : integer := 2;

  -- Defining the clock and reset signals to generate them inside the testbench
  signal clk, rst_n : std_logic := '0';
  signal operands_r : std_logic_vector((operand_width_g*number_of_operands_c)-1 downto 0);

  -- Sum and output_valid_r signals to use them with the output of the multi
  -- port adder
  signal sum            : std_logic_vector(operand_width_g-1 downto 0);
  signal output_valid_r : std_logic_vector(duv_delay_c+1-1 downto 0);

  -- Creating files for input, reference and output
  file input_f       : text open read_mode is "input.txt";
  file ref_results_f : text open read_mode is "ref_results.txt";
  file output_f      : text open write_mode is "output.txt";

  signal process_delay : std_logic := '0';

  -- Defining the multi port adder component in the testbench top level
  component multi_port_adder
    generic (operand_width_g   : integer := 16;
             num_of_operands_g : integer := 4);
    port (
      operands_in : in  std_logic_vector((operand_width_g*num_of_operands_g)-1 downto 0);
      sum_out     : out std_logic_vector(operand_width_g-1 downto 0);
      clk         : in  std_logic;
      rst_n       : in  std_logic);
  end component;

begin
  -- Creating the clock and reset signals with the required values
  clk   <= not clk after clock_cycle_length_c/2;
  rst_n <= '1'     after clock_cycle_length_c*4;

  -- instantiating the multi port adder component and mapping its input and
  -- output ports with the testbench signals and outputs
  multi_port_adder_DUV : multi_port_adder
    generic map (
      operand_width_g   => operand_width_g,
      num_of_operands_g => number_of_operands_c)
    port map (
      clk         => clk,
      rst_n       => rst_n,
      operands_in => operands_r,
      sum_out     => sum);

  -- The input reading process
  input_reader : process (clk, rst_n)
    -- Variable to read one line from the input files
    variable input_line_v : line;

    -- Creating the integer array data type
    type integer_array is array (0 to number_of_operands_c-1) of integer;

    -- Creating the integer array variable of this type
    variable input_integer_array_v : integer_array;

  begin
    -- Reset value of operands_r
    if rst_n = '0' then
      operands_r     <= (others => '0');
      output_valid_r <= (others => '0');
    elsif clk'event and clk = '1' then

      -- Shifting the delay counter to the left
      output_valid_r(duv_delay_c+1-1 downto 1) <= output_valid_r(duv_delay_c+1-2 downto 0);

      -- Inserting 0 to the right
      output_valid_r(0) <= '0';

      -- When reaching "000" then we put 1 in the LSB
      if (output_valid_r = "000") then
        output_valid_r(0) <= '1';
      end if;

      -- Checking if the delay is finished and the file is not over yet
      if output_valid_r(duv_delay_c+1-1) = '1' and not (endfile(input_f)) then
        -- Putting one line into our line reading variable
        readline(input_f, input_line_v);
        for i in 0 to 3 loop
          read(input_line_v, input_integer_array_v(i));

          -- Taking an operand of width operand_width_g from the integer array
          operands_r((i+1)*operand_width_g-1 downto i*operand_width_g) <= std_logic_vector(to_signed(input_integer_array_v(i), operand_width_g));
        end loop;

        -- A signal to check that the input reading is done correctly in order to compare it with reference
        process_delay <= '1';

      end if;
    end if;
  end process;

  checker : process (rst_n, clk)    -- Process to check with the reference

    -- Same as the reading process, line variable to read line
    variable reference_line_v  : line;
    variable reference_value_v : integer := 0;
    variable output_line_v     : line;

  begin
	
	if (rst_n = '0') then
      -- Resetting the line variables
		output_line_v := null;
		reference_line_v := null;
		
    elsif (clk'event and clk = '1') then
	
		-- To check that the delay is over and we actually read a valid data
		if (output_valid_r(duv_delay_c+1-1) = '1') and process_delay = '1' then

			-- Read reference until end of file
			if not (endfile(ref_results_f)) then
				readline(ref_results_f, reference_line_v);
				read(reference_line_v, reference_value_v);

				-- Check the value of sum with the reference value
				assert (to_integer(signed(sum)) = reference_value_v)
				report "The read value is not equivalent to the value of sum" severity failure;
				write(output_line_v, to_integer(signed(sum)));
				writeline(output_f, output_line_v);
			else
				assert false
				report "Simulation done" severity failure;
			end if;
		end if;
	end if;
  end process;

end testbench;
