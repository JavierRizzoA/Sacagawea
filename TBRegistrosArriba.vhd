--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:06:00 06/05/2016
-- Design Name:   
-- Module Name:   /home/javierrizzo/Documents/Escuela/ArquitecturaDeComputadoras/Sacagawea/TBRegistrosArriba.vhd
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
 
ENTITY TBRegistrosArriba IS
END TBRegistrosArriba;
 
ARCHITECTURE behavior OF TBRegistrosArriba IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT RegistrosArriba
    PORT(
         s_alu : IN  std_logic_vector(7 downto 0);
         clk : IN  std_logic;
         mbr_ld : IN  std_logic;
         ir_ld : IN  std_logic;
         ip_ld : IN  std_logic;
         temp_ld : IN  std_logic;
         ban_ld : IN  std_logic;
         ar_ld : IN  std_logic;
         mbr_clr : IN  std_logic;
         ir_clr : IN  std_logic;
         ip_clr : IN  std_logic;
         temp_clr : IN  std_logic;
         ban_clr : IN  std_logic;
         ar_clr : IN  std_logic;
         mbr_sel : IN  std_logic;
         ar_sel : IN  std_logic;
         sum_sel : IN  std_logic;
         ir_sel : IN  std_logic;
         ip_sel2 : IN  std_logic_vector(1 downto 0);
         ME : IN  std_logic;
         Z : IN  std_logic;
         MA : IN  std_logic;
         bus_datos : INOUT  std_logic_vector(7 downto 0);
         ar_s : OUT  std_logic_vector(11 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal s_alu : std_logic_vector(7 downto 0) := (others => '0');
   signal clk : std_logic := '0';
   signal mbr_ld : std_logic := '0';
   signal ir_ld : std_logic := '0';
   signal ip_ld : std_logic := '0';
   signal temp_ld : std_logic := '0';
   signal ban_ld : std_logic := '0';
   signal ar_ld : std_logic := '0';
   signal mbr_clr : std_logic := '0';
   signal ir_clr : std_logic := '0';
   signal ip_clr : std_logic := '0';
   signal temp_clr : std_logic := '0';
   signal ban_clr : std_logic := '0';
   signal ar_clr : std_logic := '0';
   signal mbr_sel : std_logic := '0';
   signal ar_sel : std_logic := '0';
   signal sum_sel : std_logic := '0';
   signal ir_sel : std_logic := '0';
   signal ip_sel2 : std_logic_vector(1 downto 0) := (others => '0');
   signal ME : std_logic := '0';
   signal Z : std_logic := '0';
   signal MA : std_logic := '0';

	--BiDirs
   signal bus_datos : std_logic_vector(7 downto 0);

 	--Outputs
   signal ar_s : std_logic_vector(11 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: RegistrosArriba PORT MAP (
          s_alu => s_alu,
          clk => clk,
          mbr_ld => mbr_ld,
          ir_ld => ir_ld,
          ip_ld => ip_ld,
          temp_ld => temp_ld,
          ban_ld => ban_ld,
          ar_ld => ar_ld,
          mbr_clr => mbr_clr,
          ir_clr => ir_clr,
          ip_clr => ip_clr,
          temp_clr => temp_clr,
          ban_clr => ban_clr,
          ar_clr => ar_clr,
          mbr_sel => mbr_sel,
          ar_sel => ar_sel,
          sum_sel => sum_sel,
          ir_sel => ir_sel,
          ip_sel2 => ip_sel2,
          ME => ME,
          Z => Z,
          MA => MA,
          bus_datos => bus_datos,
          ar_s => ar_s
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

      wait for clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
