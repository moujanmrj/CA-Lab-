library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

Entity and_gate is
	Port(
		A, B: in std_logic;
		C : out std_logic
	);
End entity and_gate;

Architecture gatelevel of and_gate is
Begin
	C <= A and B;
End gatelevel;

