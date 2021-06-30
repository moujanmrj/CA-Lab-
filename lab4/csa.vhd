library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity csa is
		Port ( A : in  STD_LOGIC_VECTOR(3 downto 0);
		  B : in  STD_LOGIC_VECTOR(3 downto 0);
		  Cin: in STD_LOGIC;
		  Sum : out  STD_LOGIC_VECTOR(3 downto 0);
		  Cout: out  STD_LOGIC);
end csa;

architecture Behavioral of csa is

	component ripple_cadder is
    Port ( a : in  STD_LOGIC_VECTOR(3 downto 0);
           b : in  STD_LOGIC_VECTOR(3 downto 0);
	   cin : in STD_LOGIC;
           sum : out  STD_LOGIC_VECTOR(3 downto 0);
           cout : out  STD_LOGIC);
	end component ripple_cadder;

	signal c1,c0: STD_LOGIC;
	signal sum1,sum0: STD_LOGIC_VECTOR(3 downto 0);
	
	begin 
	ripple1: ripple_cadder port map (A => A(3 downto 0), B=>B(3 downto 0), Cin => '1', Sum=>sum1,Cout=>c1);
	ripple0: ripple_cadder port map (A => A(3 downto 0), B=>B(3 downto 0), Cin => '0', Sum=>sum0,Cout=>c0);
	Cout <= (Cin and c1) or (not (Cin) and c0);
	Sum(0) <= (Cin and sum1(0)) or (not (Cin) and sum0(0));
	Sum(1) <= (Cin and sum1(1)) or (not (Cin) and sum0(1));
	Sum(2) <= (Cin and sum1(2)) or (not (Cin) and sum0(2));
	Sum(3) <= (Cin and sum1(3)) or (not (Cin) and sum0(3));

END ;
