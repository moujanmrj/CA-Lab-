library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity ripple_cadder is
    Port ( a : in  STD_LOGIC_VECTOR(3 downto 0);
           b : in  STD_LOGIC_VECTOR(3 downto 0);
	   cin : in STD_LOGIC ;
           sum : out  STD_LOGIC_VECTOR(3 downto 0);
           cout : out  STD_LOGIC);
end ripple_cadder;
architecture Behavioral of ripple_cadder is
	component fullAdder is
    Port ( a,b,cin : in  STD_LOGIC;
           sum,cout : out  STD_LOGIC);
	end component fullAdder;

	signal temp1,temp2,temp3: STD_LOGIC;
	
begin
	instance0: fullAdder port map ( a => a(0), b => b(0), cin => cin, sum => sum(0), cout => temp1);
	instance1: fullAdder port map (a => a(1),b => b(1), cin => temp1, sum => sum(1), cout => temp2);
	instance2: fullAdder port map ( a => a(2), b => b(2), cin => temp2, sum => sum(2), cout => temp3);
	instance3: fullAdder port map ( a => a(3), b => b(3), cin => temp3, sum => sum(3), cout => cout);
end Behavioral;
