library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

-- external stuff
entity decoder1 is 
	port (
		sw : in std_logic_vector(1 downto 0); -- sw2, sw1
		ld : out std_logic_vector(3 downto 0) -- ld4, ld3, ld2, ld1
	);
end decoder1;

-- internal implementation
architecture decoder1_arch of decoder1 is
-- no declarations for architecture
begin
	demux: process (sw, ld) -- should be sw and ld
	begin
		case sw is 
			when "00" => ld <= "1110";
			when "01" => ld <= "1101";
			when "10" => ld <= "1011";
			when "11" => ld <= "0111";
			when others => ld <= "0000"; -- shouldn't happen unless uninitizalised
		end case;
	end process demux;
end decoder1_arch;

