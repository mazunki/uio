library IEEE;
use IEEE.std_logic_1164.all;

entity counter_entity is
    port (
      clk        : in  std_logic;             -- Clock state
      up         : in  std_logic;             -- Direction of counter
      reset      : in  std_logic;             -- Global asynchronous reset
      load       : in  std_logic;             -- Synchronous load/reset signal
      startvalue : in  std_logic_vector(3 downto 0); -- Start value (4 bits)
      counter    : out std_logic_vector(3 downto 0); -- Current counter value
      max_count  : out std_logic;                    -- Indicates if max value
      min_count  : out std_logic                     -- Indicates if min value
    );
end counter_entity;

architecture counter of counter_entity is
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
        counter <= std_logic_vector(startvalue);
      elsif rising_edge(CLK) then
        counter <= unsigned(count_i);
      end if;
    end process STORING;

  begin
    clk <= not clk after HALF_PERIOD;
    max_count <= '1' when unsigned(counter) = 15 else '0';
    min_count <= '1' when unsigned(counter) = 0 else '0';
  end counter;
