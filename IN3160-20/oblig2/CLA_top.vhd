
library IEEE;
	use IEEE.STD_LOGIC_1164.all;

entity CLA_top is
	port(
		a, b	: in std_logic_vector(31 downto 0);
		cin 	: in std_logic;
		sum	: out std_logic_vector(31 downto 0);
		cout	: out std_logic
	);
end entity CLA_top;

architecture mixed of CLA_top is
	component CLA_block is
		port(
			a, b	: in std_logic_vector(3 downto 0);
			cin	: in std_logic;
			s	: out std_logic_vector(3 downto 0);
			cout	: out std_logic
		);
	end component;

	signal c	: std_logic_vector(0 to 8); -- 0 is cin, 1-8 inclusive for cla_adders' inputs
begin

	c(8) <= cin;
	-- starting at the last four bit, working our way upwards the chain
	-- use carry from previous output as current carry input
	-- using c(8) for invisible carry position
	clas : for i in 7 downto 0 generate
		new_cla : CLA_block port map(
			a => a(31-i*4 downto 28-i*4), 
			b => b(31-i*4 downto 28-i*4), 
			cin => c(i+1),
			--
			s => sum(31-i*4 downto 28-i*4), 
			cout => c(i)
		);
	end generate clas;

	cout <= c(0);

end architecture;

