LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
  
ENTITY ROM_TB IS
END ROM_TB;
 
ARCHITECTURE behavior OF ROM_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ROM
    PORT(
         clk : IN  std_logic;
         address : in integer range 0 to 15 ;
         data_out : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal address : integer range 0 to 15 ;

 	--Outputs
   signal data_out : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ROM PORT MAP (
          clk => clk,
          address => address,
          data_out => data_out
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		 

      wait for clk_period*10;

	address <= 1;
	wait for 20 ns;
	
	address <= 4;
	wait for 20 ns;

	address <= 2;
	wait for 20 ns;

	address <= 11;
	wait for 20 ns;

      wait;
   end process;

END;
