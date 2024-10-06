
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity self_test_unit is
	port (
		mclk 	: in std_logic;
		reset 	: in std_logic;
		di		: out std_logic_vector(7 downto 0)
	);
end self_test_unit;

architecture test_unit of self_test_unit is
	type MEMORY is array (0 to 19) of std_logic_vector(7 downto 0);

	component ROM is
		port(
			mclk : in std_logic;
			addr : in std_logic_vector(4 downto 0);
			data : out std_logic_vector(7 downto 0)
		);
	end component ROM;

	signal rom_index : std_logic_vector(4 downto 0);
	signal rom_data : std_logic_vector(7 downto 0);

	signal time_counter	: std_logic_vector(31 downto 0) := x"FFFFFFFF";

begin

	ROM_0: ROM
		port map(
			addr => rom_index,
			data => rom_data,
			mclk => mclk
		);

	CLK_0: process (mclk, reset, rom_index) begin
		if reset = '1' then
			rom_index <= "00000";
		elsif rising_edge(mclk) then
			-- new value each 3 seconds = (3s in ns = 3*10^9)*(100Mhz = 100/10^6 s) = 3*10^8
			time_counter <= std_logic_vector((unsigned(time_counter) + 1) mod 300000000);
			if time_counter = x"00000000" then
				case rom_index is -- halt when we reach last index
					when "10011" => rom_index <= "10011"; -- 19 == 0x13 == 0b10011
					when others => rom_index <= std_logic_vector(unsigned(rom_index) + 1);
				end case;
			end if;
		end if;

	end process CLK_0;

	di <= rom_data;

end architecture test_unit;

