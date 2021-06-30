LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY tb_mux IS
END tb_mux;
 
ARCHITECTURE behavior OF tb_mux IS 

    COMPONENT mux
    PORT(
         x0 : IN  std_logic;
         x1 : IN  std_logic;
         x2 : IN  std_logic;
         x3 : IN  std_logic;
         s0 : IN  std_logic;
         s1 : IN  std_logic;
         m : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal x0 : std_logic := '0';
   signal x1 : std_logic := '0';
   signal x2 : std_logic := '0';
   signal x3 : std_logic := '0';
   signal s0 : std_logic := '0';
   signal s1 : std_logic := '0';

 	--Outputs
   signal m : std_logic;
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: mux PORT MAP (
          x0 => x0,
          x1 => x1,
          x2 => x2,
          x3 => x3,
          s0 => s0,
          s1 => s1,
          m => m
        );

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		x0 <= '0';
		x1 <= '0';
		x2 <= '0';
		x3 <= '0';
		s0 <= '0';
		s1 <= '0';
		
		wait for 100 ns;	
		x0 <= '1';
		x1 <= '0';
		x2 <= '0';
		x3 <= '0';
		s0 <= '0';
		s1 <= '0';
		
		wait for 100 ns;	
		x0 <= '0';
		x1 <= '0';
		x2 <= '0';
		x3 <= '0';
		s0 <= '1';
		s1 <= '0';
		
		wait for 100 ns;	
		x0 <= '0';
		x1 <= '1';
		x2 <= '0';
		x3 <= '0';
		s0 <= '1';
		s1 <= '0';
		
		wait for 100 ns;	
		x0 <= '0';
		x1 <= '0';
		x2 <= '0';
		x3 <= '0';
		s0 <= '0';
		s1 <= '1';
		
		wait for 100 ns;	
		x0 <= '0';
		x1 <= '0';
		x2 <= '1';
		x3 <= '0';
		s0 <= '0';
		s1 <= '1';
		
		wait for 100 ns;	
		x0 <= '0';
		x1 <= '0';
		x2 <= '0';
		x3 <= '0';
		s0 <= '1';
		s1 <= '1';
		
		wait for 100 ns;	
		x0 <= '0';
		x1 <= '0';
		x2 <= '0';
		x3 <= '1';
		s0 <= '1';
		s1 <= '1';
      wait;
   end process;

END;
