LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY TB_RA IS
END TB_RA ;

ARCHITECTURE behavior OF TB_RA IS 

-- Component 
	COMPONENT ripple_cadder
    Port ( a : in  STD_LOGIC_VECTOR(3 downto 0);
           b : in  STD_LOGIC_VECTOR(3 downto 0);
	   cin : in STD_LOGIC ;
           sum : out  STD_LOGIC_VECTOR(3 downto 0);
           cout : out  STD_LOGIC);
	END COMPONENT;

 -- inputs
	signal A : std_logic_vector(3 downto 0) := "1001";
	signal B : std_logic_vector(3 downto 0) := "0000";
	signal Cin: std_logic := '0';
 -- outputs
	signal Sum: std_logic_vector(3 downto 0);
	signal Cout: std_logic;

BEGIN
	instanceOfRA: ripple_cadder PORT MAP(a => A, b => B, cin => Cin, sum => Sum, cout => Cout);

   stim_proc: process
	  begin

    wait for 150 ns;
    A <= "0010";
    B <= "0101";
    Cin <= '1';
    wait for 75 ns;

    A <= "1001";
    B <= "1011";
    Cin <= '0';
    wait for 45 ns;

    A <= "0110";
    B <= "0101";
    wait for 100 ns;

    A <= "0010";
    B <= "1010";
    Cin <= '1';
  end process;  
END;
