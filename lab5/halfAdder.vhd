library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity halfAdder is
    Port ( in1,in2 : in  STD_LOGIC;
           Co , S : out  STD_LOGIC);
end halfAdder;

architecture structure of halfAdder is
begin
	 S <= in1 xor in2; 
	 Co <= in1 and in2;
end structure;