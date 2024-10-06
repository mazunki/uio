library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity FIRST is
	port (
		clk			: in	std_logic;		-- Clock signal from push button
		reset		: in	std_logic;		-- Global asynchronous reset
		load		: in	std_logic;		-- Synchronous load signal
		up			: in	std_logic;		-- if this is on, go up. otherwise, down
		inp			: in	std_logic_vector(3 downto 0);	-- Start value
		count		: out	std_logic_vector(3 downto 0);	-- Counter
		max_count	: out	std_logic;		-- Indicates maximum count value
		min_count	: out	std_logic		-- Indicates minimum count value
	);
end FIRST;

architecture MY_FIRST_ARCH of FIRST is
	signal count_i : unsigned(3 downto 0);

begin

	COUNTING: process (all) begin
		if load = '1' then
			count_i <= unsigned(inp);
		else 
			if up = '1' then
				count_i <= unsigned(count) + 1;
			else
				count_i <= unsigned(count) - 1;
			end if;
		end if;
	end process COUNTING;

	STORING: process (reset, clk) begin
		if(reset = '1') then
			count <= "0000";
		elsif rising_edge(CLK) then
			count <= std_logic_vector(count_i);
		end if;
	end process STORING;

	-- Concurrent signal assignment
	max_count <= '1' when count = "1111" else '0';
	min_count <= '1' when count = "0000" else '0';

end MY_FIRST_ARCH;
