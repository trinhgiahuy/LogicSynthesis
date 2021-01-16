-------------------------------------------------------------------------------
-- Title      : EX06 : Triangular wave generator
-- Project    : 
-------------------------------------------------------------------------------
-- File       : wave_gen.vhd
-- Author     :   Trinh Gia Huy
-- Company    : 
-- Created    : 2020-12-05
-- Last update: 2021-01-16
-- Platform   : 
-- Standard   : VHDL'93/02
-------------------------------------------------------------------------------
-- Description: A triangular wave  generator 
-------------------------------------------------------------------------------
-- Copyright (c) 2020 
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version        Author                          Description
-- 2020-12-05  1.0            Trinh Huy	                      Created
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity wave_gen is
  generic(width_g : integer;
          step_g : integer );
  
  port (
    clk : in std_logic;
    rst_n : in std_logic;
    sync_clear_n_in : in std_logic;
    value_out : out std_logic_vector( width_g -1 downto 0)
    );
end entity wave_gen;

architecture generator of wave_gen is

  signal dir_r : std_logic;
  signal current_value_r : signed(width_g -1 downto 0);
  constant upwards_c : std_logic := '1';
  constant max_c : integer := ((2**(width_g-1)-1)/step_g)*step_g;

begin

  sync : process ( clk , rst_n)
  begin
    if ( rst_n = '0') then
      current_value_r <= (others => '0');
      dir_r <= upwards_c;
    elsif ( clk = '1' and clk'event) then
      if ( sync_clear_n_in = '0') then
        --rest the current value to 0 and change the upward direction
        current_value_r <= (others => '0');
        dir_r <= upwards_c;
      else
        -- If the current direction is upward and next step lead to max value
        -- or current direction is downward and next step lead to min value
        -- then change the direction
        if (to_integer(current_value_r) = max_c - step_g and dir_r = upwards_c ) then
          dir_r <= not upwards_c;
        elsif ( to_integer(current_value_r) = - max_c + step_g and dir_r = not upwards_c) then
          dir_r <= upwards_c;
        end if;

        if ( dir_r = upwards_c) then
          current_value_r <= current_value_r + step_g;
        else 
          current_value_r <= current_value_r - step_g;
        end if;
      
    end if;
  end if;
end process sync;

value_out <= std_logic_vector(current_value_r);

end architecture generator;

                
  
