library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity fullAdder is
    Port ( a,b,cin : in  STD_LOGIC;
           sum,cout : out  STD_LOGIC);
end fullAdder;
architecture structure of fullAdder is
	 component halfAdder is
    Port ( a,b : in  STD_LOGIC;
          s,c : out  STD_LOGIC);
	 end component halfAdder;
	signal sig1,sig2,sig3: std_logic;
	begin
	half_adder_instance0:  halfAdder  port  map  (  a  =>  a,  b  =>  b,  s  =>  sig1,  c  => sig2);
	half_adder_instance1:  halfAdder  port  map  (  a  =>  sig1,  b  =>  cin,  s  =>  sum,  c  => sig3);
	cout <= sig2 or sig3;
	END ;
