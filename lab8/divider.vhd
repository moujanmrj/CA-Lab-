
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity divider is
    Port ( dividend : IN  std_logic_vector(7 downto 0);
         divisor : IN  std_logic_vector(3 downto 0);
         zero_error : OUT  std_logic;
         overflow : OUT  std_logic;
         Quotient : OUT  std_logic_vector(3 downto 0);
         Remainder : OUT  std_logic_vector(3 downto 0)
        );
end divider;

architecture Behavioral of divider is
begin
	process(dividend, divisor) is
		variable E : STD_LOGIC;
		variable B : STD_LOGIC_VECTOR (3 downto 0);
		variable R, A : STD_LOGIC_VECTOR (3 downto 0);
	begin
		R := dividend(7 downto 4);
		A := dividend(3 downto 0);
		B := divisor;
		
		if (B = "0000") then
			zero_error <= '1';
			overflow <= '1'; 
		elsif (R >= B) then
			
			zero_error <= '0';
			overflow <= '1';
		else
			overflow <= '0';
			zero_error <= '0';
			 
			for sc in 0 to 3 loop
				E := R(3);
				R := R(R'left - 1 downto 0) & A(3);
				A := A(A'left - 1 downto 0) & '0';
				if(E = '1' or  R >= B) then
					R := R + (not B) + "0001" ;
					A(0) := '1';
				else
					A(0) := '0';
					
				end if;
			end loop;
			Remainder <= R;
			quotient <= A;
		end if;
	
	end process;


end Behavioral;

