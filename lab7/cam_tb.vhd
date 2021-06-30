--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   08:42:00 05/11/2021
-- Design Name:   
-- Module Name:   C:/Users/Anformatic Golestan/Documents/Computer Architecture Lab/07/Lab7/cam_tb.vhd
-- Project Name:  Lab7
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: CAM
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY CAM_test IS
END CAM_test;
 
ARCHITECTURE behavior OF CAM_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT CAM
    PORT(
         Data_in : IN  std_logic_vector(15 downto 0);
         w : IN  std_logic;
         r : IN  std_logic;
         clk : IN  std_logic;
         rst : IN  std_logic;
         addr_out : OUT  std_logic_vector(7 downto 0);
         Hit_out : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal Data_in : std_logic_vector(15 downto 0) := (others => '0');
   signal w : std_logic := '0';
   signal r : std_logic := '0';
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';

 	--Outputs
   signal addr_out : std_logic_vector(7 downto 0);
   signal Hit_out : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: CAM PORT MAP (
          Data_in => Data_in,
          w => w,
          r => r,
          clk => clk,
          rst => rst,
          addr_out => addr_out,
          Hit_out => Hit_out
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;
		
		rst <= '1';

      wait for clk_period*10;

      w <= '1';
		
		Data_in <= "0000000000000000";
		wait for clk_period;
		
		Data_in <= "0000000100000001";
		wait for clk_period;
		
		Data_in <= "0000001000000010";
		wait for clk_period;
		
		Data_in <= "0000001100000011";
		wait for clk_period;
		
		Data_in <= "0000001100000011";
		wait for clk_period;
		
		
		w <= '0';
		r <= '1';
		
		Data_in <= "0000000000000000";
		wait for clk_period;
		
		Data_in <= "0000000100000001";
		wait for clk_period;
		
		Data_in <= "0000001000000010";
		wait for clk_period;
		
		Data_in <= "0000001100000011";
		wait for clk_period;
		
		Data_in <= "1111000011110000";
		wait for clk_period;

      wait;
   end process;

END;

