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
-- Date        Version  Author 		Description
-- 2020-01-17  1.0      Trinh Huy  	Created
-------------------------------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity saloon_piano is 
  -- Defining the generic operands data width, reference clock and sample rate
  generic (clk_freq_g : integer := 12288000;
           sample_rate_g  : integer := 48000;
           data_width_g   : integer := 16;
		   n_keys_g		  : integer := 4
           );
  port (
    keys_in  	  : in  std_logic_vector(n_keys_g -1 downto 0);
    clk           : in  std_logic;
    rst_n         : in  std_logic;
    aud_bclk_out  : out std_logic;
    aud_data_out  : out std_logic;
    aud_lrclk_out : out std_logic
    );
end  saloon_piano;

-------------------------------------------------------------------------------

architecture structural of  saloon_piano is

  -- A counter to count for 12 288 000 which is equivalent to 1 second
  signal orchestra_counter : integer;
  constant tone_maximum_c : integer := clk_freq_g/2 ; 
  -- The number of melody notes (D, G, C, B, E, F, A)
  constant number_of_notes_c : integer := 7;
  -- Array to hold the output waveform of notes of different frequency in order to scan through it every second with a counter
  TYPE dimensional_array_type is array (0 to number_of_notes_c-1) of std_logic_vector((data_width_g)-1 downto 0);
  signal output_melody : dimensional_array_type;
  -- Array type, and array instance for the twinkle twinkle song
  TYPE note_array_type is array (0 to data_width_g) of integer;
  signal twinkle_notebook : note_array_type := (others => 0);
  -- Constants fot the frequency of every note
  constant c_note : integer := 523*5 ;
  constant d_note : integer := 587*5 ;
  constant e_note : integer := 629*5 ; -- originally 659
  constant f_note : integer := 698*5 ;
  constant g_note : integer := 783*5 ;
  constant a_note : integer := 880*5 ;
  constant b_note : integer := 987*5 ;
  
  constant logic_one_c : std_logic := '1';
  -- A signal to hole the melody audio output to be passed to the audio controller
  signal internal_melody : std_logic_vector(data_width_g-1 downto 0);
  -- To count which note are we producing every second
  signal note_counter : integer := 0;
  
  -- Defining the wave generator component
  component wave_gen
    generic (
      width_g : integer;
	  frequency_g : integer;
	  ref_clk_g : integer;
      step_g  : integer);
    port (
      rst_n           : in  std_logic;
      clk             : in  std_logic;
      sync_clear_n_in : in  std_logic;
      value_out       : out std_logic_vector(width_g-1 downto 0));
  end component;

  -- Defining the audio controller component
  component audio_ctrl is
    generic (ref_clk_freq_g : integer;
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
  end component;


begin  -- structural

	-- Initializing the notebook of the song with the corresponding melody notes
	twinkle_notebook(0) <= 0;	
	twinkle_notebook(1) <= 0;	
	twinkle_notebook(2) <= 4;	
	twinkle_notebook(3) <= 4;	
	twinkle_notebook(4) <= 5;	
	twinkle_notebook(5) <= 5;	
	twinkle_notebook(6) <= 4;	
	twinkle_notebook(7) <= 6;	
	twinkle_notebook(8) <= 3;	
	twinkle_notebook(9) <= 3;
	twinkle_notebook(10) <= 0;	
	twinkle_notebook(11) <= 0;	
	twinkle_notebook(12) <= 1;	
	twinkle_notebook(13) <= 1;	
	twinkle_notebook(14) <= 0;
	twinkle_notebook(15) <= 6;

	-- Defining a wave generator for every note
	-- and saving their audio output in the array type
	c_wave : wave_gen
	  generic map (
		width_g => data_width_g,
		frequency_g => c_note,
		ref_clk_g => clk_freq_g,
		step_g => 1
		)
	  port map (
		rst_n           => rst_n,
		clk             => clk,
		sync_clear_n_in => logic_one_c,
		value_out       => output_melody(0)
		);

	d_wave : wave_gen
	  generic map (
		width_g => data_width_g,
		frequency_g => d_note,
		ref_clk_g => clk_freq_g,
		step_g => 1
		)
	  port map (
		rst_n           => rst_n,
		clk             => clk,
		sync_clear_n_in => logic_one_c,
		value_out       => output_melody(1)
		);

	e_wave : wave_gen
	  generic map (
		width_g => data_width_g,
		frequency_g => e_note,
		ref_clk_g => clk_freq_g,
		step_g => 1
		)
	  port map (
		rst_n           => rst_n,
		clk             => clk,
		sync_clear_n_in => logic_one_c,
		value_out       => output_melody(2)
		);

	f_wave : wave_gen
	  generic map (
		width_g => data_width_g,
		frequency_g => f_note,
		ref_clk_g => clk_freq_g,
		step_g => 1
		)
	  port map (
		rst_n           => rst_n,
		clk             => clk,
		sync_clear_n_in => logic_one_c,
		value_out       => output_melody(3)
		);

	g_wave : wave_gen
	  generic map (
		width_g => data_width_g,
		frequency_g => g_note,
		ref_clk_g => clk_freq_g,
		step_g => 1
		)
	  port map (
		rst_n           => rst_n,
		clk             => clk,
		sync_clear_n_in => logic_one_c,
		value_out       => output_melody(4)
		);	

	a_wave : wave_gen
	  generic map (
		width_g => data_width_g,
		frequency_g => a_note,
		ref_clk_g => clk_freq_g,
		step_g => 1
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
		  note_counter <= 0;		  
		elsif (clk'event and clk = '1') then
			-- Normal incrementing of the 1 second counter and if it reaches 
			-- 1 second then move to the next tone to be played
			orchestra_counter <= orchestra_counter + 1;
			if orchestra_counter = tone_maximum_c then
				orchestra_counter <= 0;
				if  note_counter = data_width_g then
					note_counter <= 0;
			    else
					note_counter <= note_counter + 1;
				end if;
				
			end if;
		end if;
	end process one_second;
	-- Assigning the current note to the output to be played throught the audio controller
	internal_melody <= output_melody(twinkle_notebook(note_counter));
end structural;
