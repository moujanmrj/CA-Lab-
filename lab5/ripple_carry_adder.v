library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ripple_carry_adder is
    Port ( A : in  STD_LOGIC_VECTOR(3 downto 0);
           B : in  STD_LOGIC_VECTOR(3 downto 0);
           Sum : out  STD_LOGIC_VECTOR(3 downto 0);
           Cout : out  STD_LOGIC);
end ripple_carry_adder;

architecture Behavioral of ripple_carry_adder is
	component fullAdder is
    Port ( i1,i2,cin : in  STD_LOGIC;
           sum , cout : out  STD_LOGIC);
	end component fullAdder;
	
	signal c: STD_LOGIC_VECTOR(2 downto 0);
	
begin
	fullAdder_instance0: fullAdder port map ( i1 => A(0), i2 => B(0), cin => '0', sum => Sum(0), cout => c(0));
	fullAdder_instance1: fullAdder port map ( i1 => A(1), i2 => B(1), cin => c(0), sum => Sum(1), cout => c(1));
	fullAdder_instance2: fullAdder port map ( i1 => A(2), i2 => B(2), cin => c(1), sum => Sum(2), cout => c(2));
	fullAdder_instance3: fullAdder port map ( i1 => A(3), i2 => B(3), cin => c(2), sum => Sum(3), cout => Cout);
end Behavioral;