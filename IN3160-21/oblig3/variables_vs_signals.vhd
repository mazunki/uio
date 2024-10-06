library ieee;
use ieee.std_logic_1164.all;

entity variables_vs_signals is 
  port (
    indata   : in  std_logic;
    outdata  : out std_logic_vector(7 downto 0)
  );  
end variables_vs_signals;

architecture rtl1 of variables_vs_signals is
  signal sig1, sig2 : std_logic;
begin
  
jorgen:  process (indata) is    
    variable var1, var2 : std_logic;
  begin
    var1 := indata;
    var2 := indata;
    sig1 <= var1;
    sig2 <= var2;
    outdata(1 downto 0) <= var2 & var1;
    outdata(3 downto 2) <= sig2 & sig1;
    var1 := not var1;
    var2 := not var2;
    sig1 <= not var1;
    sig2 <= not indata;
    outdata(5 downto 4)<= var2 & var1;
    outdata(7 downto 6)<= sig2 & sig1;
  end process;
    
end rtl1;
