library IEEE;
	use IEEE.STD_LOGIC_1164.all;

entity halfadder is
	port(
		a, b	: in std_logic;
		s	: out std_logic;
		c	: out std_logic
	);
end entity halfadder;

architecture dataflow of halfadder is
begin
	s <= a xor b;
	c <= a and b;
end architecture dataflow;

