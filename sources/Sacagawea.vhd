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
           leds_in : out  STD_LOGIC_VECTOR (7 downto 0));
end Sacagawea;

architecture Behavioral of Sacagawea is

COMPONENT CPU
    Port (
      clk : in  STD_LOGIC;
      senal_rst : in  STD_LOGIC;
      ar_sal : out  STD_LOGIC_VECTOR (11 downto 0);
      bus_datos: inout STD_LOGIC_VECTOR (7 DOWNTO 0);
      read_write: out STD_LOGIC
    );
END COMPONENT;

COMPONENT Dispositivos
	port(	
			ar : in std_logic_vector(11 downto 0);
			clk : in std_logic;
			ram_w_r: in std_logic;
			bus_datos : inout std_logic_vector(7 downto 0);
			sal_leds_spartan : out std_logic_vector(7 downto 0);
			in_switches_spartan : in std_logic_vector(7 downto 0)
		);
 END COMPONENT;
    
SIGNAL ar_sal : STD_LOGIC_VECTOR(11 DOWNTO 0);
SIGNAL bus_datos : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL read_write: STD_LOGIC;

begin
  cput0: CPU port map(clk, senal_rst, ar_sal, bus_datos, read_write); 
  memes: Dispositivos port map(ar_sal, clk, read_write, bus_datos, leds_in, switches_sal);
end Behavioral;

