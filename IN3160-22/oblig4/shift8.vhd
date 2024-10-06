library ieee;
use ieee.std_logic_1164.all;

entity shift8 is
	port (
		rst_n	: in	std_logic; -- active low
		mclk	: in	std_logic;

		ser_in	: in	std_logic;
		par_out : out	std_logic_vector(7 downto 0)
	);

end shift8;

architecture shift8_arch of shift8 is
	component dff port (
			rst_n	: in	std_logic;
			mclk	: in	std_logic;
			din 	: in	std_logic;
			dout	: out	std_logic
		);
	end component dff;
begin
	u1 : dff port map ( rst_n => rst_n,	mclk => mclk,	din => ser_in,  	dout => par_out(7) );
	u2 : dff port map ( rst_n => rst_n,	mclk => mclk,	din => par_out(7),	dout => par_out(6) );
	u3 : dff port map ( rst_n => rst_n,	mclk => mclk,	din => par_out(6),	dout => par_out(5) );
	u4 : dff port map ( rst_n => rst_n,	mclk => mclk,	din => par_out(5),	dout => par_out(4) );
	u5 : dff port map ( rst_n => rst_n,	mclk => mclk,	din => par_out(4),	dout => par_out(3) );
	u6 : dff port map ( rst_n => rst_n,	mclk => mclk,	din => par_out(3),	dout => par_out(2) );
	u7 : dff port map ( rst_n => rst_n,	mclk => mclk,	din => par_out(2),	dout => par_out(1) );
	u8 : dff port map ( rst_n => rst_n,	mclk => mclk,	din => par_out(1),	dout => par_out(0) );
end shift8_arch;
