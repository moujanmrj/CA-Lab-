library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity carrysaveMultiplier is
	Port ( A, B: in  STD_LOGIC_VECTOR(3 downto 0);
          RES : out  STD_LOGIC_VECTOR(7 downto 0));
end carrysaveMultiplier;

architecture Behavioral of carrysaveMultiplier is

	component fullAdder is
     Port ( i1,i2,cin : in  STD_LOGIC;
           sum , cout : out  STD_LOGIC);
	end component fullAdder;

	component halfAdder is
    Port ( in1,in2 : in  STD_LOGIC;
           Co , S : out  STD_LOGIC);
	end component halfAdder;
	
	signal Level0, Level1, Level2: STD_LOGIC_VECTOR(4 downto 0);
	signal andd: STD_LOGIC_VECTOR(15 downto 0);
	signal Level3: STD_LOGIC_VECTOR(1 downto 0);
	
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
	
	-- calculate level 1 :
	half_adder_instance0: halfAdder port map(in1 =>andd(1), in2 => andd(4), Co => Level0(0), S => RES(1));
	half_adder_instance1: halfAdder port map(in1 => andd(2), in2 => andd(5), Co => Level0(2), S => Level0(1));
	half_adder_instance2: halfAdder port map(in1 => andd(3), in2 => andd(6), Co => Level0(4), S => Level0(3));

	-- calculate level 2 :
	full_adder_instance0: fullAdder port map(i1 => andd(8), i2 => Level0(0), cin => Level0(1), sum => RES(2), cout => Level1(0));
	full_adder_instance1: fullAdder port map(i1 => andd(9), i2 => Level0(2), cin => Level0(3), sum => Level1(1), cout => Level1(2));
	full_adder_instance3: fullAdder port map(i1 => andd(10),i2 => andd(7), cin => Level1(4), sum => Level1(3), cout => Level1(4));
	
	-- calculate level 3 :
	full_adder_instance4: fullAdder port map(i1 => andd(12), i2 => Level1(0), cin => Level1(1), sum => RES(3), cout => Level2(0));
	full_adder_instance5: fullAdder port map(i1 => andd(13), i2 => Level1(2), cin => Level1(3), sum => Level2(1), cout => Level2(2));
	full_adder_instance6: fullAdder port map(i1 => andd(14), i2 => andd(11), cin => Level1(4), sum => Level2(3), cout => Level2(4));

	-- calculate final level :
	half_adder_instance3: halfAdder port map(in1 => Level2(0), in2 => Level2(1), Co => Level3(0), S => RES(4));
	full_adder_instance7: fullAdder port map(i1 => Level2(2), i2 => Level2(3), cin => Level3(0), sum => RES(5), cout => Level3(1));
	full_adder_instance8: fullAdder port map(i1 => andd(15), i2 => Level2(4), cin => Level3(1), sum => RES(6), cout => RES(7));

end Behavioral;
