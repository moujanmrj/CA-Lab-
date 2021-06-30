library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity encoder is
	port(
		d0,d1,d2,d3 : in std_logic;
		q0,q1 : out std_logic
	);
end encoder;

architecture Behavioral of encoder is
begin
	q0 <= d1 or d3;
	q1 <= d2 or d3;
end Behavioral;

