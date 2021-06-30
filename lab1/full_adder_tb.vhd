LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY full_adder_tb IS
END full_adder_tb;
 
ARCHITECTURE behavior OF full_adder_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT full_adder
    PORT(
         i0 : IN  std_logic;
         i1 : IN  std_logic;
         cin : IN  std_logic;
         s : OUT  std_logic;
         cout : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal i0 : std_logic := '0';
   signal i1 : std_logic := '0';
   signal cin : std_logic := '0';

 	--Outputs
   signal s : std_logic;
   signal cout : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: full_adder PORT MAP (
          i0 => i0,
          i1 => i1,
          cin => cin,
          s => s,
          cout => cout
        );

   -- Clock process definitions

 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      --   wait for 100 ns;	
	i0 <= '0';
	i1 <= '0';
	cin <= '0';
	wait for 50 ns;
	i0 <= '0';
	i1 <= '0';
	cin <= '1';
	wait for 50 ns;   
	i0 <= '0';
	i1 <= '1';
	cin <= '0';
	wait for 50 ns;
	i0 <= '0';
	i1 <= '1';
	cin <= '1';
	wait for 50 ns;
	i0 <= '1';
	i1 <= '0';
	cin <= '0';
	wait for 50 ns;
	i0 <= '1';
	i1 <= '0';
	cin <= '1';
	wait for 50 ns;
	i0 <= '1';
	i1 <= '1';
	cin <= '0';
	wait for 50 ns;   
	i0 <= '1';
	i1 <= '1';
	cin <= '1';
	wait for 50 ns;
			--   wait for <clock>_period*10;

			-- insert stimulus here 

			--    wait;
		end process;

END;
