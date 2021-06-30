library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity cla is
    Port ( A : in  STD_LOGIC_VECTOR(3 downto 0);
           B : in  STD_LOGIC_VECTOR(3 downto 0);
	   Cin: in STD_LOGIC;
           Sum : out  STD_LOGIC_VECTOR(3 downto 0);
           Cout: out  STD_LOGIC);
end cla;
architecture Behavioral of cla is

	signal p0,p1,p2,p3,g0,g1,g2,g3,c0,c1,c2,c3: STD_LOGIC;
begin

-- calculate Pi and Gi 

	p0 <= A(0) or B(0);
	p1 <= A(1) or B(1);
	p2 <= A(2) or B(2);
	p3 <= A(3) or B(3);

	g0 <= A(0) and B(0);
	g1 <= A(1) and B(1);
	g2 <= A(2) and B(2);
	g3 <= A(3) and B(3);

-- calculate cn ... 

	c0 <= g0 or (Cin and p0);
	c1 <= g1 or ((g0 or (Cin and p0))and p1);
	c2 <= g2 or (((g0 or (Cin and p0))and p1)and p2);
	-- c3 <= g3 or ((((g0 or (Cin and p0))and p1)and p2)and p3);
	
-- calculate sumn ...

	Sum(0) <= A(0) xor B(0) xor Cin ;
	Sum(1) <= A(1) xor B(1) xor c0 ;
	Sum(2) <= A(2) xor B(2) xor c1 ;
	Sum(3) <= A(3) xor B(3) xor c2 ;
	Cout <= g3 or ((((g0 or (Cin and p0))and p1)and p2)and p3);

	END ;