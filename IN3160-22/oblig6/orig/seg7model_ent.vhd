-- Dette er entity for modell av sjusegmentdisplayene.  De er modellert ved at man 
-- f r vist ASCII-verdien av tallet/bokstaven som vises p  segmentene��
-- Dersom man merker DISP0,..3 i waveform vieweren og velger radix ascii
-- F r man vist tall/bokstav som vist p  sjusegmentene.��
library IEEE;
use IEEE.std_logic_1164.all;
entity seg7model is 
  port
  (
    c         : in  std_logic;
    abcdefg   : in  std_logic_vector(6 downto 0);
    disp1     : out std_logic_vector(3 downto 0);
    disp0     : out std_logic_vector(3 downto 0)
  );
end seg7model;

