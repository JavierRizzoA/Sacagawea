--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:08:42 06/06/2016
-- Design Name:   
-- Module Name:   C:/Users/AlvaroMoreno/Desktop/PROCESADOR2016/Sacagawea-master/test_memes.vhd
-- Project Name:  Sacagawea
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Dispositivos
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
 
ENTITY test_memes IS
END test_memes;
 
ARCHITECTURE behavior OF test_memes IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Dispositivos
    PORT(
         ar : IN  std_logic_vector(11 downto 0);
         clk : IN  std_logic;
         ram_w_r : IN  std_logic;
         bus_datos : INOUT  std_logic_vector(7 downto 0);
         sal_leds_spartan : OUT  std_logic_vector(7 downto 0);
         in_switches_spartan : IN  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal ar : std_logic_vector(11 downto 0) := (others => '0');
   signal clk : std_logic := '0';
   signal ram_w_r : std_logic := '0';
   signal in_switches_spartan : std_logic_vector(7 downto 0) := (others => '0');

	--BiDirs
   signal bus_datos : std_logic_vector(7 downto 0);

 	--Outputs
   signal sal_leds_spartan : std_logic_vector(7 downto 0);

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Dispositivos PORT MAP (
          ar => ar,
          clk => clk,
          ram_w_r => ram_w_r,
          bus_datos => bus_datos,
          sal_leds_spartan => sal_leds_spartan,
          in_switches_spartan => in_switches_spartan
        );


   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		
		clk <= '0';
		bus_datos <= X"53";
		ram_w_r <= '1';
		ar <= X"400";
		
		wait for 100 ns;
		
		clk <= '1';
		bus_datos <= X"53";
		
		wait for 100 ns;
		
      wait;
   end process;

END;
