library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

architecture rom of seg7ctrl is
	signal clock_timer : std_logic_vector(3 downto 0) := "0000";
	function bin2ssd( Di : std_logic_vector(3 downto 0) )
		return std_logic_vector is
		variable abcdefg : std_logic_vector(6 downto 0);
	begin
		with Di select abcdefg :=
			"0000000" when "0000",
			"0011110" when "0001",
			"0111100" when "0010",
			"1001111" when "0011",
			
			"0001110" when "0100",
			"0111101" when "0101",
			"0011101" when "0110",
			"0010101" when "0111",

			"0111011" when "1000",
			"0111110" when "1001",
			"1110111" when "1010",
			"0000101" when "1011",
			
			"1111011" when "1100",
			"0011100" when "1101",
			"0011100" when "1110",
			"1111111" when "1111",
			"XXXXXXX" when others;
		return abcdefg;
	end function bin2ssd;
begin
	CLK_0 : process (mclk, reset) begin
		if reset = '1' then
			abcdefg <= "0000000";
		elsif rising_edge(mclk) then
			clock_timer <= std_logic_vector(unsigned(clock_timer) + 1); -- 16 clock cycles
			if clock_timer = "0000" then
				if c = '0' then
					abcdefg <= bin2ssd(d0);
					c <= '1';
				elsif c = '1' then
					abcdefg <= bin2ssd(d1);
					c <= '0';
				end if;
			end if;
		end if;
	end process CLK_0;

end architecture rom;

