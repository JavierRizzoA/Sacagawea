----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:12:52 06/06/2016 
-- Design Name: 
-- Module Name:    MBRToOffset - Behavioral 
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

entity MBRToOffset is
    Port ( mbr_sal : in  STD_LOGIC_VECTOR (7 downto 0);
           mux_flags_sal : in  STD_LOGIC;
           offset_sal : out  STD_LOGIC_VECTOR (11 downto 0));
end MBRToOffset;

signal offset : STD_LOGIC_VECTOR (11 downto 0);

architecture Behavioral of MBRToOffset is
  WITH mbr_sal(7) SELECT
    offset <= "0000" & mbr_sal WHEN '0',
    offset <= "1111" & mbr_sal WHEN '1',
    offset <= "XXXX" & mbr_sal WHEN OTHERS;
    
  WITH mux_flags_sal SELECT
    offset_sal <= offset WHEN '1',
    Offset_sal <= "000000000000" WHEN OTHERS;
begin
end Behavioral;