--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   10:38:10 06/05/2016
-- Design Name:   
-- Module Name:   C:/Users/AlvaroMoreno/Desktop/proooc/sacagawea_copy/prueba_dispositivos.vhd
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
 
ENTITY prueba_dispositivos IS
END prueba_dispositivos;
 
ARCHITECTURE behavior OF prueba_dispositivos IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Dispositivos
		PORT(
					ar : in std_logic_vector(11 downto 0);
					clk : in std_logic;
					ram_w_r: in std_logic;
					bus_datos : inout std_logic_vector(7 downto 0);
					sal_leds_spartan : out std_logic_vector(7 downto 0);
					in_switches_spartan : in std_logic_vector(7 downto 0)
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
     
		wait for 100 ns;
		
		clk <= '0';
		ar <= X"0FF";
		bus_datos <= "ZZZZZZZZ";
		
		wait for 100 ns;
		
		clk <= '1';
		ar <= X"0FF";	--primer dato de ROM
		
		wait for 100 ns;
		
		clk <= '0';
		ar <= X"099";
		
		wait for 100 ns;
		
		clk <= '1';
		ar <= X"099";	--segundo dato de ROM
		
		wait for 100 ns;
		
		clk <= '0';
		ar <= X"5FA";
		ram_w_r <= '0';
		
		wait for 100 ns;
		
		clk <= '1';
		bus_datos <= X"A5";	--escribir primer dato a RAM 10100101
		ar <= X"5FA";
		ram_w_r <= '1';
		
		wait for 100 ns;
		
		clk <= '0';
		ar <= X"467";
		ram_w_r <= '0';
		
		wait for 100 ns;
		
		clk <= '1';
		bus_datos <= X"62";	--escribir segundo dato a RAM 01100010
		ar <= X"467";
		ram_w_r <= '1';
		
		wait for 100 ns;
		
		clk <= '0';
		ar <= X"467";
		ram_w_r <= '0';
		
		wait for 100 ns;
		
		clk <= '1';
		ar <= X"467";	--se lee el dato en [467] -> X"62" -> 01100010
		ram_w_r <= '0';
		
		wait for 100 ns;
		
		clk <= '0';
		ar <= X"900";
		bus_datos <= "ZZZZZZZZ";
		
		wait for 100 ns;
		
		clk <= '1';
		bus_datos <= X"55";	--se escribe a leds 01010101
		ar <= X"900";
		
		wait for 100 ns;
		
		clk <= '0';
		in_switches_spartan <= X"A3";
		--bus_datos <= "ZZZZZZZZ";
		ar <= X"EFF";
		
		wait for 100 ns;
		
		clk <= '1';
		in_switches_spartan <= X"A3";	--se meten a switches el numero A3 -> 10100011
		ar <= X"EFF";
		
		wait for 100 ns;
		
      wait;
   end process;

END;
