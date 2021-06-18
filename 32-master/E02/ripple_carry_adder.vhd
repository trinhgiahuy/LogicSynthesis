-------------------------------------------------------------------------------
-- Title      : TIE-50206 Logic Synthesis , Exercise 02
-- Project    : Ripple carry adder (Gate level description)
-------------------------------------------------------------------------------
-- File       : ripple_carry_adder.vhd
-- Author     : Anh Huy Bui 293257 & Mohamed Ibrahim 292998
-- Company    : Tampere University
-- Created    : 2019-11-14
-- Last update: 2019-11-14
-- Platform   : 
-- Standard   : VHDL'93/02
-------------------------------------------------------------------------------
-- Description: Implements ripple carry adder between 3-bit wide operands
-------------------------------------------------------------------------------
-- Copyright (c) 2019 
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2019-11-14  1.0      vbmoad  Created
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;


entity ripple_carry_adder is

  port (
    a_in  : in  std_logic_vector(2 downto 0);
    b_in  : in  std_logic_vector(2 downto 0);
    s_out : out std_logic_vector(3 downto 0)
    );
end ripple_carry_adder;


-------------------------------------------------------------------------------

architecture gate of ripple_carry_adder is

  -- Internal signal definition

  signal Carry_ha, Carry_fa, C, D, E, F, G, H : std_logic;

begin  -- gate

  -- Internal signals assignment 

  Carry_ha <= a_in(0) and b_in(0);  --half adder carry from the first bit addition
  C        <= a_in(1) xor b_in(1);  --propagate signal of second bit addition
  D        <= C and Carry_ha;  --output of propagation of second bit addition
  E        <= a_in(1) and b_in(1);  --generate signal of second bit addition
  F        <= a_in(2) xor b_in(2);  --propagate signal of third bit addition
  Carry_fa <= D or E;          --full adder carry from the second bit addition
  G        <= F and Carry_fa;  --output of propagation of third bit addition
  H        <= a_in(2) and b_in(2);      --generate signal of third bit addition

  -- Output sum assignment

  s_out(0) <= a_in(0) xor b_in(0);      --LSB of the sum
  s_out(1) <= C xor Carry_ha;           --second bit of the sum
  s_out(2) <= F xor Carry_fa;           --third bit of the sum
  s_out(3) <= G or H;                   --MSB of the sum


end gate;
