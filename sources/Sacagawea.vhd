----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:15:24 06/06/2016 
-- Design Name: 
-- Module Name:    Sacagawea - Behavioral 
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

entity Sacagawea is
    Port ( clk : in  STD_LOGIC;
           senal_rst : in  STD_LOGIC;
           switches_sal : in  STD_LOGIC_VECTOR (7 downto 0);
           leds_in : out  STD_LOGIC_VECTOR (7 downto 0);
			  bus_datos_memtoregs :  out std_logic_vector(7 downto 0);
			  bus_datos_mbrtomem : out std_logic_vector(7 downto 0);
			  senal_rw : out std_logic;
			  conta : out std_logic_vector(24 downto 0);
			  salida_ip : out std_logic_vector(11 downto 0);
			  salida_ir : out std_logic_vector(7 downto 0);
			  salida_ar : out std_logic_vector(11 downto 0)
			  );
end Sacagawea;

architecture Behavioral of Sacagawea is

COMPONENT CPU
    Port (
      clk : in  STD_LOGIC;
      senal_rst : in  STD_LOGIC;
      ar_sal : out  STD_LOGIC_VECTOR (11 downto 0);
      bus_datos_out: in STD_LOGIC_VECTOR (7 DOWNTO 0);
		bus_datos_in : out std_logic_vector(7 downto 0);
      read_write: out STD_LOGIC;
		cont : out std_logic_vector(24 downto 0);
		salida_ip : out std_logic_vector(11 downto 0);
		salida_ir : out std_logic_vector(7 downto 0)
    );
END COMPONENT;

COMPONENT Dispositivos
	port(	
			ar : in std_logic_vector(11 downto 0);
			clk : in std_logic;
			ram_w_r: in std_logic;
			bus_datos_out : out std_logic_vector(7 downto 0);
			bus_datos_in : in std_logic_vector(7 downto 0);
			sal_leds_spartan : out std_logic_vector(7 downto 0);
			in_switches_spartan : in std_logic_vector(7 downto 0)
		);
 END COMPONENT;
    
SIGNAL ar_sal : STD_LOGIC_VECTOR(11 DOWNTO 0);
SIGNAL bus_datos0, bus_datos1 : STD_LOGIC_VECTOR(7 DOWNTO 0); -- 0 salida hacia regs ... 1 entrada a mem
SIGNAL read_write: STD_LOGIC;
signal contout : std_logic_vector(24 downto 0);

begin
  cpu0: CPU port map(clk, senal_rst, ar_sal, bus_datos0, bus_datos1, read_write, contout, salida_ip, salida_ir); 
  memes: Dispositivos port map(ar_sal, clk, read_write, bus_datos0, bus_datos1, leds_in, switches_sal);
  bus_datos_memtoregs <= bus_datos0;
  bus_datos_mbrtomem <= bus_datos1;
  senal_rw <= read_write;
  conta <= contout;
  salida_ar <= ar_sal;
end Behavioral;

