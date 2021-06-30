LIBRARY ieee ;
USE ieee.std_logic_1164.all ;

entity ROM is 
port ( clk : in std_logic ;
     address : in integer range 0 to 15 ;
     data_out : out std_logic_vector( 7 downto 0 )) ;
end entity ;

architecture arch of ROM is 

signal reg_address : integer range 0 to 15 ;
	type memory is array ( 0 to 15 ) of std_logic_vector( 7 downto 0 ) ;
	constant myrom : memory := (
	2 => "11111111" , --255
	3 => "11010101" , 
	4 => "01101000" , 
	6 => "10011011" , 
	8 => "01101101" , 
	9 => "00110111" , 
	others => "00000000" ) ;
	begin 
	process(clk)
		begin 
			if( clk'event and clk = '1' ) then
				reg_address <= address ;
		end if ;
end process ;
---------------
data_out <= myrom(reg_address) ;
end architecture ;
