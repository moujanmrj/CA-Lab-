LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY uut_Reg_4bits IS
END uut_Reg_4bits;
 
ARCHITECTURE behavior OF uut_Reg_4bits IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Reg_4bits
    PORT(
         clk : IN  std_logic;
         rst : IN  std_logic;
         load : IN  std_logic;
         parallel_in : IN  std_logic_vector(3 downto 0);
         lr : IN  std_logic_vector(1 downto 0);
         reg_out : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic;
   signal reset : std_logic := '1';
   signal load : std_logic := '1';
   signal parallel_in : std_logic_vector(3 downto 0) := (others => '1');
   signal lr : std_logic_vector(1 downto 0) := (others => '0');

 	--Outputs
   signal reg_out : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant clk_period : time := 50 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Reg_4bits PORT MAP (
          clk => clk,
          rst => reset,
          load => load,
          parallel_in => parallel_in,
          lr => lr,
          reg_out => reg_out
        );

   -- Clock process definitions
  clk_process :process
  begin
		clk <= '0';
		wait for clk_period;
		clk <= '1';
		wait for clk_period;
  end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      wait for 70 ns ;	
      reset <= '0';      
      lr <= "00"; --hold

      wait for 70 ns ;
      parallel_in <= "1001"; 
      load <= '1'; --load
		

      wait for 70 ns ;
      load <= '0';
      lr <= "10"; --left shift 

      wait for 70 ns ;
      lr <= "01"; -- arithmetic right shift

      wait for 70 ns ;
      lr <= "11"; -- logical right shift

      wait for 100 ns;
      reset <= '1';
      
   end process;

END;
	