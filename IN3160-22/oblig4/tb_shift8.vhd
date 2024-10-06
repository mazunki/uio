library ieee;
use ieee.std_logic_1164.all;

entity tb_shift8 is
	-- nil
end tb_shift8;

architecture tb_shift8_arch of tb_shift8 is
	component shift8 port (
		rst_n	: in	std_logic;
		mclk 	: in	std_logic;

		ser_in	: in	std_logic;
		par_out	: out	std_logic_vector(7 downto 0)
	);
	end component;

	signal mclk		: std_logic := '0';
	signal ser_in	: std_logic;
	signal par_out	: std_logic_vector(7 downto 0);
	signal rst_n	: std_logic;

begin
	UUT: entity work.shift8(shift8_arch)
	port map (
		ser_in	=> ser_in,
		par_out	=> par_out,
		mclk 	=> mclk,
		rst_n 	=> rst_n
	);
	
	ser_in	<=	'0',
				'1' after 300 ns,
				'0' after 350 ns,
				'1' after 400 ns,
				'0' after 500 ns,
				'1' after 800 ns;

	rst_n	<=	'1',
				'0' after 1500 ns,
				'1' after 1650 ns;
	
	CLK_0: process begin
		mclk <= '0';
		wait for 50 ns;
		mclk <= '1';
		wait for 50 ns;
	end process CLK_0;

end tb_shift8_arch;
