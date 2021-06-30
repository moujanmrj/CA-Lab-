library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Multiplier is
    Port ( A, B: in  STD_LOGIC_VECTOR(3 downto 0);
           RES : out  STD_LOGIC_VECTOR(7 downto 0));
end Multiplier;

architecture Behavioral of Multiplier is
	component fullAdder is
    Port ( i1,i2,cin : in  STD_LOGIC;
           sum , cout : out  STD_LOGIC);
	end component fullAdder;

	component halfAdder is
    Port ( in1,in2 : in  STD_LOGIC;
           Co , S : out  STD_LOGIC);
	end component halfAdder;

	signal Level0, Level1: STD_LOGIC_VECTOR(6 downto 0);
	signal andd: STD_LOGIC_VECTOR(15 downto 0);
	signal Level3: STD_LOGIC_VECTOR(2 downto 0);
	
begin

	
	-- create all and gates	

	-- layer 1
	andd(0) <= A(0) and B(0);
	andd(1) <= A(0) and B(1);
	andd(2) <= A(0) and B(2);
	andd(3) <= A(0) and B(3);
	-- layer 2
	andd(4) <= A(1) and B(0);
	andd(5) <= A(1) and B(1);
	andd(6) <= A(1) and B(2);
	andd(7) <= A(1) and B(3);
	-- layer 3
	andd(8) <= A(2) and B(0);
	andd(9) <= A(2) and B(1);
	andd(10) <= A(2) and B(2);
	andd(11) <= A(2) and B(3);
	-- layer 4
	andd(12) <= A(3) and B(0);
	andd(13) <= A(3) and B(1);
	andd(14) <= A(3) and B(2);
	andd(15) <= A(3) and B(3);
	
	-- calcute level 0 :
	RES(0) <= andd(0);
	
	ha0: halfAdder port map(in1 => andd(1), in2 => andd(4), Co => Level0(0), S => RES(1));
	fa0: fullAdder port map(i1 => andd(2), i2 => andd(5), cin => Level0(0), sum => Level0(1), cout => Level0(2));
	fa1: fullAdder port map(i1 => andd(3), i2 => andd(6), cin => Level0(2), sum => Level0(3), cout => Level0(4));
	ha1: halfAdder port map(in1 => andd(7), in2 => Level0(4), S => Level0(5), Co => Level0(6));

	ha2: halfAdder port map(in1 => Level0(1), in2 => andd(8), Co => Level1(0), S => RES(2));
	fa3: fullAdder port map(i1 => andd(9), i2 => Level0(3), cin => Level1(0), sum => Level1(1), cout => Level1(2));
	fa4: fullAdder port map(i1 =>andd(10), i2 => Level0(5), cin => Level1(2), sum => Level1(3), cout => Level1(4));
	fa5: fullAdder port map(i1 =>andd(11), i2 => Level0(6), cin => Level1(4), sum => Level1(5), cout => Level1(6));

	ha3: halfAdder port map(in1 => andd(12), in2 => Level1(1), Co => Level3(0), S => RES(3));
	fa6: fullAdder port map(i1 => andd(13), i2 => Level1(3), cin => Level3(0), sum => RES(4), cout => Level3(1));
	fa7: fullAdder port map(i1 => andd(14), i2 => Level1(5), cin => Level3(1), sum => RES(5), cout => Level3(2));
	fa8: fullAdder port map(i1 => andd(15), i2 => Level3(2), cin => Level1(6), sum => RES(6), cout => RES(7));



END ;