
library IEEE;
	use IEEE.STD_LOGIC_1164.all;

entity fulladder is
	port(
		a, b	: in std_logic;
		cin	: in std_logic;
		cout	: out std_logic;
		s	: out std_logic
	);
end entity fulladder;

architecture dataflow of fulladder is
begin
	s <= (a xor b) xor cin;
	cout <= (a and b) or (cin and (a xor b));
end architecture dataflow;

