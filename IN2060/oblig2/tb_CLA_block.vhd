
library IEEE;
	use IEEE.STD_LOGIC_1164.all;

entity tb_CLA_block is
end entity tb_CLA_block;

architecture mixed of tb_CLA_block is
	component CLA_block is
		port(
			a, b	: in std_logic_vector(3 downto 0);
			cin	: in std_logic;
			--
			s	: out std_logic_vector(3 downto 0);
			cout	: out std_logic
		);
	end component;

	signal tb_a, tb_b	: std_logic_vector(3 downto 0) := (others => '0');
	signal tb_cin		: std_logic := '0';
	signal tb_s		: std_logic_vector(3 downto 0) := (others => '0');
	signal tb_cout		: std_logic := '0';

begin
	DUT : CLA_block
	port map(
		a => tb_a,
		b => tb_b,
		cin => tb_cin,
		--
		s => tb_s,
		cout => tb_cout
	);

	process begin
		tb_a <= "0111";
		tb_b <= "0000";
		wait for 20 ns;
		assert ( tb_s = "0111" ) report ("FAILED: 0111+0000 = 0111") severity failure;

		wait for 10 ns;
		tb_a <= "0110";
		tb_b <= "0001";
		wait for 20 ns;
		assert ( tb_s = "0111" ) report ("FAILED: 0110+0001 = 0111") severity failure;

		wait for 10 ns;
		tb_a <= "0101";
		tb_b <= "0001";
		wait for 20 ns;
		assert ( tb_s = "0110" ) report ("FAILED: 0101+0001 = 0110") severity failure;

		wait for 10 ns;
		tb_a <= "0111";
		tb_b <= "0001";
		wait for 20 ns;
		assert ( tb_s = "1000" ) report ("FAILED: 0111+0001 = 1000") severity failure;

		wait for 10 ns;
		tb_a <= "1111";
		tb_b <= "0001";
		wait for 20 ns;
		assert ( tb_s = "0000" ) report ("FAILED: 1111+0001 = 0000") severity failure;

		wait for 10 ns;
		tb_a <= "1111";
		tb_b <= "1111";
		wait for 20 ns;
		assert ( tb_s = "1110" ) report ("FAILED: 1111+1111 = 1110") severity failure;

		report("Ferdig!") severity note;
		std.env.stop;
	end process;

end architecture mixed;
