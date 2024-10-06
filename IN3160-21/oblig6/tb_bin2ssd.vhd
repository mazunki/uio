
library ieee;
use ieee.std_logic_1164.all;

entity tb_bin2ssd is
  -- empty;
end tb_bin2ssd;

architecture beh of tb_bin2ssd is
  signal clk : std_logic := '0';

  component seg7model
    port
    (
      c         : in  std_logic;
      abcdefg   : in  std_logic_vector(6 downto 0);
      disp1     : out std_logic_vector(3 downto 0);
      disp0     : out std_logic_vector(3 downto 0)
    );
  end component;
  
  component bin2ssd
    port
    (
      Di      : in  std_logic_vector(3 downto 0);
      abcdefg : out std_logic_vector(6 downto 0)
    );
  end component;

signal disp_value : std_logic_vector(3 downto 0) := "0000";
signal selector   : std_logic := '0';

signal outvalue : std_logic_vector(6 downto 0);
signal display0 : std_logic_vector(3 downto 0);
signal display1 : std_logic_vector(3 downto 0);


begin
  UUT: entity work.bin2ssd(beh)
    port map (
      Di      => disp_value,
      abcdefg => outvalue
    );

  STB: entity work.seg7model(beh)
    port map (
      c       => selector,
      abcdefg => outvalue,
      disp1   => display1,
      disp0   => display0
    );

  -- clock
  CLK_0: process begin
    selector <= '0';
    wait for 150 ns;
    selector <= '1';
    wait for 150 ns;
  end process CLK_0;

  disp_value <= "0000", 
                "0001" after 100 ns,
                "0011" after 200 ns,
                "0011" after 300 ns,
                "0111" after 400 ns,
                "1111" after 500 ns;

end beh;
