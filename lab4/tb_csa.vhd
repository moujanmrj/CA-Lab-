LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY tb_csa IS
END tb_csa ;

ARCHITECTURE behavior OF tb_csa IS 
	COMPONENT csa
		Port ( A : in  STD_LOGIC_VECTOR(3 downto 0);
		  B : in  STD_LOGIC_VECTOR(3 downto 0);
		  Cin: in STD_LOGIC;
		  Sum : out  STD_LOGIC_VECTOR(3 downto 0);
		  Cout: out  STD_LOGIC);
	END COMPONENT;

 -- inputs
	signal A : std_logic_vector(3 downto 0) := "1001";
	signal B : std_logic_vector(3 downto 0) := "0110";
	signal Cin: std_logic := '0';
 -- outputs
	signal Sum: std_logic_vector(3 downto 0);
	signal Cout: std_logic;

BEGIN

	instanceOfCSA: csa PORT MAP(A => A, B => B, Cin => Cin, Sum => Sum, Cout => Cout);

   stim_proc: process
	  begin

    wait for 50 ns;
    A <= "1010";
    B <= "0101";
    wait for 75 ns;

    A <= "0001";
    B <= "1011";
    Cin <='1';
    wait for 85 ns;

    A <= "1110";
    B <= "0101";
    Cin <= '0';
    wait for 85 ns;

    A <= "0000";
    B <= "1110";
    wait for 85 ns;
    
    A <= "0010";
    B <= "1000";
  end process;  
END;
