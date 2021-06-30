library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity comparator4bit is
    Port ( a4 : in  STD_LOGIC_VECTOR( 3 downto 0);
           b4 : in  STD_LOGIC_VECTOR( 3 downto 0);
           lin4 : in  STD_LOGIC;
           ein4 : in  STD_LOGIC;
           gin4 : in  STD_LOGIC;
           lout4 : out  STD_LOGIC;
           eout4 : out  STD_LOGIC;
           gout4 : out  STD_LOGIC);
end comparator4bit;

architecture Behavioral of comparator4bit is

component comparator1bit is 
	Port (  a : in  STD_LOGIC;
           b : in  STD_LOGIC;
           lin : in  STD_LOGIC;
           ein : in  STD_LOGIC;
           gin : in  STD_LOGIC;
           lout : out  STD_LOGIC;
           eout : out  STD_LOGIC;
           gout : out  STD_LOGIC
			 );	
end component comparator1bit;

signal ls : STD_LOGIC_VECTOR(2 downto 0);
signal es : STD_LOGIC_VECTOR(2 downto 0);
signal gs : STD_LOGIC_VECTOR(2 downto 0);

begin

co1: comparator1bit port map (a4(0),b4(0),lin4,ein4,gin4,ls(0),es(0),gs(0));
co2: comparator1bit port map (a4(1),b4(1),ls(0),es(0),gs(0),ls(1),es(1),gs(1));
co3: comparator1bit port map (a4(2),b4(2),ls(1),es(1),gs(1),ls(2),es(2),gs(2));
co4: comparator1bit port map (a4(3),b4(3),ls(2),es(2),gs(2),lout4,eout4,gout4);

end Behavioral;

