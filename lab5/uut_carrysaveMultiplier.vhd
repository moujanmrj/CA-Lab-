LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY uut_carrysaveMultiplier IS
END uut_carrysaveMultiplier;
 
ARCHITECTURE behavior OF uut_carrysaveMultiplier IS 

 
    COMPONENT carrysaveMultiplier
    PORT(
         A : IN  std_logic_vector(3 downto 0);
         B : IN  std_logic_vector(3 downto 0);
         RES : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   signal A : std_logic_vector(3 downto 0) := (others => '0');
   signal B : std_logic_vector(3 downto 0) := (others => '0');

   signal RES : std_logic_vector(7 downto 0);
 
BEGIN

   uut: carrysaveMultiplier PORT MAP (
          A => A,
          B => B,
          RES => RES
        );

   stim_proc: process
   begin		
      wait for 100 ns;	
		A <= "0001";
		B <= "1111";
      wait for 100 ns;	
		A <= "0010";
		B <= "1011";
      wait for 100 ns;	
		A <= "1101";
		B <= "1110";
      wait for 100 ns;	
		A <= "1111";
		B <= "1111";
      wait;
   end process;

END;