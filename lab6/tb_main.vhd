LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY tb_main IS
END tb_main;
 
ARCHITECTURE behavior OF tb_main IS 
 
    COMPONENT main
    PORT(
			clk : in  STD_LOGIC;
			Reset : in  STD_LOGIC;
			din : in  STD_LOGIC_VECTOR(3 downto 0);
			lr : in std_logic_vector(1 downto 0);
			load : in  STD_LOGIC;
			res : out  STD_LOGIC_VECTOR(6 downto 0));
       
    END COMPONENT;
    
   signal din : std_logic_vector(3 downto 0) := (others => '0');
   signal load : std_logic := '0';
   signal Reset : std_logic := '0';
   signal clk : std_logic := '0';
   signal lr : std_logic_vector(1 downto 0) := (others => '0');

   signal res : std_logic_vector(6 downto 0);

   constant clk_period : time := 10 ns;
 
BEGIN
 
   uut: main PORT MAP (
          din => din,
       	  lr => lr,
          load => load,
          Reset => Reset,
          clk => clk,
          res => res
        );

   clk_process :process
   begin
    clk <= '0';
    wait for clk_period/2;
    clk <= '1';
    wait for clk_period/2;
   end process;
 
   stim_proc: process
   begin    
      wait for 100 ns;  
    
    din <= "1010";
    wait for 20 ns;
    load <= '1';
    wait for 100 ns;  
    load <= '0';
    
    wait for 100 ns;  
    lr <= "01";
    wait for 100 ns;
    load <= '1';
    wait for 50 ns;
    lr <= "00";
    din <= "1110";
    
    wait;
   end process;

END;
