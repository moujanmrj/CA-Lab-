library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

Entity xor_gate is
	Port(
		A, B: in std_logic;
		C : out std_logic
	);
End entity xor_gate;

Architecture gatelevel of xor_gate is
Begin
	C <= A xor B;
End gatelevel;

