-------------------------------------------------------------------------------
-- Title      : Ex12, I2C-bus controller
-- Project    : 
-------------------------------------------------------------------------------
-- File       : i2c_config.vhd
-- Author     : Trinh Gia Huy,Rajesh Singapati
-- Company    : 
-- Created    : 2021-02-25
-- Last update: 2021-03-05
-- Platform   : 
-- Standard   : VHDL'93/02
-------------------------------------------------------------------------------
-- Description: This module will configure the audion codec module through I2C
-- protocol
-------------------------------------------------------------------------------
-- Copyright (c) 2021 
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2021-02-25  1.0      Trinh Huy,Rajesh Singapati      Created
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity i2c_config is
  generic(
    ref_clk_freq_g : integer := 50000000;
    i2c_freq_g     : integer := 20000;
    n_params_g     : integer := 15;
    n_leds_g       : integer := 4
    );
  port(
    clk              : in    std_logic;
    rst_n            : in    std_logic;
    sdat_inout       : inout std_logic;
    sclk_out         : out   std_logic;
    param_status_out : out   std_logic_vector(n_leds_g - 1 downto 0);
    finished_out     : out   std_logic
    );
end entity i2c_config;

architecture RTL of i2c_config is
  constant byte_width_c            : integer                      := 8;
  constant slave_addr_and_rw_bit_c : std_logic_vector(7 downto 0) := "0011010" & '0';

  type param_array_type is array (0 to n_params_g - 1) of std_logic_vector(byte_width_c - 1 downto 0);
  constant param_addresses_c : param_array_type := ("00011101",
                                                    "00100111",
                                                    "00100010",
                                                    "00101000",
                                                    "00101001",
                                                    "01101001",
                                                    "01101010",
                                                    "01000111",
                                                    "01101011",
                                                    "01101100",
                                                    "01001011",
                                                    "01001100",
                                                    "01101110",
                                                    "01101111",
                                                    "01010001");
  constant param_values_c : param_array_type := ("10000000",
                                                 "00000100",
                                                 "00001011",
                                                 "00000000",
                                                 "10000001",
                                                 "00001000",
                                                 "00000000",
                                                 "11100001",
                                                 "00001001",
                                                 "00001000",
                                                 "00001000",
                                                 "00001000",
                                                 "10001000",
                                                 "10001000",
                                                 "11110001");

  constant sclk_counter_steps_c      : integer := ref_clk_freq_g / i2c_freq_g;
  constant sclk_counter_half_steps_c : integer := sclk_counter_steps_c / 2;

  type state_type is (start_cond,
                      slave_addr_transmit,
                      reg_addr_transmit,
                      data_transmit,
                      wait_ack,
                      stop_cond,
                      finished
                      );
  signal state_r               : state_type;
  signal wait_ack_next_state_r : state_type;
  signal param_index_r : integer range 0 to n_params_g - 1;
  signal bit_index_r   : integer range -1 to byte_width_c - 1;
  signal sclk_counter_r : integer range 0 to sclk_counter_steps_c - 1;
  signal sdat_r         : std_logic;
  signal sclk_r         : std_logic;
  signal finished_out_r : std_logic;
  
begin

  process(clk, rst_n) is
    procedure output_next_bit(bit_vector : in std_logic_vector(byte_width_c - 1 downto 0);
                              next_state : in state_type
                              ) is
    begin
      -- If we still have bits to send.
      if (bit_index_r /= -1) then
        -- Set next value to SDA at the middle of the low period of sclk.
        if (sclk_r = '0' and sclk_counter_r = sclk_counter_half_steps_c) then
          sdat_r      <= bit_vector(bit_index_r);
          bit_index_r <= bit_index_r - 1;
        end if;
      else
        -- Release the sda for ACK at the falling edge of sclk.
        -- Also move to 'wait_ack' state.
        if (sclk_r = '0' and sclk_counter_r = 0) then
          bit_index_r           <= byte_width_c - 1;
          sdat_r                <= 'Z';
          state_r               <= wait_ack;
          wait_ack_next_state_r <= next_state;
        end if;
      end if;
    end procedure;

  begin
    if rst_n = '0' then
      state_r               <= start_cond;
      wait_ack_next_state_r <= reg_addr_transmit;

      param_index_r <= 0;
      bit_index_r   <= byte_width_c - 1;

      sclk_counter_r <= 0;

      sdat_r         <= '1';
      sclk_r         <= '1';
      finished_out_r <= '0';
    elsif clk'event and clk = '1' then

      -- Generate sclk.
      if (sclk_counter_r /= sclk_counter_steps_c - 1) then
        sclk_counter_r <= sclk_counter_r + 1;
      else
        sclk_counter_r <= 0;
        sclk_r         <= not sclk_r;
      end if;
      
      -- State logic.
      case state_r is
        when start_cond =>
          -- Change the value of sda at the middle of the high period of sclk.
          if (sclk_r = '1' and sclk_counter_r = sclk_counter_half_steps_c) then
            sdat_r  <= '0';
            state_r <= slave_addr_transmit;
          end if;
          
        when slave_addr_transmit =>
          output_next_bit(slave_addr_and_rw_bit_c, reg_addr_transmit);

        when reg_addr_transmit =>
          output_next_bit(param_addresses_c(param_index_r), data_transmit);

        when data_transmit =>
          output_next_bit(param_values_c(param_index_r), stop_cond);

        when wait_ack =>
          -- Read ACK/NACK value at the half of the high level of sclk.
          if (sclk_counter_r = sclk_counter_half_steps_c and sclk_r = '1') then
            if (sdat_inout <= '0') then
              -- ACK.
              state_r <= wait_ack_next_state_r;
            else
              -- NACK, reset to start condition of current parameter.
              state_r     <= start_cond;
              bit_index_r <= byte_width_c - 1;
              sdat_r      <= '1';
              sclk_r      <= '1';
            end if;
          end if;

        when stop_cond =>
          -- Set sda to low at the middle of low period of sclk.
          if (sclk_r = '0' and sclk_counter_r = sclk_counter_half_steps_c) then
            sdat_r <= '0';
          end if;
          -- Raise sda at the middle of the high period.
          if (sclk_r = '1' and sclk_counter_r = sclk_counter_half_steps_c) then
            -- Generate STOP condition.
            sdat_r <= '1';
            -- Move to start condition of next parameter or to 'finished'-state.
            if (param_index_r /= n_params_g - 1) then
              param_index_r <= param_index_r + 1;
              state_r       <= start_cond;
            else
              state_r <= finished;
            end if;
          end if;

        when finished =>
          sdat_r         <= '1';
          sclk_r         <= '1';
          finished_out_r <= '1';
      end case;
    end if;
  end process;

  sdat_inout       <= sdat_r;
  sclk_out         <= sclk_r;
  finished_out     <= finished_out_r;
  param_status_out <= std_logic_vector(to_unsigned(param_index_r, n_leds_g));
end architecture RTL;
