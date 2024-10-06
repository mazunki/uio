
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity self_test_unit is
	port (
		mclk 	: in std_logic;
		reset 	: in std_logic;
		d0		: out std_logic_vector(3 downto 0);
		d1		: out std_logic_vector(3 downto 0)
	);
end self_test_unit;

architecture test_unit of self_test_unit is
type MEMORY is array (0 to 15) of std_logic_vector(3 downto 0);
	constant ROM_0 : MEMORY := (
		x"1", x"3", x"4", x"0",
		x"5", x"7", x"0", x"8",
		x"9", x"0", x"A", x"3",
		x"0", x"C", x"6", x"0"
	);
	constant ROM_1 : MEMORY := (
		x"2", x"4", x"0", x"0",
		x"6", x"3", x"0", x"6",
		x"0", x"0", x"B", x"0",
		x"0", x"6", x"5", x"0"
	);

signal tb_int		: integer := 0;
signal second_tick	: integer := 0;

begin
	CLK_0: process (mclk, reset) begin
		if rising_edge(mclk) then
			second_tick <= (second_tick + 1) mod 10000000; -- 10^8 s
			if second_tick = 0 then
				tb_int <= (tb_int + 1) mod 16;
			end if;
		end if;

		if second_tick = 0 then
			d0 <= ROM_0(tb_int);
			d1 <= ROM_1(tb_int);
		end if;
	end process CLK_0;

end architecture test_unit;