library ieee;
use ieee.std_logic_1164.all;
entity delay is 
  port (
    -- System Clock and Reset
    rst_n        : in  std_logic;
    mclk         : in  std_logic;
    indata       : in  std_logic_vector(7 downto 0);
    outdata      : out std_logic_vector(7 downto 0)
  );  
end delay;
architecture rtl1 of delay is 
  signal data1, data2, data3, data4, data5 : std_logic_vector(7 downto 0);
begin  
  process (rst_n, mclk) is    
--    variable data2, data4 : std_logic_vector(7 downto 0);
  begin
    if (rst_n = '0') then       
      data1    <= (others => '0');
      data2    <= (others => '0');
      data3    <= (others => '0');
      data4    <= (others => '0');
      data5    <= (others => '0');
    elsif rising_edge(mclk) then
      data1    <= indata;
      data2    <= data1;
      data3    <= data2;
      data4    <= data3;
      data5    <= data4;
    end if;
  end process;
  outdata  <= data5;
end rtl1;
