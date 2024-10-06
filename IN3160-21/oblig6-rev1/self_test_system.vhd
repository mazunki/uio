
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity self_test_system is
	port (
		clk 	: in std_logic; -- 100 Mhz, positive flank
		reset 	: in std_logic; -- async, active high
		abcdefg	: out std_logic_vector(6 downto 0); -- ssd
		c 		: out std_logic -- selector
	);
end self_test_system;

architecture test_system of self_test_system is
	component seg7ctrl
		port
		(
			clk 	: in std_logic; -- 100 Mhz, positive flank
			reset 	: in std_logic; -- async, active high
			d0 		: in std_logic_vector(3 downto 0); -- bin value
			d1 		: in std_logic_vector(3 downto 0); -- bin value
			abcdefg	: out std_logic_vector(6 downto 0); -- ssd
			c 		: out std_logic -- selector
		);
	end component;

signal d0 : std_logic_vector(3 downto 0);
signal d1 : std_logic_vector(3 downto 0);

begin
	IO : entity work.seg7ctrl(rom)
		port map (
			mclk	=> clk,
			reset 	=> reset,
			abcdefg => abcdefg,
			d0 		=> d0,
			d1 		=> d1,
			c 		=> c
		);
	STU : entity work.self_test_unit(test_unit) 
		port map (
			mclk 	=> clk,
			reset 	=> reset,
			d0		=> d0,
			d1 		=> d1
		);

end architecture test_system;