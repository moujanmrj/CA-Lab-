LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY sd_moore_tb IS
END sd_moore_tb;
 
ARCHITECTURE behavior OF sd_moore_tb IS
 
 
COMPONENT sd_moore
Port ( clk : in STD_LOGIC;
din : in STD_LOGIC;
rst : in STD_LOGIC;
dout : out STD_LOGIC);
END COMPONENT;
 
signal clk : std_logic := '0';
signal din : std_logic := '0';
signal rst : std_logic := '0';
 
 
signal dout : std_logic;
 
constant clk_period : time := 20 ns;
 
BEGIN
 

uut: sd_moore PORT MAP (
clk => clk,
din => din,
rst => rst,
dout => dout
);
 

clk_process :process
begin
clk <= '0';
wait for clk_period/2;
clk <= '1';
wait for clk_period/2;
end process;
 
proc: process
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
