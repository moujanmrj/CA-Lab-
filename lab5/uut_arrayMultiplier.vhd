
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY uut_arrayMultiplier IS
END uut_arrayMultiplier;
 
ARCHITECTURE behavior OF uut_arrayMultiplier IS 
 
 
    COMPONENT arrayMultiplier
	Port ( A, B: in  STD_LOGIC_VECTOR(3 downto 0);
			 RES : out  STD_LOGIC_VECTOR(7 downto 0));
    END COMPONENT;
    

   signal A : std_logic_vector(3 downto 0) := (others => '0');
   signal B : std_logic_vector(3 downto 0) := (others => '0');

   signal RES : std_logic_vector(7 downto 0);

BEGIN
 
   uut: arrayMultiplier PORT MAP (
          A => A,
          B => B,
          RES => RES
        );

   stim_proc: process
   begin		
      wait for 100 ns;	
		A <= "0101";
		B <= "1111";
      wait for 100 ns;	
		A <= "0010";
		B <= "1110";
      wait for 100 ns;	
		A <= "0101";
		B <= "0111";
      wait for 100 ns;	
		A <= "1101";
		B <= "1111";

      wait;
   end process;
END;