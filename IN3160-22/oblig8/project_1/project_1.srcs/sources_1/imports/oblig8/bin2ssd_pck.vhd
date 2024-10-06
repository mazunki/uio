library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package bin2ssd_pck is
	function bin2ssd (
		Di : std_logic_vector(3 downto 0)
	) return std_logic_vector;
end package bin2ssd_pck;

package body bin2ssd_pck is
	function bin2ssd( Di : std_logic_vector(3 downto 0) )
		return std_logic_vector is
		variable abcdefg : std_logic_vector(6 downto 0);
	begin
		with Di select abcdefg :=
			"1111110" when "0000",
			"0110000" when "0001",
			"1101101" when "0010",
			"1111001" when "0011",
			
			"0110011" when "0100",
			"1011011" when "0101",
			"1011111" when "0110",
			"1110000" when "0111",

			"1111111" when "1000",
			"1110011" when "1001",
			"1110111" when "1010",
			"0011111" when "1011",
			
			"1001110" when "1100",
			"0111101" when "1101",
			"1001111" when "1110",
			"1000111" when "1111",
			"XXXXXXX" when others;
		return abcdefg;
	end bin2ssd;
end package body bin2ssd_pck;
