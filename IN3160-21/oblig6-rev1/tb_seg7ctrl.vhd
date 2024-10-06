library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity tb_seg7ctrl is
end tb_seg7ctrl;

architecture tb_beh of tb_seg7ctrl is
	component seg7ctrl
		port
		(
			mclk 	: in std_logic; -- 100 Mhz, positive flank
			reset 	: in std_logic; -- async, active high
			d0 		: in std_logic_vector(3 downto 0); -- bin value
			d1 		: in std_logic_vector(3 downto 0); -- bin value
			abcdefg	: out std_logic_vector(6 downto 0); -- ssd
			c 		: out std_logic -- selector
		);
	end component;

signal tb_d0 : std_logic_vector(3 downto 0) := "0000";
signal tb_d1 : std_logic_vector(3 downto 0) := "0000";

signal clk : std_logic := '0';
signal reset : std_logic := '0';

signal tb_out: std_logic_vector(6 downto 0);
signal tb_c	 : std_logic;

begin
	UUT : entity work.seg7ctrl(beh)
		port map (
			mclk	=> clk,
			reset 	=> reset,
			d0 		=> tb_d0,
			d1 		=> tb_d1,
			abcdefg => tb_out,
			c 		=> tb_c
		);

	CLK_0: process begin
		clk <= '0';
		wait for 10 ns;
		clk <= '1';
		wait for 10 ns;
	end process CLK_0;

	CLK_1: process 
	 	variable tb_int : integer := 0;
	begin
		if rising_edge(clk) then
			tb_int := (tb_int + 1) mod 16;
		end if;

		-- could check tb_c for these, but ultimately it shouldn't matter 
		-- since we're filtering on c anyway, ... i think
		tb_d0 <= std_logic_vector(to_unsigned(tb_int, tb_d0'length));
		tb_d1 <= std_logic_vector(to_unsigned(tb_int, tb_d1'length));
		wait for 5 ns;
	end process CLK_1;

end architecture tb_beh;