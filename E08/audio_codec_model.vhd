-------------------------------------------------------------------------------
-- Title      : EX08 : audio_codec_model.vhd
-- Project    : 
-------------------------------------------------------------------------------
-- File       : audio_codec_model.vhd
-- Author     : Trinh Gia Huy
-- Company    : 
-- Created    : 2021-01-24
-- Last update: 2021-01-25
-- Platform   : 
-- Standard   : VHDL'93/02
-------------------------------------------------------------------------------
-- Description: Simulate physicsal audio codec, convert serial input to
-- paralllel output
-------------------------------------------------------------------------------
-- Copyright (c) 2021 
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author                  Description
-- 2021-01-24  1.0      Trinh Gia Huy           Created
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity audio_codec_model is
  generic (data_width_g : integer := 16);
  port(
    rst_n : in std_logic;
    aud_data_in, aud_bclk_in, aud_lrclk_in : in std_logic;
    value_left_out, value_right_out : out std_logic_vector(data_width_g - 1 downto 0)
    );
end entity audio_codec_model;

architecture RTL of audio_codec_model is

  type state_type is (wait_for_input, read_left, read_right);
  signal curr_state_r : state_type;

  --Buffer for input, LSB does not need for buffer thus the length is shorter 1
  --bit compared to data_width_g
  signal curr_word_r : std_logic_vector(data_width_g - 1 downto 1);

  --Bit index to read. Value -1 indicate the words is fully read
  signal bit_index_r : integer range -1 to curr_word_r'high -1;

  
  signal value_left_out_r, value_right_out_r : std_logic_vector(data_width_g -1 downto 0);

begin

  sync : process (aud_bclk_in, rst_n)


    --Two procedures are created to optimizing the code's repitation that
    --allowed for reusability

    --Procedure is used to change state. It read the MSB of next word and
    --reset bit xindex
    procedure chage_state_to (next_state : state_type) is
    begin
      curr_state_r <= next_state;

      curr_word_r <= aud_data_in & (curr_word_r'HIGH -1 downto curr_word_r'LOW => '0');

      bit_index_r <= curr_word_r'high -1;
    end procedure ;


    --Procedure is used to read each bit of word. This should be called on each
    --rising clock edge when reading data but after the MSB has been read
    procedure take_next_bit (signal value_out : out std_logic_vector(data_width_g-1 downto 0))is
    begin
      if (bit_index_r = 0) then

        value_out <= curr_word_r & aud_data_in;

        --Set bit index -1 thus next branch will not execute until next state transition
        bit_index_r <= -1;

      elsif (bit_index_r /= -1 )then
        
        --Take the next bit and decrease the index

        curr_word_r(bit_index_r) <= aud_data_in;
        bit_index_r <= bit_index_r -1;

      end if;
    end procedure ;

  begin

    if (rst_n = '0') then
      curr_state_r <= wait_for_input;
      curr_word_r <= (others => '0');
      bit_index_r <= -1;
      value_left_out_r <= (others => '0');
      value_right_out_r <= (others => '0');

    elsif (aud_bclk_in'event and aud_bclk_in = '1') then

      case curr_state_r is

        when wait_for_input =>

          if (aud_lrclk_in = '1') then
            chage_state_to(read_left);
          end if;

        when read_left =>

          if (aud_lrclk_in = '0') then
            chage_state_to(read_right);
          else
            take_next_bit(value_left_out_r);
          end if;

        when read_right =>

          if (aud_lrclk_in = '1') then
            chage_state_to(read_left);
          else
            take_next_bit(value_right_out_r);
          end if;
      end case;
    end if;
  end process;

  value_right_out <= value_right_out_r;
  value_left_out <= value_left_out_r;

end architecture RTL;


                     
        
            
          
            
            

           
            
        
     
    
                     
    


  
