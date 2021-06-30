LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY tb_comparator4bit IS
END tb_comparator4bit;
 
ARCHITECTURE behavior OF tb_comparator4bit IS 
 
   
 
    COMPONENT comparator4bit
    PORT(
           a4 : in  STD_LOGIC_VECTOR( 3 downto 0);
           b4 : in  STD_LOGIC_VECTOR( 3 downto 0);
           lin4 : in  STD_LOGIC;
           ein4 : in  STD_LOGIC;
           gin4 : in  STD_LOGIC;
           lout4 : out  STD_LOGIC;
           eout4 : out  STD_LOGIC;
           gout4 : out  STD_LOGIC);

    END COMPONENT;
    
   signal a4 : std_logic_vector(3 downto 0) := (others => '0');
   signal b4 : std_logic_vector(3 downto 0) := (others => '0');
   signal lin4 : std_logic := '0';
   signal ein4 : std_logic := '1';
   signal gin4 : std_logic := '0';

   signal lout4 : std_logic;
   signal eout4 : std_logic;
   signal gout4 : std_logic;
  
BEGIN
 
   uut: comparator4bit PORT MAP (
          a4 => a4,
          b4 => b4,
          lin4 => lin4,
          ein4 => ein4,
          gin4 => gin4,
          lout4 => lout4,
          eout4 => eout4,
          gout4 => gout4
        );

   stim_proc: process
   begin		

      wait for 100 ns;	

		ein4 <= '1';
		a4 <= "1000";
		b4 <= "0101";
		wait for 100 ns;	
		
		a4 <= "1101";
		b4 <= "1101";
		wait for 100 ns;	
		
		a4 <= "0011";
		b4 <= "0100";
		wait for 100 ns;	

        	a4 <= "1111";
		b4 <= "1111";
		wait for 100 ns;
		
      wait;
   end process;

END;
