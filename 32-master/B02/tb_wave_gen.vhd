-------------------------------------------------------------------------------
-- Title : tb_wave_gen
-- Project : Exercise 06
-------------------------------------------------------------------------------
-- File       : tb_wave_gen.vhd
-- Author     : Erno Salminen  <ege@tiibetinhanhi.cs.tut.fi>
-- Company    : 
-- Last update: 2018-11-26
-- Platform   : 
-------------------------------------------------------------------------------
-- Description: Stimulus generation for wave generator. NOTE! This does not
--              check the validity of DUV's output signal!
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2008/12/19  1.0      ege	Created
-- 2018/11/26  1.1      oh      sync_clear to active low
-------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
use IEEE.math_real.all;


ENTITY tb_wave_gen IS

END tb_wave_gen;


ARCHITECTURE testbench OF tb_wave_gen IS

--  CONSTANT width_c : INTEGER := 6;
  CONSTANT width_c : INTEGER := 16;

  -- Set the clk period and total simulation length
  CONSTANT period_c         : TIME    := 10 NS;  -- 10 ns = 100 MHz
  CONSTANT sim_duration_c   : TIME    := 1 MS;

  -- Set the time when generator is cleared synchronously
  CONSTANT clear_delay_c    : INTEGER := 74000;
  CONSTANT clear_duration_c : INTEGER := 6000;


  -- Signals for the DUV
  SIGNAL clk   : STD_LOGIC := '0';
  SIGNAL rst_n : STD_LOGIC := '0';
  TYPE output_array IS ARRAY (1 TO 4) OF real;
  SIGNAL output : output_array;
  SIGNAL sync_clear : STD_LOGIC;

  -- These are for assistants. These store the largest and smallest
  -- values from each generator.
  SIGNAL maxim  : output_array;
  SIGNAL minim  : output_array;


  COMPONENT wave_gen
    GENERIC (
      width_g         :     INTEGER;
      step_g          :     INTEGER);
    PORT (
      rst_n           : IN  STD_LOGIC;
      clk             : IN  STD_LOGIC;
      sync_clear_n_in : IN  STD_LOGIC;
      value_out       : OUT real);
  END COMPONENT;

  SIGNAL sync_clear_old_r : STD_LOGIC;

  CONSTANT zero_c : STD_LOGIC_VECTOR( width_c-1 DOWNTO 0 ) := (OTHERS => '0');

  SIGNAL endsim : STD_LOGIC := '0';

BEGIN  -- testbench

  clk   <= NOT clk AFTER period_c/2;
  rst_n <= '1'     AFTER period_c*4;

  -- Create synchronous clear signal
  sync_clear <= '1',
                '0' AFTER period_c*clear_delay_c,
                '1' AFTER period_c*(clear_delay_c+clear_duration_c);


  
  g_wave_gen : FOR step IN 1 TO 4 GENERATE
    i_wave_gen : wave_gen
      GENERIC MAP (
        width_g         => width_c,
        step_g          => step
        )
      PORT MAP (
        rst_n           => rst_n,
        clk             => clk,
        sync_clear_n_in => sync_clear,
        value_out       => output(step)
        );

  END GENERATE g_wave_gen;




  -- CUSTOM process for assistant
  sync_test : PROCESS (clk, rst_n)
  BEGIN  -- PROCESS sync_test
    IF rst_n = '0' THEN                 -- asynchronous reset (active low)
      maxim(1)            <= real(0);
      minim(1)            <= real(0);
	  maxim(2)            <= real(0);
      minim(2)            <= real(0);
	  maxim(3)            <= real(0);
      minim(3)            <= real(0);
	  maxim(4)            <= real(0);
      minim(4)            <= real(0);
      sync_clear_old_r <= '1';
    ELSIF clk'EVENT AND clk = '1' THEN  -- rising clock edge
      sync_clear_old_r <= sync_clear;
      FOR i IN 1 TO 4 LOOP
        IF real(output(i)) > real(maxim(i)) THEN
          maxim(i)     <= output(i);
        END IF;
        IF real(output(i)) < real(minim(i)) THEN
          minim(i)     <= output(i);
        END IF;

        ASSERT sync_clear_old_r = '1' OR output(i) = real(0)
          REPORT "Sync clear failed" SEVERITY ERROR;
        
      END LOOP;  -- i

    END IF;
  END PROCESS sync_test;


  -- Stop the simulation
  endsim <= '1' AFTER sim_duration_c;
  ASSERT endsim = '0' REPORT "Simulation done" SEVERITY FAILURE;




END testbench;

