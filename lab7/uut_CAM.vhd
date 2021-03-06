LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY uut_CAM IS
END uut_CAM;
 
ARCHITECTURE behavior OF uut_CAM IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT CAM
    PORT(
         Data_in : IN  std_ulogic_vector(7 downto 0);
         RW : IN  std_logic;
         clk : IN  std_logic;
         Reset : IN  std_logic;
         Address_out : OUT  std_logic_vector(1 downto 0);
         Match : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal Data_in : std_ulogic_vector(7 downto 0) := (others => '0');
   signal RW : std_logic := '0';
   signal clk : std_logic := '0';
   signal Reset : std_logic := '0';

 	--Outputs
   signal Address_out : std_logic_vector(1 downto 0);
   signal Match : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: CAM PORT MAP (
          Data_in => Data_in,
          RW => RW,
          clk => clk,
          Reset => Reset,
          Address_out => Address_out,
          Match => Match
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
      Reset <= '0';
      wait for 100 ns;	
      Reset <= '1';
		RW <= '0';
		Data_in <= "11111111";
      wait for clk_period*10;
		RW <= '1';
		Data_in <= "11111111";
      wait for clk_period*10;
		RW <= '0';
		Data_in <= "11111111";
      wait for clk_period*10;
		RW <= '1';
		Data_in <= "11100111";
      wait for clk_period*10;
		RW <= '0';
		Data_in <= "11101111";
      wait for clk_period*10;
		RW <= '0';
		Data_in <= "11100111";

      wait;
   end process;

END;
