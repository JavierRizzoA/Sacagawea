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
		alu_sal : in std_logic_vector(7 downto 0);
		clk : in std_logic;
    control: in STD_LOGIC_VECTOR(24 DOWNTO 0);
    senal_rst : in STD_LOGIC;
    ir_sal: out  STD_LOGIC_VECTOR(7 downto 0);
    mbr_sal: out STD_LOGIC_VECTOR(7 DOWNTO 0);
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
  
  SIGNAL mux_mbr_sal : STD_LOGIC_VECTOR(7 DOWNTO 0);
  SIGNAL mux_ir_sal: STD_LOGIC_VECTOR(7 DOWNTO 0);
begin 
  mbr: Register8 port map(mux_mbr_sal, control(15), '0', clk, mbr_sal);
  muxmbr: Mux2to1_8bit port map(bus_datos, alu_sal, control(4), mux_mbr_sal);
  
  ir: Register8 port map(mux_ir_sal, control(14), '0', clk, ir_sal);
  irmux: Mux2to1_8bit port map(bus_datos, "10011100", senal_rst, mux_ir_sal);
end Behavioral;

