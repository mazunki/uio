library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity FIRST is
  port
    (
      clk       : in  std_logic;        -- Clock signal from push button
      reset     : in  std_logic;        -- Global asynchronous reset
      load      : in  std_logic;        -- Synchronous load signal
      inp       : in  std_logic_vector(3 downto 0);  -- Start value
      count     : out std_logic_vector(3 downto 0);  -- Count value
      max_count : out std_logic         -- Indicates maximum count value
      );
end FIRST;

-- The architecture below describes a 4-bit up counter. When the counter
-- reaches its maximum value, the signal MAX_COUNT is activated.

architecture MY_FIRST_ARCH of FIRST is

  --  Area for declarations
  signal count_i : unsigned(3 downto 0);
  
begin
  --  The description starts here
  
  COUNTING :
  process (all)
  begin
    if load = '1' then
      count_i <= unsigned(inp);
    else 
      count_i <= unsigned(count) + 1;
    end if;
  end process COUNTING;

  STORING:
  process (reset, clk)
  begin
    -- Asynchronous reset
    if(reset = '1') then
      count <= "0000";
    elsif rising_edge(CLK) then
      count <= std_logic_vector(count_i);
    end if;
  end process STORING;

  -- Concurrent signal assignment
  Max_count <= '1' when count = "1111" else '0';

end MY_FIRST_ARCH;
