library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity multiDetector is
    Port ( clk,din,rst : in  STD_LOGIC;
             dout: out  STD_LOGIC);
end multiDetector;

architecture structure of multiDetector is
  type stateType is (st0 , st1 , st2 , st3 , st4 , st5);
  signal current_state , next_state : stateType;
  
	begin
	
	process (clk , rst)
		begin
		if( rst = '1' )then
			current_state <= st0;
		elsif(rising_edge(clk)) then
		    current_state <= next_state;
		end if;
	end process;
	
	process(current_state , din) 
	  begin
	  dout <= '0' ;case (current_state) is
	  when st0 =>
	  if (din = '0') then 
	   next_state <= st1;
	   dout <= '0';
	   else
	     next_state <= st0;
	     dout <= '0';
	   end if;
	   when st1 =>
	     if(din = '1')then 
	       next_state <= st2;
	        dout <= '0';
	      else
	        next_state <= st1;
	        dout <= '0';
	       end if;
	     when st2 =>
	       if(din = '0') then
	         next_state <= st3;
	          dout <= '0';
	        else
	          next_state <= st5;
	           dout <= '0';
	          end if;
	       when st3 =>
	         if(din = '1') then
	           next_state <= st4;
	           dout <= '1';
	          else
	            next_state <= st1;
	              dout <= '0';
	            end if;
	         when st4 =>
	           if(din = '1') then
	             next_state <= st5;
	               dout <= '0';
	            else
	              next_state <= st3;
	                dout <= '0';
	             end if ;
	           when st5 =>
	             if( din = '0') then
	               next_state <= st1;
	                 dout <= '1';
	              else
	                next_state <= st0;
	                   dout <= '0';
	               end if;
	               end case;
	               end process;
	   
	 
end structure;


