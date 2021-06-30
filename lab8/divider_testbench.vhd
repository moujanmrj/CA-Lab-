LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

 
ENTITY divider_testbench IS
END divider_testbench;
 
ARCHITECTURE behavior OF divider_testbench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT divider
    PORT(
         dividend : IN  std_logic_vector(7 downto 0);
         divisor : IN  std_logic_vector(3 downto 0);
         zero_error : OUT  std_logic;
         overflow : OUT  std_logic;
         Quotient : OUT  std_logic_vector(3 downto 0);
         Remainder : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal dividend : std_logic_vector(7 downto 0) := (others => '0');
   signal divisor : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal divide_zero_err : std_logic;
   signal overflow : std_logic;
   signal Quotient : std_logic_vector(3 downto 0);
   signal Remainder : std_logic_vector(3 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: divider PORT MAP (
          dividend => dividend,
          divisor => divisor,
          zero_error => divide_zero_err,
          overflow => overflow,
          Quotient => Quotient,
          Remainder => Remainder
        );
 

   -- Stimulus process
   stim_proc: process
   begin
		dividend <= X"00";
		divisor <= X"0";
		wait for 10 ns;
		-- use hex instead of binary
		dividend  <=
			X"0A" after 000 ns ,
			X"30" after 100 ns ,
			X"18" after 200 ns ,
			X"20" after 300 ns ,
			X"39" after 400 ns ,
			X"53" after 500 ns ,
			X"62" after 600 ns ,
			X"15" after 700 ns ,
			X"6D" after 800 ns ,
			X"FF" after 900 ns ,
			X"08" after 1000 ns ,
			X"0B" after 1100 ns ;

		divisor <=
				X"2" after 000 ns ,
				X"5" after 100 ns ,
				X"6" after 150 ns ,
				X"0" after 250 ns ,
				X"E" after 350 ns ,
				X"4" after 450 ns ,
				X"8" after 550 ns ,
				X"9" after 650 ns ,
				X"7" after 750 ns ,
				X"3" after 850 ns ,
				X"A" after 950 ns ,
				X"B" after 1050 ns ,
				X"1" after 1150 ns ;
      wait;
   end process;

END;
