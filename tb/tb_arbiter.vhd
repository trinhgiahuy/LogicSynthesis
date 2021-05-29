------------------------------------------------------------------
-- Name		   : tb_arbiter.vhd
-- Description : Testbench for arbiter.vhd
-- Designed by : Claudio Avi Chami - FPGA Site
-- Date        : 15/04/2016
-- Version     : 01
------------------------------------------------------------------
library ieee;
    use ieee.std_logic_1164.all;
    use ieee.std_logic_textio.all;
	use ieee.numeric_std.ALL;
    use std.textio.all;
    
entity tb_arbiter is
end entity;

architecture test of tb_arbiter is

    constant PERIOD     : time   := 20 ns;
    constant ARBITER_W  : natural := 3;
	
    signal clk       : std_logic := '0';
    signal rst       : std_logic := '1';
    signal req       : std_logic_vector(ARBITER_W-1 downto 0) := (others => '0');
    signal endSim	 : boolean   := false;

    component arbiter_rr  is
	generic (
		ARBITER_W		: natural := 4
	);
	port (
		clk: 		in std_logic;
		rst: 		in std_logic;
		
		-- inputs
		req:		in std_logic_vector(ARBITER_W-1 downto 0);
		
		-- outputs
		gnt:		out std_logic_vector(ARBITER_W-1 downto 0)
	);
    end component;
    

begin
    clk     <= not clk after PERIOD/2;
    rst     <= '0' after  PERIOD*10;

	-- Main simulation process
	process 
	begin
		req <= "000";
	
		wait until (rst = '0');
		wait until (rising_edge(clk));

		wait until (rising_edge(clk));
		req <= "100";
		for I in 0 to 5 loop
			wait until (rising_edge(clk));
		end loop;	
		req <= "010";
		for I in 0 to 3 loop
			wait until (rising_edge(clk));
		end loop;	
		req <= "001";
		for I in 0 to 2 loop
			wait until (rising_edge(clk));
		end loop;	
		req <= "110";
		for I in 0 to 3 loop
			wait until (rising_edge(clk));
		end loop;	
		req <= "001";
		for I in 0 to 3 loop
			wait until (rising_edge(clk));
		end loop;	
		req <= "110";
		for I in 0 to 3 loop
			wait until (rising_edge(clk));
		end loop;	
		req <= "001";
		for I in 0 to 3 loop
			wait until (rising_edge(clk));
		end loop;	
		req <= "110";
		for I in 0 to 3 loop
			wait until (rising_edge(clk));
		end loop;	
		endSim  <= true;
	end	process;	
		
	-- End the simulation
	process 
	begin
		if (endSim) then
			assert false 
				report "End of simulation." 
				severity failure; 
		end if;
		wait until (rising_edge(clk));
	end process;	

    arb_inst : arbiter_rr
    generic map (
		ARBITER_W	 => ARBITER_W
	)
    port map (
        clk      => clk,
        rst	     => rst,
		
        req  	 => req,
        gnt      => open
    );

end architecture;