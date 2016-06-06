--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   20:51:39 06/05/2016
-- Design Name:   
-- Module Name:   /home/tony/Sacagawea/sources/RegistrosArribaTB.vhd
-- Project Name:  Sacagawea
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: RegistrosArriba
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
 
ENTITY RegistrosArribaTB IS
END RegistrosArribaTB;
 
ARCHITECTURE behavior OF RegistrosArribaTB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT RegistrosArriba
    PORT(
         clk : IN  std_logic;
         ME : IN  std_logic;
         Z : IN  std_logic;
         MA : IN  std_logic;
         control : IN  std_logic_vector(24 downto 0);
         mbr_s_datos : IN  std_logic_vector(7 downto 0);
         ir_s : IN  std_logic_vector(7 downto 0);
         ar_s : OUT  std_logic_vector(11 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal ME : std_logic := '0';
   signal Z : std_logic := '0';
   signal MA : std_logic := '0';
   signal control : std_logic_vector(24 downto 0) := (others => '0');
   signal mbr_s_datos : std_logic_vector(7 downto 0) := (others => '0');
   signal ir_s : std_logic_vector(7 downto 0) := (others => '0');
 	--Outputs
   signal ar_s : std_logic_vector(11 downto 0);

   -- Clock period definitions
   constant clk_period : time := 100 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: RegistrosArriba PORT MAP (
          clk => clk,
          ME => ME,
          Z => Z,
          MA => MA,
          control => control,
          mbr_s_datos => mbr_s_datos,
          ir_s => ir_s,
          ar_s => ar_s
        );

   -- Clock process definitions
  
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		control<= '0'&X"0400C0";
      wait for 100 ns;	
		control<= '0'&X"010000";
		wait for 100 ns;
		control<= '0'&X"040100";
		wait for 100 ns;
		control<= '0'&X"010000";
		wait for 100 ns;
		control<= '0'&X"040100";
		wait for 100 ns;
		control<= '0'&X"010000";
      wait for clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
