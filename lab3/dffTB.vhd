library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
entity dffTB is
end entity;
architecture test of dffTB is 
component dff is
  Port ( clk,d,rst : in  STD_LOGIC;
             q: out  STD_LOGIC);
end component ;
signal clkSig : std_logic;
signal dSig : std_logic;
signal rstSig : std_logic;
signal qSig : std_logic;
constant Clk_period : time := 20 ns;
begin 
df : dff port map(clk => clkSig , d => dSig , rst => rstSig , q => qSig);
  Clk_process :process
   begin
		clkSig <= '1';
		wait for Clk_period/2;
		clkSig <= '0';
		wait for Clk_period/2;
   end process;
dSig <= '1', '0' after 25 ns , '1' after 50 ns ;
rstSig <= '0' , '1' after 250 ns ;
end test;