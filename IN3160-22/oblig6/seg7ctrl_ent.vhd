library IEEE;
use IEEE.std_logic_1164.all;
use work.bin2ssd_pck.all;

entity seg7ctrl is
	port (
		mclk 	: in  std_logic; -- 100 Mhz, positive flank
		reset 	: in  std_logic; -- async, active high
		d0 		: in  std_logic_vector(3 downto 0);  -- bin value
		d1 		: in  std_logic_vector(3 downto 0);  -- bin value
		abcdefg	: out std_logic_vector(6 downto 0); -- ssd
		c 		: out std_logic => '0'-- selector
	);
end seg7ctrl;

