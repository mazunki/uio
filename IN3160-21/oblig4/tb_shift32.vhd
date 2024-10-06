
library ieee;
use ieee.std_logic_1164.all;

entity tb_shift32 is
  -- empty;
end tb_shift32;

architecture tb_arch_shift32 of tb_shift32 is
  signal clk : std_logic := '0';

  component shift32
    port (
      -- data
      ser_in    : in  std_logic;
      par_out   : out std_logic_vector(31 downto 0);
      -- control
      mclk      : in  std_logic;
      rst_n     : in  std_logic
    );
  end component;
  
  signal ser_in   : std_logic;
  signal par_out  : std_logic_vector(31 downto 0);
  signal rst_n    : std_logic;
  
begin
  UUT: entity work.shift32(shift32_arch)
    port map (
      ser_in  => ser_in,
      par_out => par_out,
      clk     => clk,
      rst_n   => rst_n
    );

  -- simulation / testing
  ser_in <= '0',  -- "0000 0010 1100 0000 1111..."
            '1' after 300 ns,
            '0' after 350 ns,
            '1' after 400 ns,
            '0' after 500 ns,
            '1' after 800 ns;
  rst_n  <= '1', '0' after 1500 ns, '1' after 1650 ns;

-- clock
  CLK_0: process begin
    clk <= '0';
    wait for 50 ns;
    clk <= '1';
    wait for 50 ns;
  end process CLK_0;

end tb_arch_shift32;
