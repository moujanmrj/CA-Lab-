library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity halfAdder is
    Port ( a,b : in  STD_LOGIC;
           c,s : out  STD_LOGIC);
end halfAdder;

architecture structure of halfAdder is
begin
	s <= a xor b ;
	c <= a and b;
end structure;
