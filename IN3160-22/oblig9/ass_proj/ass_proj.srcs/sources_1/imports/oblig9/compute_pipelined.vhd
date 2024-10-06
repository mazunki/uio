library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 

entity compute_pipelined is
	port
	(rst    : in  std_logic;
	 clk    : in  std_logic;
	 a      : in  std_logic_vector(15 downto 0);
	 b      : in  std_logic_vector(15 downto 0);
	 c      : in  std_logic_vector(15 downto 0);
	 d      : in  std_logic_vector(15 downto 0);
	 e      : in  std_logic_vector(15 downto 0);
	 dvalid : in  std_logic;
	 result : out std_logic_vector(31 downto 0);     
	 max    : out std_logic;
	 rvalid : out std_logic);
end entity compute_pipelined;

architecture rtl of compute_pipelined is
begin

	process (rst, clk) is
		variable addresult_i  : unsigned(17 downto 0);
		variable multresult_i : unsigned(33 downto 0);
		variable done_calc    : std_logic;
	begin
		if rst = '1' then
			result <= (others => '0');
			max    <= '0';
			rvalid <= '0';
		elsif rising_edge(clk) then
			rvalid <= dvalid; -- default value, unless done_calc='0'
			if (dvalid = '1') then
				if (done_calc = '0') then
					addresult_i := (unsigned("00" & a) + unsigned("00" & b)) +
					(unsigned("00" & c) + unsigned("00" & d));
					multresult_i := addresult_i * unsigned(e);
					done_calc := '1';
					rvalid <= '0';
				else
					done_calc := '1';
					if (multresult_i(33 downto 32) = "00") then
						result <= std_logic_vector(multresult_i(31 downto 0));
						max    <= '0';
					else
						result <= (others => '1');
						max    <= '1';
					end if;
				end if;
			else
				result <= (others => '0');
				max    <= '0';
			end if;
		end if;
	end process;

end architecture rtl;
