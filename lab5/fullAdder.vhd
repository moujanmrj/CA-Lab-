library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity fullAdder is
    Port ( i1,i2,cin : in  STD_LOGIC;
           sum , cout : out  STD_LOGIC);
end fullAdder;

architecture structure of fullAdder is
	 component halfAdder is
		  Port ( in1 , in2 : in  STD_LOGIC;
			Co,S : out  STD_LOGIC);
	 end component halfAdder;
	 
	 signal signal0, signal1,signal2: std_logic;
	 
begin
	half_adder_instance0:  halfAdder  port  map  (  in1  =>  i1,  in2  =>  i2,  S  =>  signal0,  Co  => signal1);
	half_adder_instance1:  halfAdder  port  map  (  in1  =>  signal0,  in2  =>  cin,  S  =>  sum,  Co  => signal2);
	cout <= signal1 or signal2 ;
end structure;
