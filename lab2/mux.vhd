library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity mux is
	port(
		x0,x1,x2,x3,s0,s1 : in std_logic;
		m : out std_logic
	);
end mux;

architecture Behavioral of mux is
	component mux2to1 is
		port(
			x0,x1,s : in std_logic;
			m : out std_logic
		);
	end component mux2to1;
	signal signal0 , signal1 : std_logic ;
begin
	mux_instance0 : mux2to1 port map (x0=>x0 , x1=>x1 , s => s0 , m=> signal0);
	mux_instance1 : mux2to1 port map (x0=>x2 , x1=>x3 , s => s0 , m=> signal1);
	mux_instance2 : mux2to1 port map (x0=>signal0 , x1=>signal1 , s => s1 , m=> m);
	
end Behavioral;

