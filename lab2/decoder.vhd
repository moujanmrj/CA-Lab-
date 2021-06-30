library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity decoder is
    Port ( i0 : in  STD_LOGIC;
           i1 : in  STD_LOGIC;
           o0 : out  STD_LOGIC;
           o1 : out  STD_LOGIC;
           o2 : out  STD_LOGIC;
           o3 : out  STD_LOGIC);
end decoder;

architecture Behavioral of decoder is

begin

o0 <= (not i0) and (not i1);
o1 <= i0 and (not i1);
o2 <= (not i0) and i1;
o3 <= i0 and i1;

end Behavioral;
