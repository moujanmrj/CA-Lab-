library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity arrayMultiplier is
	Port ( A, B: in  STD_LOGIC_VECTOR(3 downto 0);
			 RES : out  STD_LOGIC_VECTOR(7 downto 0));
end arrayMultiplier;

architecture Behavioral of arrayMultiplier is
	component ripple_carry_adder is
		Port ( A : in  STD_LOGIC_VECTOR(3 downto 0);
             B : in  STD_LOGIC_VECTOR(3 downto 0);
             Sum : out  STD_LOGIC_VECTOR(3 downto 0);
             Cout : out  STD_LOGIC);
	end component ripple_carry_adder;
	
	signal Level0, Level1, Level2, p0, p1, p2, p3, p4 ,p5: STD_LOGIC_VECTOR(3 downto 0);
	signal cout1, cout0: STD_LOGIC;
	
begin

 p0(0) <= A(0) and B(1) ;
 p0(1) <= A(0) and B(2) ;
 p0(2) <= A(0) and B(3) ;
 p0(3) <= '0';
 p1(0) <= A(1) and B(0) ;
 p1(1) <= A(1) and B(1) ;
 p1(2) <= A(1) and B(2) ;
 p1(3) <= A(1) and B(3) ;
 p2(0) <= A(2) and B(0) ;
 p2(1) <= A(2) and B(1) ;
 p2(2) <= A(2) and B(2) ;
 p2(3) <= A(2) and B(3) ;
 p3(0) <= A(3) and B(0) ;
 p3(1) <= A(3) and B(1) ;
 p3(2) <= A(3) and B(2) ;
 p3(3) <= A(3) and B(3) ;

 p4(2 downto 0) <= Level0(3 downto 1);
 p4(3) <= cout0;
 p5(2 downto 0) <= Level1(3 downto 1);
 p5(3) <= cout1;

	ra0: ripple_carry_adder port map(A => p0, B => p1, Sum => Level0, Cout => cout0);
	ra1: ripple_carry_adder port map(A => p2, B => p4, Sum => Level1, Cout => cout1);
	ra2: ripple_carry_adder port map(A => p3, B => p5, Sum => Level2, Cout => RES(7));
	RES(0) <= A(0) and B(0);
	RES(1) <= Level0(0);
	RES(2) <= Level1(0);
	RES(3) <= Level2(0);
	RES(4) <= Level2(1);
	RES(5) <= Level2(2);
	RES(6) <= Level2(3);
end Behavioral;