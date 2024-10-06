library ieee;
use ieee.std_logic_1164.all;

entity tb_shiftn is
	-- nil
end tb_shiftn;

architecture tb_shiftn_arch of tb_shiftn is
	component shiftn
		generic ( N : integer );
		port (
			rst_n	: in	std_logic;
			mclk 	: in	std_logic;

			ser_in	: in	std_logic;
			par_out	: out	std_logic_vector(63 downto 0)
		);
	end component;

	signal mclk			: std_logic := '0';
	signal ser_in		: std_logic;
	signal par_out		: std_logic_vector(63 downto 0);
	signal rst_n		: std_logic;
	signal some_bits	: std_logic_vector(63 downto 0) := x"0183abcdef456729";

begin
	UUT: entity work.shiftn(shiftn_arch)
	generic map ( N => 64 )
	port map (
		ser_in	=> ser_in,
		par_out	=> par_out,
		mclk 	=> mclk,
		rst_n 	=> rst_n
	);

	p1: process begin
		for b in some_bits'range loop
			-- ser_in is a signal, so this 
			-- shouldn't work inside a process...? yet it does??
			ser_in <= some_bits(b);
			wait for 50 ns;
		end loop;
		wait for 50*64 ns;

		wait for 500 ns;
		rst_n <= '0';
		wait for 50 ns;
		rst_n <= '1';
		wait for 500 ns;

		std.env.stop;
	end process p1;

	CLK_0: process begin
		mclk <= '0';
		wait for 50 ns;
		mclk <= '1';
		wait for 50 ns;
	end process CLK_0;


end tb_shiftn_arch;
