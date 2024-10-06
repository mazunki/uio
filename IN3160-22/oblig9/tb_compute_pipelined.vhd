  
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.numeric_std.all; 
 
entity tb_compute_pipelined is 
  -- empty; 
end tb_compute_pipelined; 
 
architecture beh of tb_compute_pipelined is 

  component compute_pipelined
    port (
      rst    : in  std_logic;
      clk    : in  std_logic;
      a      : in  std_logic_vector(15 downto 0);
      b      : in  std_logic_vector(15 downto 0);
      c      : in  std_logic_vector(15 downto 0);
      d      : in  std_logic_vector(15 downto 0);
      e      : in  std_logic_vector(15 downto 0);
      dvalid : in  std_logic;
      result : out std_logic_vector(31 downto 0);
      max    : out std_logic;
      rvalid : out std_logic);
  end component;

  signal rst    : std_logic;
  signal clk    : std_logic:= '0';
  signal a      : std_logic_vector(15 downto 0);
  signal b      : std_logic_vector(15 downto 0);
  signal c      : std_logic_vector(15 downto 0);
  signal d      : std_logic_vector(15 downto 0);
  signal e      : std_logic_vector(15 downto 0);
  signal dvalid : std_logic;
  signal result : std_logic_vector(31 downto 0);
  signal max    : std_logic;
  signal rvalid : std_logic;
  
begin
  
  compute_pipelined_0: compute_pipelined
    port map (
      rst    => rst,
      clk    => clk,
      a      => a,
      b      => b,
      c      => c,
      d      => d,
      e      => e,
      dvalid => dvalid,
      result => result,
      max    => max,
      rvalid => rvalid);

  -- Clock and reset generation
  clk <= not clk after 10 ns ; 
  rst <= '1', '0' after 20 ns; 
 
  P_TEST: process 
  begin 
 
    a <= (others => '0');
    b <= (others => '0');
    c <= (others => '0');
    d <= (others => '0');
    e <= (others => '0');
    dvalid <= '0';

    wait until falling_edge(rst);
    wait for 40 ns;
    
    wait until falling_edge(clk);

    a <= x"0001";
    b <= x"0002";
    c <= x"0003";
    d <= x"0004";
    e <= x"0005";
    dvalid <= '1';

    wait on clk until rvalid='1';
    assert (result=x"00000032" and max='0')  
      report "Result not equal 32 hex and max not equal 0" severity FAILURE; 
   
    a <= (others => '0');
    b <= (others => '0');
    c <= (others => '0');
    d <= (others => '0');
    e <= (others => '0');
    dvalid <= '0';
    
    wait on clk until rvalid='0';
    assert (result=x"00000000" and max='0')  
      report "Result not equal zero and max not equal 0" severity FAILURE; 
    
    a <= x"0105";
    b <= x"0206";
    c <= x"0307";
    d <= x"0408";
    e <= x"0509";
    dvalid <= '1';

    wait for 20 ns;

    a <= x"FFFF";
    b <= x"0000";
    c <= x"0001";
    d <= x"0000";
    e <= x"0001";
    dvalid <= '1';    
    
    wait on clk until rvalid='1';
    assert (result=x"0032DCEA" and max='0')  
      report "Result not equal 0032DCEA hex and max not equal 0" severity FAILURE; 

    a <= x"FFFF";
    b <= x"FFFF";
    c <= x"FFFF";
    d <= x"FFFF";
    e <= x"0001";
    dvalid <= '1';

    wait for 20 ns;  
    assert (result=x"00010000" and max='0')  
      report "Result not equal 00010000 hex and max not equal 0" severity FAILURE; 
    
    a <= x"FFFF";
    b <= x"0000";
    c <= x"0001";
    d <= x"0000";
    e <= x"FFFE";
    dvalid <= '1';   

    wait for 20 ns;  
    assert (result=x"0003FFFC" and max='0')  
      report "Result not equal 0003FFFC hex and max not equal 0" severity FAILURE; 
    
    a <= x"FFFF";
    b <= x"0000";
    c <= x"0001";
    d <= x"0000";
    e <= x"FFFF";
    dvalid <= '1';

    wait for 20 ns;
    assert (result=x"FFFE0000" and max='0')  
      report "Result not equal FFFE0000 hex and max not equal 0" severity FAILURE; 

    a <= x"FFFF";
    b <= x"0000";
    c <= x"FFFF";
    d <= x"0000";
    e <= x"FFFF";
    dvalid <= '1';

    wait for 20 ns;
    assert (result=x"FFFF0000" and max='0')  
      report "Result not equal FFFF0000 hex and max not equal 0" severity FAILURE; 
    
    a <= x"FFFF";
    b <= x"0000";
    c <= x"FFFF";
    d <= x"0000";
    e <= x"7FFF";
    dvalid <= '1';

    wait for 20 ns;
    assert (result=x"FFFFFFFF" and max='1')  
      report "Result not equal FFFFFFFF hex and max not equal 1" severity FAILURE; 
    
    a <= (others => '0');
    b <= (others => '0');
    c <= (others => '0');
    d <= (others => '0');
    e <= (others => '0');
    dvalid <= '0';

    wait for 20 ns;
    assert (result=x"FFFD0002" and max='0')  
      report "Result not equal FFFD0002 hex and max not equal 0" severity FAILURE; 
    
    wait on clk until rvalid='0';
    assert (result=x"00000000" and max='0')  
      report "Result not equal zero and max not equal 0" severity FAILURE; 

    assert (FALSE)  
      report "Simulation complete." severity NOTE; 
        
    wait; 
 
  end process; 
 
end beh; 
