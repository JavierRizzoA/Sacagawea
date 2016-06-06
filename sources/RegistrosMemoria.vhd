----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:17:31 06/06/2016 
-- Design Name: 
-- Module Name:    RegistrosMemoria - Behavioral 
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

entity RegistrosMemoria is
    Port ( clk : in STD_LOGIC;
           ma : in  STD_LOGIC;
           me : in  STD_LOGIC;
           z : in  STD_LOGIC;
           bus_datos : inout  STD_LOGIC_VECTOR (7 downto 0);
           alu_sal : in  STD_LOGIC_VECTOR (7 downto 0);
           senal_rst : in  STD_LOGIC;
           control : in STD_LOGIC_VECTOR(24 DOWNTO 0);
           ir_sal : out  STD_LOGIC_VECTOR (7 downto 0);
           mbr_sal : out  STD_LOGIC_VECTOR (7 downto 0);
           ar_sal : out  STD_LOGIC_VECTOR (11 downto 0));
end RegistrosMemoria;

architecture Behavioral of RegistrosMemoria is
  component RegistrosArriba
    port(
      clk : in std_logic;
      ME, Z, MA: in std_logic;
      control: in std_logic_vector(24 downto 0);
      mbr_s_datos: in std_logic_vector(7 downto 0);
      ir_s: in std_logic_vector(7 downto 0);
      ar_s : out std_logic_vector(11 downto 0));
  end component;
  
  component RegistrosAbajo
    port(
      alu_sal : in std_logic_vector(7 downto 0);
      clk : in std_logic;
      control: in STD_LOGIC_VECTOR(24 DOWNTO 0);
      senal_rst : in STD_LOGIC;
      ir_sal: out  STD_LOGIC_VECTOR(7 downto 0);
      mbr_sal: out STD_LOGIC_VECTOR(7 DOWNTO 0);
      bus_datos : inout std_logic_vector(7 downto 0)
    );
  end component;
  SIGNAL ir_sal_gay, mbr_sal_gay : STD_LOGIC_VECTOR(7 DOWNTO 0);
  
begin
  ir_sal <= ir_sal_gay;
  mbr_sal <= mbr_sal_gay;
  arriba: RegistrosArriba port map(clk, me, z, ma, control, mbr_sal_gay, ir_sal_gay, ar_sal);
  abajo: RegistrosAbajo port map(alu_sal, clk, control, senal_rst, ir_sal_gay, mbr_sal_gay, bus_datos);
end Behavioral;

