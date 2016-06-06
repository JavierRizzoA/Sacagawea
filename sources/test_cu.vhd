--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:28:44 06/05/2016
-- Design Name:   
-- Module Name:   C:/Users/AlvaroMoreno/Desktop/proooc/sacagawea_copy/test_cu.vhd
-- Project Name:  Sacagawea
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Unidad_de_Control
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
 
ENTITY test_cu IS
END test_cu;
 
ARCHITECTURE behavior OF test_cu IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Unidad_de_Control
    PORT(
         IR : IN  std_logic_vector(7 downto 0);
         clk : IN  std_logic;
         sal_control : OUT  std_logic_vector(24 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal IR : std_logic_vector(7 downto 0) := (others => '0');
   signal clk : std_logic := '0';

 	--Outputs
   signal sal_control : std_logic_vector(24 downto 0);

BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Unidad_de_Control PORT MAP (
          IR => IR,
          clk => clk,
          sal_control => sal_control
        );

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		
		clk <= '0';
		IR <= X"00";
		
		wait for 100 ns;
		
		clk <= '1';
		IR <= X"00";
		
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
    
      wait;
   end process;

END;
