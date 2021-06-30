library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ripple is
    Port ( t,clk,rst : in  STD_LOGIC;
          Q : out  STD_LOGIC_VECTOR(3 downto 0));
end entity ripple;

architecture structure of ripple is
component tff is 
    Port ( clk,d,rst : in  STD_LOGIC;
             q,qn: out  STD_LOGIC 
);
end component tff ;
signal an,bn,cn,en : std_logic ;
begin
tff_instance0 : tff port map(clk => clk ,d=>t, rst =>rst , q =>Q(0), qn =>an);

tff_instance1 : tff port map(clk => an ,d=>t, rst =>rst , q =>Q(1), qn => bn);

tff_instance2 : tff port map(clk => bn ,d=>t ,rst =>rst , q =>Q(2), qn => cn);

tff_instance3 : tff port map(clk => cn ,d=>t ,rst =>rst , q =>Q(3) , qn =>en);

end structure ;