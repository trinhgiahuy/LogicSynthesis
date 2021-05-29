------------------------------------------------------------------
-- Name		   : arbiter_rr.vhd
-- Description : Arbiter with round-robin
-- Designed by : Claudio Avi Chami - FPGA Site
-- Date        : 18/04/2016
-- Version     : 01
------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity arbiter_rr is
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
end arbiter_rr;

architecture rtl of arbiter_rr is

	signal double_req : std_logic_vector(2*ARBITER_W-1 downto 0);
	signal double_gnt : std_logic_vector(2*ARBITER_W-1 downto 0);
	signal priority : std_logic_vector(ARBITER_W-1 downto 0);
	signal last_req : std_logic_vector(ARBITER_W-1 downto 0);

	begin 

double_req	<= req & req;
double_gnt  <= double_req and not std_logic_vector((unsigned(double_req)-unsigned(priority)));	

arbiter_pr: process (clk, rst) 
	begin 
    if (rst = '1') then 
        priority(ARBITER_W-1 downto 1) <= (others => '0');
		priority(0)	<= '1';
		last_req	<= (others => '0');
		gnt			<= (others => '0');
    elsif (rising_edge(clk)) then
		if (last_req /= req) then
			priority(ARBITER_W-1 downto 1) <= priority(ARBITER_W-2 downto 0);
			priority(0) <= priority(ARBITER_W-1);
			last_req	<= req;
			gnt 		<= double_gnt(ARBITER_W-1 downto 0) or double_gnt(2*ARBITER_W-1 downto ARBITER_W);
		end if;	
    end if;
end process arbiter_pr;

end rtl;