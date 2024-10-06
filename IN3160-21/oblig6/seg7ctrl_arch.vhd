library IEEE;
use IEEE.std_logic_1164.all;

architecture rom of seg7ctrl is
	signal second_tick : std_logic_vector(6 downto 0) := "0000000";
	
	signal current_value0 : std_logic_vector(6 downto 0);
	signal current_value1 : std_logic_vector(6 downto 0);

	signal counter : integer := 0;

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
begin

	CLK_0 : process (mclk, reset) begin
		if reset = '1' then
			abcdefg <= "0000000";
		elsif rising_edge(mclk) then
			abcdefg <= current_value0;
			c 		<= '1';
		elsif falling_edge(mclk) then
			abcdefg <= current_value1;
			c 		<= '0';
		end if;
	end process CLK_0;


	CLK_1 : process is
		variable secret0 : std_logic_vector(3 downto 0);
		variable secret1 : std_logic_vector(3 downto 0);
	begin
		current_value0 <= second_tick;
		current_value1 <= second_tick;

		wait until rising_edge(mclk);

		secret0 := ROM_0(counter);
		secret1 := ROM_1(counter);
		counter <= counter + 1;

	with secret0 select
		current_value0 <=	"0000000" when "0000",
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
							"0001101" when "1110",
							"1111111" when "1111",
							"XXXXXXX" when others;

	with secret1 select
		current_value1 <=	"0000000" when "0000",
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
							"0001101" when "1110",
							"1111111" when "1111",
							"XXXXXXX" when others;

		wait for 1 sec;
	end process CLK_1;

end architecture rom;