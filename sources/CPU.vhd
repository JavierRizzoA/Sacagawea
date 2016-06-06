----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:06:17 06/06/2016 
-- Design Name: 
-- Module Name:    CPU - Behavioral 
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

entity CPU is
    Port (
      clk : in  STD_LOGIC;
      senal_rst : in  STD_LOGIC;
      ar_sal : out  STD_LOGIC_VECTOR (11 downto 0);
      bus_datos: inout STD_LOGIC_VECTOR (7 DOWNTO 0);
      read_write: out STD_LOGIC
    );
end CPU;

architecture Behavioral of CPU is
  component Alu_regs
  	port(
      clk: IN STD_LOGIC;
      mbr_sal: IN STD_LOGIC_VECTOR(7 DOWNTO 0);
      control: IN STD_LOGIC_VECTOR(24 DOWNTO 0);
      alu_sal: OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
      ma, me, z: OUT STD_LOGIC
    );
  end component;
  
  component Unidad_de_Control
    Port (
      IR : in  STD_LOGIC_VECTOR (7 downto 0);
      clk : in  STD_LOGIC;
      sal_control : out  STD_LOGIC_VECTOR (24 downto 0)
	  );
  end component;
  
  component RegistrosMemoria
    Port ( 
           clk : in STD_LOGIC;
           ma : in  STD_LOGIC;
           me : in  STD_LOGIC;
           z : in  STD_LOGIC;
           bus_datos : inout  STD_LOGIC_VECTOR (7 downto 0);
           alu_sal : in  STD_LOGIC_VECTOR (7 downto 0);
           senal_rst : in  STD_LOGIC;
           control : in STD_LOGIC_VECTOR(24 DOWNTO 0);
           ir_sal : out  STD_LOGIC_VECTOR (7 downto 0);
           mbr_sal : out  STD_LOGIC_VECTOR (7 downto 0);
           ar_sal : out  STD_LOGIC_VECTOR (11 downto 0)
           );
  end component;
  
  component Buffer3_8bit
    Port (
      d : in  STD_LOGIC_VECTOR (7 downto 0);
      enable : in  STD_LOGIC;
      q : out  STD_LOGIC_VECTOR (7 downto 0));
  end component;
  
  SIGNAL ma, me, z : STD_LOGIC;
  SIGNAL alu_sal, ir_sal, mbr_sal : STD_LOGIC_VECTOR(7 DOWNTO 0);
  SIGNAL control : STD_LOGIC_VECTOR(24 DOWNTO 0);
  SIGNAL ar_sal_gay : STD_LOGIC_VECTOR(11 downto 0);
begin
  ar_sal <= ar_sal_gay;
  registros: RegistrosMemoria port map(clk, ma, me, z, bus_datos, alu_sal, senal_rst, control, ir_sal, mbr_sal, ar_sal_gay);
  alu: Alu_regs port map(clk, mbr_sal, control, alu_sal, ma, me, z);
  uc: Unidad_de_control port map(ir_sal, clk, control);
  b: Buffer3_8bit port map(mbr_sal, control(9), bus_datos);
  read_write <= control(9);
end Behavioral;

