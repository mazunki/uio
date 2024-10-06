library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use std.textio.all;

entity ROM is
	generic (filename : string := "ROM.dat");
	port (
			 mclk : in std_logic;
			 addr : in std_logic_vector(4 downto 0);
			 data : out std_logic_vector(7 downto 0)
		 );
end entity ROM;

architecture rom of ROM is
	type MEMORY is array (0 to 19) of std_logic_vector(7 downto 0);

--	constant ROM_0 : MEMORY := (
--		x"11", x"53", x"4a", x"b0",
--		x"25", x"47", x"0a", x"c8",
--		x"39", x"30", x"Aa", x"23",
--		x"40", x"2C", x"6a", x"90",
--		x"50", x"1C", x"6a", x"00"
--	);

	impure function getRomValues return MEMORY is
		file f : text open read_mode is filename;
		variable fl : line;
		variable rom_values : memory;
	begin
		for i in MEMORY'range loop
			readline(f, fl);
			read(fl, rom_values(i));
		end loop;
		return rom_values;
	end function;

	signal ROM_0 : MEMORY := getRomValues;
	-- attribute rom_style : string;
	-- attribute rom_style of rom : signal is "block";

	begin
		process (mclk)
		begin
			if rising_edge(mclk) then
				data <= ROM_0(to_integer(unsigned(addr)));
			end if;
		end process;
end architecture ROM; 


