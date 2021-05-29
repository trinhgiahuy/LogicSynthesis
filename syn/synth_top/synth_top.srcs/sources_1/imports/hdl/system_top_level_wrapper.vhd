--Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
--Date        : Sat Feb  6 21:56:50 2021
--Host        : LAPTOP-PGKK1HS3 running 64-bit major release  (build 9200)
--Command     : generate_target system_top_level_wrapper.bd
--Design      : system_top_level_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity system_top_level_wrapper is
  port (
    pin_aud_bitclk : out STD_LOGIC;
    pin_aud_data : out STD_LOGIC;
    pin_aud_lrclk : out STD_LOGIC;
    pin_aud_mclk : out STD_LOGIC;
    pin_clk : in STD_LOGIC;
    pin_i2c_sclk : out STD_LOGIC;
    pin_i2c_sdata : inout STD_LOGIC;
    pin_keys : in STD_LOGIC_VECTOR ( 3 downto 0 );
    pin_leds_i2c : out STD_LOGIC_VECTOR ( 3 downto 0 );
    pin_rst_n : in STD_LOGIC
  );
end system_top_level_wrapper;

architecture STRUCTURE of system_top_level_wrapper is
  component system_top_level is
  port (
    pin_clk : in STD_LOGIC;
    pin_rst_n : in STD_LOGIC;
    pin_keys : in STD_LOGIC_VECTOR ( 3 downto 0 );
    pin_i2c_sclk : out STD_LOGIC;
    pin_leds_i2c : out STD_LOGIC_VECTOR ( 3 downto 0 );
    pin_aud_mclk : out STD_LOGIC;
    pin_aud_lrclk : out STD_LOGIC;
    pin_aud_data : out STD_LOGIC;
    pin_i2c_sdata : inout STD_LOGIC;
    pin_aud_bitclk : out STD_LOGIC
  );
  end component system_top_level;
begin
system_top_level_i: component system_top_level
     port map (
      pin_aud_bitclk => pin_aud_bitclk,
      pin_aud_data => pin_aud_data,
      pin_aud_lrclk => pin_aud_lrclk,
      pin_aud_mclk => pin_aud_mclk,
      pin_clk => pin_clk,
      pin_i2c_sclk => pin_i2c_sclk,
      pin_i2c_sdata => pin_i2c_sdata,
      pin_keys(3 downto 0) => pin_keys(3 downto 0),
      pin_leds_i2c(3 downto 0) => pin_leds_i2c(3 downto 0),
      pin_rst_n => pin_rst_n
    );
end STRUCTURE;
