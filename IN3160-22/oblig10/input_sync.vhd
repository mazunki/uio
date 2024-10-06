library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity input_sync is
    port(
      SA		: in std_logic; 
      SB		: in std_logic; -- Asynchronous reset, active high
      SA_synch	: out std_logic;
      SB_synch	: out std_logic;  -- direction of motor
      mclk      : in std_logic   -- enable motor
    );
end entity input_sync;

architecture rtl of input_sync is
	signal temp_a : std_logic := '0';
	signal temp_b : std_logic := '0';
begin

	SYNC_CLK : process(mclk) begin
		if rising_edge(mclk) then
			temp_a <= SA; -- input value
			SA_synch <= temp_a;  -- output value

			temp_b <= SB; -- input value
			SB_synch <= temp_b;  -- output value
		end if;
	end process SYNC_CLK;

end architecture rtl;
