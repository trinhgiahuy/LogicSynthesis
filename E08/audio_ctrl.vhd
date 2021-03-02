-------------------------------------------------------------------------------
-- Title      : EX07 : Audio controller module
-- Project    : 
-------------------------------------------------------------------------------
-- File       : audio_ctrl.vhd
-- Author     : Trinh Gia Huy, Rajesh Singapati
-- Company    : 
-- Created    : 2021-01-17
-- Last update: 2021-03-02
-- Platform   : 
-- Standard   : VHDL'93/02
-------------------------------------------------------------------------------
-- Description: <cursor>
-------------------------------------------------------------------------------
-- Copyright (c) 2021 
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author                                  Description
-- 2021-01-17  1.0      Trinh Gia Huy, Rajesh Singapati           Created
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity audio_ctrl is
  generic(
    ref_clk_freq_g : integer := 12288000;
    sample_rate_g  : integer := 48000;
    data_width_g   : integer := 16
    );
  port(
    clk, rst_n                                : in  std_logic;
    left_data_in, right_data_in               : in  std_logic_vector(data_width_g -1 downto 0);
    aud_bclk_out, aud_data_out, aud_lrclk_out : out std_logic
    );
end entity;

architecture RTL of audio_ctrl is

  constant lrclk_counter_step_c : integer := ref_clk_freq_g / sample_rate_g /2;

  --constant min_bclk_period_c : integer := 75;

  constant bclk_counter_step_c : integer := lrclk_counter_step_c/data_width_g/2;

  signal bit_index_r                   : integer range -1 to data_width_g-1;
  signal left_sample_r, right_sample_r : std_logic_vector(data_width_g-1 downto 0);

  -- Counter for generated clock
  signal bclk_counter_r  : integer range 0 to bclk_counter_step_c -1;
  signal lrclk_counter_r : integer range 0 to lrclk_counter_step_c-1;

  -- Register for output
  signal bclk_r, lrclk_r, data_out_r : std_logic;

begin
  sync : process (clk, rst_n)

    --Function take take lrclk_r as parameter to return output. The output is
    --either sample register or direction of data input
    impure function get_output_vector return std_logic_vector is
    begin
      if (lrclk_counter_r = lrclk_counter_step_c -1)then
        if (lrclk_r = '0') then
          return left_data_in;
        else
          return right_data_in;
        end if;
      else
        if (lrclk_r = '1') then
          return left_sample_r;
        else
          return right_sample_r;
        end if;
      end if;
    end function;

  begin
    if (rst_n = '0') then
      left_sample_r   <= (others => '0');
      right_sample_r  <= (others => '0');
      bclk_counter_r  <= 0;
      lrclk_counter_r <= 0;
      bclk_r          <= '0';
      lrclk_r         <= '0';
      data_out_r      <= '0';
      bit_index_r     <= data_width_g -1;
    elsif (clk'event and clk = '1') then

      --Generate bclk
      if (bclk_counter_r /= bclk_counter_step_c -1) then
        bclk_counter_r <= bclk_counter_r + 1;
      else
        bclk_counter_r <= 0;
        bclk_r         <= not bclk_r;
        -- Transmit the next bit on rising clk edge if whole word is not
        -- transmitted yet
        if (bclk_r = '0' and bit_index_r /= -1) then
          data_out_r  <= get_output_vector(bit_index_r);
          bit_index_r <= bit_index_r -1;
        end if;

      end if;

      --Generate lrclk
      if (lrclk_counter_r /= lrclk_counter_step_c -1) then
        lrclk_counter_r <= lrclk_counter_r + 1;
      else
        lrclk_r         <= not lrclk_r;
        lrclk_counter_r <= 0;       
        -- Reset the bit clock in case lrclk counter is not divisible by bit clock
        bclk_counter_r  <= 0;
        bclk_r          <= '0';
        bit_index_r     <= data_width_g -1;
        -- Read sample on rising edge of the lrclk
        if (lrclk_r = '0') then
          left_sample_r  <= left_data_in;
          right_sample_r <= right_data_in;
        end if;
      end if;
      
    end if;
    
    end process;

    aud_bclk_out  <= bclk_r;
    aud_lrclk_out <= lrclk_r;
    aud_data_out  <= data_out_r;

  end architecture RTL;











