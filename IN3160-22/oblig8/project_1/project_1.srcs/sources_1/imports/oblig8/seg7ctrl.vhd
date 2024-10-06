library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use work.bin2ssd_pck.all;

entity seg7ctrl is
	port (
		mclk 	: in  std_logic; -- 100 Mhz, positive flank
		reset 	: in  std_logic; -- async, active high
		d0 		: in  std_logic_vector(3 downto 0);  -- bin value
		d1 		: in  std_logic_vector(3 downto 0);  -- bin value
		abcdefg	: out std_logic_vector(6 downto 0); -- ssd
		c 		: out std_logic := '0' -- selector
	);
end seg7ctrl;


architecture beh of seg7ctrl is
	signal clock_timer : std_logic_vector(3 downto 0) := "0000";
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

end architecture beh;

