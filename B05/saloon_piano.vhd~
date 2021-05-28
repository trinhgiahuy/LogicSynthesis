-------------------------------------------------------------------------------
-- Title      : Bonus 05
-- Project    : Modern "Saloon Piano"
-------------------------------------------------------------------------------
-- File       : saloon_piano.vhd
-- Author     : Trinh Gia Huy, Rajesh Singapati
-- Company    : Tampere University
-- Created    : 2021-03-07
-- Last update: 2021-03-07
-- Platform   : 
-- Standard   : VHDL'93/02
-------------------------------------------------------------------------------
-- Description: A block that plays some simple melody automagically
-------------------------------------------------------------------------------
-- Copyright (c) 2020 
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author          Description
-- 2020-01-17  1.0      Trinh Huy       Created
-------------------------------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity saloon_piano is
  generic (clk_freq_g    : integer := 12288000;
           sample_rate_g : integer := 48000;
           data_width_g  : integer := 16;
           n_keys_g      : integer := 4
           );
  port (
    keys_in       : in  std_logic_vector(n_keys_g -1 downto 0);
    clk, rst_n    : in  std_logic;
    aud_bclk_out  : out std_logic;
    aud_data_out  : out std_logic;
    aud_lrclk_out : out std_logic
    );
end saloon_piano;

-------------------------------------------------------------------------------

architecture structural of saloon_piano is

  -- A counter for 12 288 000 counts which is equal to 1 second
  signal orchestra_counter   : integer;
  constant tone_maximum_c    : integer         := clk_freq_g/2;
  -- The number of melody notes (D, G, C, B, E, F, A)
  constant number_of_notes_c : integer         := 7;
  -- Array to hold the output waveform
  type dimensional_array_type is array (0 to number_of_notes_c-1) of std_logic_vector((data_width_g)-1 downto 0);
  signal output_melody       : dimensional_array_type;
  -- Array for the twinkle song
  type note_array_type is array (0 to data_width_g) of integer;
  signal song_notebook       : note_array_type := (others => 0);
  -- Constants fot the frequency of every note
  constant c_note            : integer         := 523*5;
  constant d_note            : integer         := 587*5;
  constant e_note            : integer         := 629*5;
  constant f_note            : integer         := 698*5;
  constant g_note            : integer         := 783*5;
  constant a_note            : integer         := 880*5;
  constant b_note            : integer         := 987*5;

  constant logic_one_c   : std_logic := '1';
  -- A signal to hole the melody audio output to be passed to the audio controller
  signal internal_melody : std_logic_vector(data_width_g-1 downto 0);
  -- To count which note are we producing every second
  signal note_counter    : integer   := 0;

  -- Define components
  component wave_gen is
    generic (
      width_g     : integer;
      step_g      : integer;
      frequency_g : integer;
      ref_clk_g   : integer);

    port (
      clk, rst_n, sync_clear_n_in : in  std_logic;
      value_out                   : out std_logic_vector(width_g-1 downto 0));
  end component wave_gen;

  component audio_ctrl is
    generic (
      ref_clk_freq_g : integer;
      sample_rate_g  : integer;
      data_width_g   : integer
      );

    port (
      left_data_in  : in  std_logic_vector(data_width_g -1 downto 0);
      right_data_in : in  std_logic_vector(data_width_g -1 downto 0);
      clk           : in  std_logic;
      rst_n         : in  std_logic;
      aud_bclk_out  : out std_logic;
      aud_data_out  : out std_logic;
      aud_lrclk_out : out std_logic
      );
  end component audio_ctrl;


begin  -- structural

  -- Initializing the song notebook with the corresponding melody notes
  song_notebook(0)  <= 0;
  song_notebook(1)  <= 0;
  song_notebook(2)  <= 4;
  song_notebook(3)  <= 4;
  song_notebook(4)  <= 5;
  song_notebook(5)  <= 5;
  song_notebook(6)  <= 4;
  song_notebook(7)  <= 6;
  song_notebook(8)  <= 3;
  song_notebook(9)  <= 3;
  song_notebook(10) <= 0;
  song_notebook(11) <= 0;
  song_notebook(12) <= 1;
  song_notebook(13) <= 1;
  song_notebook(14) <= 0;
  song_notebook(15) <= 6;

  -- Defining a wave generator for every note
  -- and saving their audio output in the array type
  c_wave : wave_gen
    generic map (
      width_g     => data_width_g,
      frequency_g => c_note,
      ref_clk_g   => clk_freq_g,
      step_g      => 1
      )
    port map (
      rst_n           => rst_n,
      clk             => clk,
      sync_clear_n_in => logic_one_c,
      value_out       => output_melody(0)
      );

  d_wave : wave_gen
    generic map (
      width_g     => data_width_g,
      frequency_g => d_note,
      ref_clk_g   => clk_freq_g,
      step_g      => 1
      )
    port map (
      rst_n           => rst_n,
      clk             => clk,
      sync_clear_n_in => logic_one_c,
      value_out       => output_melody(1)
      );

  e_wave : wave_gen
    generic map (
      width_g     => data_width_g,
      frequency_g => e_note,
      ref_clk_g   => clk_freq_g,
      step_g      => 1
      )
    port map (
      rst_n           => rst_n,
      clk             => clk,
      sync_clear_n_in => logic_one_c,
      value_out       => output_melody(2)
      );

  f_wave : wave_gen
    generic map (
      width_g     => data_width_g,
      frequency_g => f_note,
      ref_clk_g   => clk_freq_g,
      step_g      => 1
      )
    port map (
      rst_n           => rst_n,
      clk             => clk,
      sync_clear_n_in => logic_one_c,
      value_out       => output_melody(3)
      );

  g_wave : wave_gen
    generic map (
      width_g     => data_width_g,
      frequency_g => g_note,
      ref_clk_g   => clk_freq_g,
      step_g      => 1
      )
    port map (
      rst_n           => rst_n,
      clk             => clk,
      sync_clear_n_in => logic_one_c,
      value_out       => output_melody(4)
      );

  a_wave : wave_gen
    generic map (
      width_g     => data_width_g,
      frequency_g => a_note,
      ref_clk_g   => clk_freq_g,
      step_g      => 1
      )
    port map (
      rst_n           => rst_n,
      clk             => clk,
      sync_clear_n_in => logic_one_c,
      value_out       => output_melody(5)
      );

  -- Putting an extra tone for the silence between chorus parts 
  output_melody(number_of_notes_c-1) <= (others => '0');

  -- Instantiating the audio controller and mapping its I/Os
  audio_controller : audio_ctrl
    generic map (
      ref_clk_freq_g => clk_freq_g,
      sample_rate_g  => sample_rate_g,
      data_width_g   => data_width_g
      )
    port map (
      left_data_in  => internal_melody,
      right_data_in => internal_melody,
      clk           => clk,
      rst_n         => rst_n,
      aud_bclk_out  => aud_bclk_out,
      aud_data_out  => aud_data_out,
      aud_lrclk_out => aud_lrclk_out
      );

  one_second : process(rst_n, clk)
  begin
    -- Checking for reset signal
    if (rst_n = '0') then
      -- Resetting the 1 second counter and the note counter
      orchestra_counter <= 0;
      note_counter      <= 0;
    elsif (clk'event and clk = '1') then
      -- Move to the next tone after 1 second
      orchestra_counter <= orchestra_counter + 1;
      if orchestra_counter = tone_maximum_c then
        orchestra_counter <= 0;
        if note_counter = data_width_g then
          note_counter <= 0;
        else
          note_counter <= note_counter + 1;
        end if;

      end if;
    end if;
  end process one_second;
  -- Assigning current note to the audio controller
  internal_melody <= output_melody(song_notebook(note_counter));
end structural;
