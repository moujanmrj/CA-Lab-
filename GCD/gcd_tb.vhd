-- gcd calculator testbench ali asad 9831004

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity gcd_tb is
end gcd_tb;

architecture test of gcd_tb is

    -- Component Declaration for the Unit Under Test (UUT)
    component gcd_calculator
        port (
            A   : in unsigned (3 downto 0);
            B   : in unsigned (3 downto 0);
            gcd : out unsigned (3 downto 0)
        );
    end component;

    --Inputs
    signal A   : unsigned(3 downto 0) := (others => '0');
    signal B   : unsigned(3 downto 0) := (others => '0');

    --Outputs
    signal gcd : unsigned (3 downto 0);

begin

    -- Instantiate the Unit Under Test (UUT)
    uut : gcd_calculator port map(
        A   => A,
        B   => B,
        gcd => gcd
    );

    process
    begin

        A <= "0101";
        B <= "1111";
		  
		  wait for 100 ns;

        A <= "0111";
        B <= "0110";

        wait for 100 ns;
        A <= "0010";
        B <= "1001";

        wait for 100 ns;
        A <= "0001";
        B <= "0001";

        wait for 100 ns;

        A <= "0011";
        B <= "0110";
		  
		  wait for 100 ns;
        A <= "1111";
        B <= "1111";

        wait for 100 ns;
        A <= "1100";
        B <= "1010";

        wait for 100 ns;
        A <= "1000";
        B <= "0100";
        
        wait for 100 ns;

    end process;

end test;