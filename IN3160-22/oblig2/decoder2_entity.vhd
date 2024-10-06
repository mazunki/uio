library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;


-- external stuff
entity decoder2_entity is 
	port (
		sw : in std_logic_vector(1 downto 0); -- sw2, sw1
		ld : out std_logic_vector(3 downto 0) -- ld4, ld3, ld2, ld1
	);
end decoder2_entity;
