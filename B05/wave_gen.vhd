-------------------------------------------------------------------------------
-- Title      : EX06 : Triangular wave generator
-- Project    : 
-------------------------------------------------------------------------------
-- File       : wave_gen.vhd
-- Author     : Trinh Gia Huy, Rajesh Singapati
-- Company    : 
-- Created    : 2020-12-05
-- Last update: 2021-03-07
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
use IEEE.math_real.all;


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
  constant ref_clk_c : integer := 50000000;
  constant frequency_c : integer := (step_g * 100000);

  constant N_c : integer := ref_clk_c / frequency_c;

  --The incremental value that added to every point
  signal d_c : integer := (2*2*max_c)/N_c;
  signal cn_r : integer;
  signal sn_r : integer;
                                    
begin

  sync : process ( clk , rst_n)
  begin
    if ( rst_n = '0') then
     -- current_value_r <= (others => '0');
     -- dir_r <= upwards_c;
      sn_r <= 0;
      cn_r <= max_c;
    elsif ( clk = '1' and clk'event) then
      if ( sync_clear_n_in = '0') then
        sn_r <= 0;
      else
        --Generate the next Cn and Sn recursively
        cn_r <= cn_r - d_c * sn_r / max_c;
        sn_r <= sn_r + d_c * cn_r / max_c;
        --Detect the Sn's codition of overflow
        if sn_r > max_c - d_c + 1 then
          sn_r <= max_c - d_c + 1;
          cn_r <= 0;
        elsif sn_r < -(max_c - d_c - 1) then
           sn_r <= -(max_c - d_c -1);
           cn_r <= 0;              
        end if;     
    end if;
  end if;
end process sync;

--Assing the Sn register to output of wave generator
value_out <= std_logic_vector(to_signed(sn_r,width_g));

end architecture generator;

                
  
