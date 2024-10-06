library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 

architecture rtl of compute is
begin
 
  process (rst, clk) is
    variable addresult_i  : unsigned(17 downto 0);
    variable multresult_i : unsigned(33 downto 0);
  begin
    if rst = '1' then
      result <= (others => '0');
      max    <= '0';
      rvalid <= '0';
    elsif rising_edge(clk) then
      if (dvalid = '1') then
        addresult_i := (unsigned("00" & a) + unsigned("00" & b)) +
                       (unsigned("00" & c) + unsigned("00" & d));
        multresult_i := addresult_i * unsigned(e);
        if (multresult_i(33 downto 32) = "00") then
          result <= std_logic_vector(multresult_i(31 downto 0));
          max    <= '0';
        else
          result <= (others => '1');
          max    <= '1';
        end if;
      else
        result <= (others => '0');
        max    <= '0';
      end if;
      rvalid <= dvalid;
    end if;
  end process;

end architecture rtl;
