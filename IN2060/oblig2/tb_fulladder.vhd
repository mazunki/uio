library IEEE;
	use IEEE.STD_LOGIC_1164.all;
entity tb_fulladder is
end entity tb_fulladder;

architecture behavioral of tb_fulladder is
	component fulladder is
		port(
			a, b	: in std_logic;
			cin	: in std_logic;
			s 	: out std_logic;
			cout	: out std_logic
		);
	end component;

	signal tb_a, tb_b, tb_cin	: std_logic := '0';
	signal tb_s, tb_cout 		: std_logic;

begin 
	DUT: fulladder
	port map(
		a	=> tb_a,
		b 	=> tb_b,
		cin 	=> tb_cin,
		s	=> tb_s,
		cout	=> tb_cout
	);

	process begin
		wait for 10 ns;
		tb_a 	<= '0';
		tb_b 	<= '0';
		tb_cin 	<= '0';

		wait for 10 ns;
		tb_a 	<= '0';
		tb_b 	<= '0';
		tb_cin 	<= '1';

		wait for 10 ns;
		tb_a 	<= '0';
		tb_b 	<= '1';
		tb_cin 	<= '0';

		wait for 10 ns;
		tb_a 	<= '0';
		tb_b 	<= '1';
		tb_cin 	<= '1';

		wait for 10 ns;
		tb_a 	<= '1';
		tb_b 	<= '0';
		tb_cin 	<= '0';

		wait for 10 ns;
		tb_a 	<= '1';
		tb_b 	<= '0';
		tb_cin 	<= '1';

		wait for 10 ns;
		tb_a 	<= '1';
		tb_b 	<= '1';
		tb_cin 	<= '0';

		wait for 10 ns;
		tb_a 	<= '1';
		tb_b 	<= '1';
		tb_cin 	<= '1';

		wait for 10 ns;
		report("Ferdig") severity note;
		std.env.stop;
	end process;

end architecture behavioral;
