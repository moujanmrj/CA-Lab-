library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity dff is
    Port ( clk,d,rst : in  STD_LOGIC;
             q: out  STD_LOGIC);
end dff;

architecture structure of dff is
	signal rstS :std_logic ;
	begin
	rstS<= rst;
	process (rstS  , clk)
		begin
		if(rstS = '1') then 
			q <= '0';
		elsif(clk = '1')then
			q <= d;
		end if;
	end process;
		
end structure;
