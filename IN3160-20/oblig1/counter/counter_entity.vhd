library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity counter_entity is
  port (
    clk        : out std_logic := '0';
    up         : in  std_logic := '1';
    reset      : in  std_logic := '0';
    load       : in  std_logic := '0';
    startvalue : in  std_logic_vector(3 downto 0) := "0000";
    counter    : out std_logic_vector(3 downto 0);
    max_count  : out std_logic;
    min_count  : out std_logic
  );
end counter_entity;

architecture counter of counter_entity is
  constant HALF_PERIOD : time := 10 ns;
  signal count_i : unsigned(3 downto 0) := "0000";

  begin
    COUNTING : process (clk)
      begin
        if (load = '1') then
          count_i <= unsigned(startvalue);
        else
          if (up = '1') then
            count_i <= count_i + 1;
          else
            count_i <= count_i - 1;
          end if;
        end if;
      end process COUNTING;

    STORING : process (reset, clk)
      begin
        --if rising_edge(clk) then
          counter <= std_logic_vector(count_i);
        --end if;
      end process STORING;

    clk <= not clk after HALF_PERIOD;
    max_count <= '1' when count_i = "1111" else '0';
    min_count <= '1' when count_i = "0000" else '0';
  end counter;
