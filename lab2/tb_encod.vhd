LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY tb_encoder IS
END tb_encoder;
 
ARCHITECTURE behavior OF tb_encoder IS 
    COMPONENT encoder
    PORT(
         d0 : IN  std_logic;
         d1 : IN  std_logic;
         d2 : IN  std_logic;
         d3 : IN  std_logic;
         q0 : OUT  std_logic;
         q1 : OUT  std_logic
        );
    END COMPONENT;
    
   --Inputs
   signal d0 : std_logic := '0';
   signal d1 : std_logic := '0';
   signal d2 : std_logic := '0';
   signal d3 : std_logic := '0';

 	--Outputs
   signal q0 : std_logic;
   signal q1 : std_logic;

BEGIN   
	uut: encoder PORT MAP (
          d0 => d0,
          d1 => d1,
          d2 => d2,
          d3 => d3,
          q0 => q0,
          q1 => q1
        );

   -- Stimulus process
   stim_proc: process
   begin		
      wait for 100 ns;
		d1 <= '1', '0' after 100 ns;
		d2 <= '0', '1' after 100 ns,'0' after 100 ns;
		d3 <= '1' after 200 ns;
		wait;
   end process;

END;
