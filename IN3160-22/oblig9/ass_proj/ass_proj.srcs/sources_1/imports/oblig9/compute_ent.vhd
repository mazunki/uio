library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all; 

entity compute is
  port
    (rst    : in  std_logic;
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
end entity compute;
