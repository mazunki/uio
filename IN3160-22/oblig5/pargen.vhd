-- *******************************************************
-- ** Pargen, parity bit is odd (1) if the parity is odd *
-- ** If the parity is even parity bit is even (0)			 *
-- *******************************************************
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.subprog_pck.all;

entity pargen is 
	generic (
		WIDTH : integer := 16
	);
	port (
		rst_n  			: in	std_logic;
		mclk   			: in	std_logic;
		indata1			: in	std_logic_vector(WIDTH-1 downto 0);
		indata2			: in	unsigned(WIDTH-1 downto 0);
		par    			: out std_logic
	);	
end pargen;

architecture rtl1 of pargen is 
begin	
	-- clocked process for creating stable and synchronized output
	process (rst_n, mclk) is begin
		if (rst_n = '0') then 
			par <= '0';
		elsif rising_edge(mclk) then 
			par <= get_parity_one(indata1) xor get_parity_two(indata2);
		end if;
	end process;
end rtl1;

