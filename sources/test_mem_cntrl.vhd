--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:52:02 06/05/2016
-- Design Name:   
-- Module Name:   C:/Users/AlvaroMoreno/Desktop/proooc/sacagawea_copy/test_mem_cntrl.vhd
-- Project Name:  Sacagawea
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: mem_control
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
 
ENTITY test_mem_cntrl IS
END test_mem_cntrl;
 
ARCHITECTURE behavior OF test_mem_cntrl IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT mem_control
    PORT(
         IR : IN  std_logic_vector(7 downto 0);
         CONT : IN  std_logic_vector(2 downto 0);
         salida_mem_control : OUT  std_logic_vector(24 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal IR : std_logic_vector(7 downto 0) := (others => '0');
   signal CONT : std_logic_vector(2 downto 0) := (others => '0');

 	--Outputs
   signal salida_mem_control : std_logic_vector(24 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: mem_control PORT MAP (
          IR => IR,
          CONT => CONT,
          salida_mem_control => salida_mem_control
        );
  

   -- Stimulus process
   stim_proc: process
   begin		
      wait for 100 ns;	

		IR <= X"00";
		CONT <= "000";
		
		wait for 100 ns;
		
		CONT <= "001";
		
		wait for 100 ns;
		
		CONT <= "010";
		
		wait for 100 ns;
		
		IR <= X"E1";
		cont <= "000";
		
		wait for 100 ns;
		
		cont <= "001";
		
		wait for 100 ns;
		
		cont <= "010";
		
		wait for 100 ns;
		
		cont <= "011";
		
		wait for 100 ns;
		
		cont <= "100";
		
		wait for 100 ns;
		
		cont <= "101";
		
		wait for 100 ns;

      wait;
   end process;

END;
