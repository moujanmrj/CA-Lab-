library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity comparator1bit is
    Port ( a : in  STD_LOGIC;
           b : in  STD_LOGIC;
           lin : in  STD_LOGIC;
           ein : in  STD_LOGIC;
           gin : in  STD_LOGIC;
           lout : out  STD_LOGIC;
           eout : out  STD_LOGIC;
           gout : out  STD_LOGIC);
end comparator1bit;

architecture Behavioral of comparator1bit is

begin

lout <= ((not a) and b) or ((a xnor b) and lin);
gout <= (a and (not b)) or ((a xnor b) and gin);
eout <= (a xnor b) and ein;

end Behavioral;