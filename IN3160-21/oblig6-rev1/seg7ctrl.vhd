library IEEE;
use IEEE.std_logic_1164.all;

entity seg7ctrl is
	port (
		mclk 	: in  std_logic; -- 100 Mhz, positive flank
		reset 	: in  std_logic; -- async, active high
		d0 		: in  std_logic_vector(3 downto 0);  -- bin value
		d1 		: in  std_logic_vector(3 downto 0);  -- bin value
		abcdefg	: out std_logic_vector(6 downto 0); -- ssd
		c 		: out std_logic -- selector
	);
end seg7ctrl;

architecture beh of seg7ctrl is
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
	end function bin2ssd;
begin
	CLK_0 : process (mclk, reset) begin
		if c = 'U' then
			c <= '0';
		end if;
		if reset = '1' then
			abcdefg <= "0000000";
		elsif rising_edge(mclk) then
			if c = '0' then
				abcdefg <= bin2ssd(d0);
				c <= '1';
			elsif c = '1' then
				abcdefg <= bin2ssd(d1);
				c <= '0'; 
			end if;
		end if;
	end process CLK_0;

end architecture beh;