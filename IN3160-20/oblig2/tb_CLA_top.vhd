
library IEEE;
	use IEEE.STD_LOGIC_1164.all;
	use IEEE.numeric_std.all;

entity tb_CLA_top is
end entity tb_CLA_top;

architecture mixed of tb_CLA_top is
	component CLA_top is
		port(
			a, b	: in std_logic_vector(31 downto 0);
			cin	: in std_logic;
			--
			sum	: out std_logic_vector(31 downto 0);
			cout	: out std_logic
		);
	end component;

	signal tb_a, tb_b	: std_logic_vector(31 downto 0) := (others => '0');
	signal tb_cin		: std_logic := '0';
	signal tb_sum		: std_logic_vector(31 downto 0) := (others => '0');
	signal tb_cout		: std_logic := '0';

begin
	DUT : CLA_top
	port map(
		a => tb_a,
		b => tb_b,
		cin => tb_cin,
		--
		sum => tb_sum,
		cout => tb_cout
	);

	process begin
		tb_a <= std_logic_vector(to_unsigned(15, 32));
		tb_b <= std_logic_vector(to_unsigned(16, 32));
		wait for 20 ns;
		assert ( tb_sum = std_logic_vector(to_unsigned(31, 32))) report ("FAILED: 15+16 = 31") severity failure;

		wait for 10 ns;
		tb_a <= std_logic_vector(to_unsigned(15, 32));
		tb_b <= std_logic_vector(to_unsigned(4, 32));
		wait for 20 ns;
		assert ( tb_sum = std_logic_vector(to_unsigned(19, 32))) report ("FAILED: 15+4 = 19") severity failure;

		
		wait for 10 ns;
		tb_a <= std_logic_vector(to_unsigned(15, 32));
		tb_b <= std_logic_vector(to_unsigned(1, 32));
		wait for 20 ns;
		assert ( tb_sum = std_logic_vector(to_unsigned(16, 32))) report ("FAILED: 15+1 = 16") severity failure;

		wait for 10 ns;
		tb_a <= std_logic_vector(to_unsigned(5, 32));
		tb_b <= std_logic_vector(to_unsigned(1, 32));
		wait for 20 ns;
		assert ( tb_sum = std_logic_vector(to_unsigned(6, 32))) report ("FAILED: 5+1 = 6") severity failure;


		wait for 10 ns;
		tb_a <= std_logic_vector(to_unsigned(4091, 32));
		tb_b <= std_logic_vector(to_unsigned(1, 32));
		wait for 20 ns;
		assert ( tb_sum = std_logic_vector(to_unsigned(4092, 32))) report ("FAILED: 4091+1 = 4092") severity failure;


		wait for 10 ns;
		tb_a <= std_logic_vector(to_unsigned(4096, 32));
		tb_b <= std_logic_vector(to_unsigned(4096, 32));
		wait for 20 ns;
		assert ( tb_sum = std_logic_vector(to_unsigned(8192, 32))) report ("FAILED: 4096+4096 = 8192") severity failure;


		wait for 10 ns;
		tb_a <= std_logic_vector(to_unsigned(1, 32));
		tb_b <= std_logic_vector(to_unsigned(0, 32));
		wait for 20 ns;
		assert ( tb_sum = std_logic_vector(to_unsigned(1, 32))) report ("FAILED: 1+0 = 1") severity failure;


		wait for 10 ns;
		tb_a <= std_logic_vector(to_unsigned(1000055, 32));
		tb_b <= std_logic_vector(to_unsigned(2000005, 32));
		wait for 20 ns;
		assert ( tb_sum = std_logic_vector(to_unsigned(3000060, 32))) report ("FAILED: 1000055+2000005 = 3000060") severity failure;


		wait for 10 ns;
		tb_a <= std_logic_vector(to_unsigned(123456789, 32));
		tb_b <= std_logic_vector(to_unsigned(987654321, 32));
		wait for 20 ns;
		assert ( tb_sum = std_logic_vector(to_unsigned(1111111110, 32))) report ("FAILED: 123456789+987654321 = 1111111110") severity failure;


		wait for 10 ns;
		tb_a <= x"11110000";
		tb_b <= x"00001111";
		wait for 20 ns;
		assert ( tb_sum = x"11111111" ) report ("FAILED: 0x11110000 + 0x00001111 = 0x11111111") severity failure;
		

		wait for 10 ns;
		tb_a <= x"FFFFFFFF";
		tb_b <= std_logic_vector(to_unsigned(5, 32));
		wait for 20 ns;
		assert ( tb_sum = std_logic_vector(to_unsigned(4, 32))) report ("FAILED: 4294967295+5 = 4") severity failure;


		wait for 10 ns;
		tb_a <= x"FFFFFFFF";
		tb_b <= x"FFFFFFFF"; -- (2^32-1) * 2 = 2^33 - 2 => 2^32 - 1
		wait for 20 ns;
		assert ( tb_sum = x"FFFFFFFE" ) report ("FAILED: 2^32-1 + 2^32-1 = 0") severity failure;



		report("Ferdig!") severity note;
		std.env.stop;
	end process;

end architecture mixed;
