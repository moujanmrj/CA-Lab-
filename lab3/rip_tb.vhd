LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY rip_tb IS
END rip_tb;
 
ARCHITECTURE behavior OF rip_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ripple
    Port ( t,clk,rst : in  STD_LOGIC;
          Q : out  STD_LOGIC_VECTOR(3 downto 0));
    END COMPONENT;
    

   --Inputs
   signal T : std_logic := '0';
   signal Clk : std_logic := '0';
   signal Reset : std_logic := '0';
   signal temp : STD_LOGIC_VECTOR(3 downto 0);
   constant Clk_period : time := 20 ns;
 
BEGIN

   uut: ripple PORT MAP (
          T => T,
          clk => Clk,
          rst => Reset,
	  Q => temp
        );

   -- Clock process definitions
   Clk_process :process
   begin
		Clk <= '0';
		wait for Clk_period/2;
		Clk <= '1';
		wait for Clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
		Reset <= '0';
      wait for 200 ns;	
		Reset <= '1';
		T <= '1';
      wait for Clk_period*15;
		T <= '0';
      wait for Clk_period*10;
		T <= '1';
      wait;
   end process;

END;