
library ieee;
use ieee.std_logic_1164.all;

entity tb_shiftn is
  -- empty;
end tb_shiftn;

architecture tb_arch_shiftn of tb_shiftn is
  signal clk : std_logic := '0';

  component shiftn
    generic ( N : integer );
    port (
      -- data
      ser_in    : in  std_logic;
      par_out   : out std_logic_vector(127 downto 0);
      -- control
      clk       : in  std_logic;
      rst_n     : in  std_logic
    );
  end component;
  
  signal ser_in   : std_logic;
  signal par_out  : std_logic_vector(127 downto 0);
  signal rst_n    : std_logic;
  
  signal my_bits : std_logic_vector(127 downto 0) := x"60dae8317e3cde659e1ad91d49dc819a";
begin

  UUT: entity work.shiftn(shiftn_arch)
    generic map ( N => 128 )
    port map (
      ser_in  => ser_in,
      par_out => par_out,
      clk     => clk,
      rst_n   => rst_n
    );

  -- simulation / testing
  p1: process begin
    for b in my_bits'range loop
      ser_in <= my_bits(b);
      wait for 50 ns;
    end loop;
    wait for 50*128 ns;
    wait for 500 ns; -- delay before reset
    rst_n <= '0';
    wait for 50 ns;
    rst_n <= '1';
    wait for 500 ns; -- delay after reset
  end process p1;

  -- clock
  CLK_0: process begin
    clk <= '0';
    wait for 50 ns;
    clk <= '1';
    wait for 50 ns;
  end process CLK_0;

end tb_arch_shiftn;
