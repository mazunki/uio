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
	component bin2ssd
    	port
    	(
      		Di      : in  std_logic_vector(3 downto 0);
      		abcdefg : out std_logic_vector(6 downto 0)
    	);
  	end component;

	signal current_value : std_logic_vector(3 downto 0);

begin
	U1 : entity work.bin2ssd(beh)
		port map (
			Di      => current_value,
			abcdefg => abcdefg
		);

	CLK_0 : process (mclk, reset) begin
		if reset = '1' then
			current_value <= "0000";
		elsif rising_edge(mclk) then
			current_value <= d0;
			c <= '1';
		elsif falling_edge(mclk) then
			current_value <= d1;
			c <= '0';
		end if;
	end process CLK_0;

end architecture beh;