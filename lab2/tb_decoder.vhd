LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY tb_decoder IS
END tb_decoder;
 
ARCHITECTURE behavior OF tb_decoder IS 
 
    COMPONENT decoder
    PORT(
         i0 : IN  std_logic;
         i1 : IN  std_logic;
         o0 : OUT  std_logic;
         o1 : OUT  std_logic;
         o2 : OUT  std_logic;
         o3 : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal i0 : std_logic := '0';
   signal i1 : std_logic := '0';

 	--Outputs
   signal o0 : std_logic;
   signal o1 : std_logic;
   signal o2 : std_logic;
   signal o3 : std_logic;
  
BEGIN
 
   uut: decoder PORT MAP (
          i0 => i0,
          i1 => i1,
          o0 => o0,
          o1 => o1,
          o2 => o2,
          o3 => o3
        ); 

   stioproc: process
   begin		
      
      wait for 100 ns;	

		i0 <= '0';
		i1 <= '0';
		wait for 100 ns;
		
		i0 <= '1';
		i1 <= '0';
		wait for 100 ns;
		
		i0 <= '0';
		i1 <= '1';
		wait for 100 ns;
		
		i0 <= '1';
		i1 <= '1';
		wait for 100 ns;

      wait;
   end process;

END;
