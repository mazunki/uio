
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
			-- mclk : in std_logic;
			addr : in std_logic_vector(4 downto 0);
			data : out std_logic_vector(7 downto 0)
		);
	end component ROM;

	signal rom_index : std_logic_vector(4 downto 0) := (others => '0');
	signal rom_data : std_logic_vector(7 downto 0) := (others => '0');

begin

	ROM_0: ROM
		port map(
			addr => rom_index,
			data => rom_data
			-- mclk => mclk
		);

	CLK_0: process (mclk, reset, rom_index) 
		variable time_counter : unsigned(28 downto 0) := (others => '0');
	begin
		if reset = '1' then
			rom_index <= (others => '0');
		elsif rising_edge(mclk) then
			-- new value each 3 seconds = (3s in ns = 3*10^9)*(100Mhz = 100/10^6 s) = 3*10^8
			time_counter := time_counter + 1;
			if time_counter = 300_000_000 then
				time_counter := (others => '0');
				if rom_index = x"14" then  -- x"14" == index 20
					rom_index <= x"14";  -- halt at last
				else
					rom_index <= std_logic_vector(unsigned(rom_index) + 1);
				end if;
			end if;
		end if;
	end process CLK_0;

	di <= rom_data;

end architecture test_unit;

