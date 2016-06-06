--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:18:48 06/05/2016
-- Design Name:   
-- Module Name:   C:/Users/AlvaroMoreno/Desktop/proooc/sacagawea_copy/test_clock_counter_cntrl.vhd
-- Project Name:  Sacagawea
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Cntrl_cont
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
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY test_clock_counter_cntrl IS
END test_clock_counter_cntrl;
 
ARCHITECTURE behavior OF test_clock_counter_cntrl IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Cntrl_cont
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         sal_cont : OUT  std_logic_vector(2 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';

 	--Outputs
   signal sal_cont : std_logic_vector(2 downto 0);

   
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Cntrl_cont PORT MAP (
          clk => clk,
          reset => reset,
          sal_cont => sal_cont
        );

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		
		clk <= '0';
		
		wait for 100 ns;
		
		clk <= '1';
		
		wait for 100 ns;
		
		clk <= '0';
		
		wait for 100 ns;
		
		clk <= '1';
		
		wait for 100 ns;
		
		clk <= '0';
		
		wait for 100 ns;
		
		clk <= '1';
		
		wait for 100 ns;
		
		clk <= '0';
		
		wait for 100 ns;
		
		clk <= '1';
		
		wait for 100 ns;

      wait;
   end process;

END;
