library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

Entity or_gate is
	Port(
		A, B: in std_logic;
		C : out std_logic
	);
End entity or_gate;

Architecture gatelevel of or_gate is
Begin
	C <= A or B;
End gatelevel;

