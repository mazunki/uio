library ieee;
use ieee.std_logic_1164.all;

entity shift32 is
	port (
		rst_n	: in	std_logic; -- active low
		mclk	: in	std_logic;

		ser_in	: in	std_logic;
		par_out : out	std_logic_vector(31 downto 0)
	);

end shift32;

architecture shift32_arch of shift32 is
	component dff port (
			rst_n	: in	std_logic;
			mclk	: in	std_logic;
			din 	: in	std_logic;
			dout	: out	std_logic
		);
	end component dff;
begin
	first: dff port map (
		rst_n	=> rst_n,
		mclk	=> mclk,
		din		=> ser_in,
		dout	=> par_out(31)
	);

	following: for i in 31 downto 1 generate
		unit: entity work.dff
			port map (
				rst_n	=> rst_n,
				mclk	=> mclk,
				din		=> par_out(i),
				dout	=> par_out(i-1)
			);
	end generate following;
end shift32_arch;
