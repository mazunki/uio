library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity FIRST is
  port (
      clk       : in  std_logic;                       -- Clock state
      up        : in  std_logic;                       -- Direction of counter
      reset     : in  std_logic;                       -- Global asynchronous reset
      load      : in  std_logic;                       -- Synchronous load/restart signal
      startvalue: in  std_logic_vector(3 downto 0); -- Start value (4 bits)
      counter   : out std_logic_vector(3 downto 0); -- Current counter value
      max_count : out std_logic;                       -- Indicates if max value
      min_count : out std_logic                        -- Indicates if min value
  );
end FIRST;

architecture MY_FIRST_ARCH of FIRST is
  constant HALF_PERIOD : time := 10 ns;
  signal count_i : unsigned(3 downto 0) := "0000";
begin

  COUNTING: process (all)
    begin
      if load = '1' then
        count_i <= unsigned(startvalue);
      else
        if up = '1' then
          count_i <= unsigned(counter) + 1;
        else
          count_i <= unsigned(counter) - 1;
        end if;
      end if;
    end process COUNTING;

  STORING : process (reset, clk)
    begin
      if(reset = '1') then
        counter <= startvalue;
      elsif rising_edge(CLK) then
        counter <= std_logic_vector(count_i);
      end if;
    end process STORING;

  -- Concurrent signal assignment
  max_count <= '1' when count_i = "1111" else '0';
  min_count <= '1' when count_i = "0000" else '0';

end MY_FIRST_ARCH;
