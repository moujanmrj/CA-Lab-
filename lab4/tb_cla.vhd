
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY TB_cla IS
END TB_cla;

ARCHITECTURE behavior OF TB_cla IS 
	COMPONENT cla
    Port ( A : in  STD_LOGIC_VECTOR(3 downto 0);
           B : in  STD_LOGIC_VECTOR(3 downto 0);
	   Cin: in STD_LOGIC;
           Sum : out  STD_LOGIC_VECTOR(3 downto 0);
           Cout: out  STD_LOGIC);
	END COMPONENT;

 -- inputs
	signal A : std_logic_vector(3 downto 0) := "1000";
	signal B : std_logic_vector(3 downto 0) := "0000";
	signal Cin: std_logic := '0';
 -- outputs
	signal Sum: std_logic_vector(3 downto 0);
	signal Cout: std_logic;

BEGIN

	instance: cla PORT MAP(A => A, B => B, Cin => Cin, Sum => Sum, Cout => Cout);

	stim_proc: process
	  begin

    wait for 100 ns;
    
    A <= "1000";
    B <= "0100";
    Cin <= '1';
    wait for 150 ns;

    A <= "0001";
    B <= "1000";
    Cin <='0';
    wait for 100 ns;

    A <= "0100";
    B <= "0101";
    wait for 100 ns;

    A <= "1111";
    B <= "1110";
    wait for 100 ns;
    
    A <= "0010";
    B <= "1011";
  end process;  
END;
