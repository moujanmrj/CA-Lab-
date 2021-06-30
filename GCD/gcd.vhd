-- gcd calculator ali asad 9831004

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity gcd_calculator is
    port (
        A   : in unsigned (3 downto 0);
        B   : in unsigned (3 downto 0);
        gcd : out unsigned (3 downto 0)
    );

end gcd_calculator;

architecture Behavioral of gcd_calculator is
begin
    process (A, B)
        variable gcdVar : integer;
    begin
        for i in 1 to to_integer(B) + 1 loop
            if ((to_integer(A) mod i = 0) and (to_integer(B) mod i = 0)) then
                gcdVar := i;
            end if;
        end loop;
        gcd <= to_unsigned(gcdVar, gcd'length);
    end process;
end Behavioral;