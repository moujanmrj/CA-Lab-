library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity tff is
    Port ( clk,d,rst : in  STD_LOGIC;
             q: out  STD_LOGIC ;
	     qn : out STD_LOGIC
);
end tff;

architecture structure of tff is
	signal rstS :std_logic ;
	signal qS :std_logic ;
	begin
	process (clk , rst)
		begin
		if( rst = '0' )then
			qS <= '0' ;
		elsif(rising_edge(clk)) then
			if(d = '1')then
				qS<= not(qS);
			else
			 	qS <= qS;
			end if;
		end if; 
	end process;
	q<=qS;
	qn<=not(qs);
end structure;
