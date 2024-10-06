
library ieee;
use ieee.std_logic_1164.all;

entity tb_variables_vs_signals is
  -- empty;
end tb_variables_vs_signals;

architecture beh1 of tb_variables_vs_signals is

  component variables_vs_signals
    port (
      indata  : in  std_logic;
      outdata : out std_logic_vector(7 downto 0));
  end component;
  
  signal indata  : std_logic;
  signal outdata : std_logic_vector(7 downto 0);
  
begin

  UUT_0: entity work.variables_vs_signals(rtl1)
    port map (
      indata  => indata,
      outdata => outdata);
  
  -- Changed indata
  indata <= '0', '1' after 100 ns, '0' after 200 ns; 

end beh1;
