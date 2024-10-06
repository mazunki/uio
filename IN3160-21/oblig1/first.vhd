library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity FIRST is
  port (
    clk       : in  std_logic;        -- Clock signal from push button
    reset     : in  std_logic;        -- Global asynchronous reset
    load      : in  std_logic;        -- Synchronous load signal
    
    start_val : in  std_logic_vector(3 downto 0);  -- Start value
    up        : in  std_logic;        -- Direction of the counter
    counter   : out std_logic_vector(3 downto 0);  -- Current value
    min_count : out std_logic;        -- Indicates minimum count value
    max_count : out std_logic         -- Indicates maximum count value
  );
end FIRST;

-- The architecture below describes a 4-bit up counter. When the counter
-- reaches its maximum value, the signal max_count is activated.

architecture MY_FIRST_ARCH of FIRST is
  --  Area for declarations
  signal count_i : unsigned(3 downto 0);

begin
  --  The description starts here
  COUNTING: process (all)
  begin
    if load = '1' then
      count_i <= unsigned(start_val);
    else 
        if up = '1' then
          count_i <= unsigned(counter) + 1;
        else
          count_i <= unsigned(counter) - 1;
        end if;
    end if;
  end process COUNTING;

  STORING: process (reset, clk)
  begin
    -- Asynchronous reset
    if (reset = '1') then
      counter <= start_val;
    elsif rising_edge(CLK) then
      counter <= std_logic_vector(count_i);
    end if;
  end process STORING;

  -- Concurrent signal assignment
  max_count <= '1' when counter = "1111" else '0';
  min_count <= '1' when counter = "0000" else '0';

end MY_FIRST_ARCH;
