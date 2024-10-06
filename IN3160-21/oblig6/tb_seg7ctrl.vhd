library IEEE;
use IEEE.std_logic_1164.all;

entity tb_seg7ctrl is
--
end tb_seg7ctrl;

architecture tb_beh of tb_seg7ctrl is
  signal clk : std_logic := '0';
	component seg7ctrl
    	port
    	(
			mclk 	: in  std_logic; -- 100 Mhz, positive flank
			reset 	: in  std_logic; -- async, active high
			d0 		: in  std_logic_vector(3 downto 0);  -- bin value
			d1 		: in  std_logic_vector(3 downto 0);  -- bin value
			abcdefg	: out std_logic_vector(6 downto 0); -- ssd
			c 		: out std_logic -- selector
    	);
  	end component;

signal reset : std_logic := '0';
signal d0	 : std_logic_vector(3 downto 0) := "0000";
signal d1	 : std_logic_vector(3 downto 0) := "0100";

signal tb_out: std_logic_vector(6 downto 0);
signal tb_c	 : std_logic;

begin
	UUT : entity work.seg7ctrl(beh)
		port map (
			mclk    => clk,
			reset 	=> reset,
			d0 		=> d0,
			d1		=> d1,
			abcdefg => tb_out,
			c 		=> tb_c
		);

	  CLK_0: process begin
	    clk <= '0';
	    wait for 10 ns;
	    clk <= '1';
	    wait for 10 ns;
	  end process CLK_0;

end architecture tb_beh;