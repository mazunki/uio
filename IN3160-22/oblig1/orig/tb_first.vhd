library IEEE;
use IEEE.std_logic_1164.all;

entity TEST_FIRST is
-- Empty entity of the testbench
end TEST_FIRST;

architecture TESTBENCH of TEST_FIRST is
  -- Area for declarations

  -- Component declaration
  component FIRST
    port
      (
        clk       : in  std_logic;      -- Clock signal from push button
        reset     : in  std_logic;      -- Global asynchronous reset
        load      : in  std_logic;      -- Synchronous reset
        inp       : in  std_logic_vector(3 downto 0);  -- Start value
        count     : out std_logic_vector(3 downto 0);  -- Count value
        max_count : out std_logic       -- Indicates maximum count value
        );
  end component;

  signal tb_clk       : std_logic := '0';
  signal tb_reset     : std_logic := '0';
  signal tb_load      : std_logic := '0';
  signal tb_inp       : std_logic_vector(3 downto 0) := "0000";
  signal tb_count     : std_logic_vector(3 downto 0);
  signal tb_max_count : std_logic;

  -- 50 Mhz clock frequency
  constant HALF_PERIOD : time := 10 ns;
  
begin
  -- Concurrent statements

  -- Instantiating the unit under test
  UUT : FIRST
    port map
    (
      clk       => tb_clk,
      reset     => tb_reset,
      load      => tb_load,
      inp       => tb_inp,
      count     => tb_count,
      max_count => tb_max_count
      );

  -- Generating the clock signal
  tb_clk <= not tb_clk after HALF_PERIOD;

  STIMULI :
  process
  begin
    tb_reset <= '1', '0' after 100 ns;
    tb_inp   <= "1010"   after HALF_PERIOD*12;
    wait for 2*Half_Period*16;
    tb_load  <= '1', '0' after 2*HALF_PERIOD;
    wait;
  end process;
  
end TESTBENCH;
