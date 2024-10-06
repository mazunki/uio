
library ieee;
use ieee.std_logic_1164.all;

entity shift32 is
	port(
		ser_in 	: in	std_logic;
		par_out : out 	std_logic_vector(31 downto 0); -- inclusive on both ends

		clk		: in 	std_logic;
		rst_n 	: in 	std_logic -- active low
	);
end shift32;

architecture shift32_arch of shift32 is
	component dff port (rst_n : in std_logic;
						mclk : in std_logic;
						din : in std_logic;
						dout : out std_logic
						);
	end component;
begin
	first_dff_unit : dff
 		port map (
			rst_n	=> rst_n,
			mclk 	=> clk,
			din		=> ser_in,
			dout 	=> par_out(31)
		);

	dff_gen: for i in 30 downto 0 generate
		dff_unit : dff
 		port map (
			rst_n	=> rst_n,
			mclk 	=> clk,
			din		=> par_out(i+1),
			dout 	=> par_out(i)
		);
	end generate dff_gen;

end shift32_arch;