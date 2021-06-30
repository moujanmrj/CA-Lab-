library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
entity tffTB is
end entity;
architecture test of tffTB is 
component tff is
    Port ( clk,d,rst : in  STD_LOGIC;
             q: out  STD_LOGIC ;
	     qn : out STD_LOGIC
);
end component ;
signal clkSig : std_logic;
signal dSig : std_logic;
signal rstSig : std_logic;
signal qSig : std_logic;
signal qnotSig : std_logic;
constant Clk_period : time := 20 ns;
begin 
tf : tff port map(clk => clkSig , d => dSig , rst => rstSig , q => qSig , qn=>qnotSig);
   Clk_process :process
   begin
		clkSig <= '1';
		wait for Clk_period/2;
		clkSig <= '0';
		wait for Clk_period/2;
   end process;
rstSig <= '0', '1' after 150 ns ;
dSig <= '0', '1' after 80 ns   ;
end test ; 
