
library ieee;
use ieee.std_logic_1164.all;

entity shiftn is
	generic ( N : integer );
	port (
		ser_in 	: in	std_logic;
		par_out : out 	std_logic_vector(N-1 downto 0); -- inclusive on both ends

		clk		: in 	std_logic;
		rst_n 	: in 	std_logic -- active low
	);
end shiftn;

architecture shiftn_arch of shiftn is
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
			dout 	=> par_out(N-1)
		);

	dff_gen: for i in N-2 downto 0 generate
		dff_unit : dff
 		port map (
			rst_n	=> rst_n,
			mclk 	=> clk,
			din		=> par_out(i+1),
			dout 	=> par_out(i)
		);
	end generate dff_gen;
	

end shiftn_arch;