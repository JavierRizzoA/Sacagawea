----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:49:45 06/05/2016 
-- Design Name: 
-- Module Name:    RegistrosAbajo - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity RegistrosAbajo is
  port(
		s_alu : in std_logic_vector(7 downto 0);
		clk : in std_logic;
		mbr_ld, ir_ld: in std_logic;
		mbr_sel, ir_sel: in std_logic;
    ir_out: out  STD_LOGIC_VECTOR(7 downto 0);
		bus_datos : inout std_logic_vector(7 downto 0)
  );
end RegistrosAbajo;

architecture Behavioral of RegistrosAbajo is
	component Register8
		 port (
			 d : in  STD_LOGIC_VECTOR(7 downto 0); --Input.
			 ld, clr, clk : in  STD_LOGIC;                 
			 q : out  STD_LOGIC_VECTOR(7 downto 0));
	end component;
  
  component Mux2to1_8bit
	 port(A, B : in std_logic_vector(7 downto 0);
		  sel : in std_logic;
		  S : out std_logic_vector(7 downto 0));
	end component;
  
  signal mbr_e : std_logic_Vector(7 downto 0);
	signal ir_e : std_logic_vector(7 downto 0);
begin 
  
  mbr : Register8 port map (mbr_e, mbr_ld, '0', clk, bus_datos); -- MBR
	mbrmux : Mux2to1_8bit port map(s_alu,bus_datos ,mbr_sel, mbr_e); --MUX MBR
	
	ir : Register8 port map (ir_e, ir_ld, '0', clk, ir_out); -- IR
	irmux: Mux2to1_8bit port map (bus_datos, "10011100", ir_sel, ir_e);
	
end Behavioral;

