library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux2to1 is
	port(
		x0,x1,s : in std_logic;
		m : out std_logic
	);
end mux2to1;

architecture Behavioral of mux2to1 is
	signal signal0 , signal1 : std_logic ;
begin
	signal0 <= not s and x0;
	signal1 <= s and x1;
	m <= signal0 or signal1; 
	
end Behavioral;

