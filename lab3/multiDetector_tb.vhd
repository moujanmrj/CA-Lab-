LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
entity multiDetector_tb is
end multiDetector_tb;

ARCHITECTURE behavior OF multiDetector_tb IS
  
component multiDetector
   Port ( clk,din,rst : in  STD_LOGIC;
             dout: out  STD_LOGIC);
end component;

signal clk : std_logic := '0';
signal din : std_logic := '0';
signal rst :std_logic := '0';

signal dout : std_logic;

constant clk_period : time := 20ns;

begin
  
  uut : multiDetector port map (clk => clk,
din => din,
rst => rst,
dout => dout
);


clk_process : process

begin
  
  clk <= '0';
  wait for clk_period/2;
  clk <= '1';
  wait for clk_period/2;
end process;

proc : process

begin
  
  rst <= '1';
  wait for 100 ns;
  rst <= '0';
  
  din <= '0';
 
wait for 20 ns;
 
din <= '0';
 
wait for 20 ns;
 
din <= '1';
 
wait for 20 ns;
 
din <= '1';
 
wait for 20 ns;
 
din <= '0';
 
wait for 20 ns;
 
din <= '1';
 
wait for 20 ns;
 
din <= '0';
 
wait for 20 ns;
 
din <= '1';
wait for 20 ns;
end process;
 
END;

 

  

