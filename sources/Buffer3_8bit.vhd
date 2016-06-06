----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:21:26 06/06/2016 
-- Design Name: 
-- Module Name:    Buffer3_8bit - Behavioral 
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

entity Buffer3_8bit is
    Port ( d : in  STD_LOGIC_VECTOR (7 downto 0);
           enable : in  STD_LOGIC;
           q : out  STD_LOGIC_VECTOR (7 downto 0));
end Buffer3_8bit;

architecture Behavioral of Buffer3_8bit is
begin
  q <= d WHEN enable = '1' ELSE
       "ZZZZZZZZ";

end Behavioral;

