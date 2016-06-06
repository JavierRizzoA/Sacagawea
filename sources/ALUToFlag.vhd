----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:21:59 06/06/2016 
-- Design Name: 
-- Module Name:    ALUToFlag - Behavioral 
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

entity ALUToFlag is
    Port ( alu_sal : in  STD_LOGIC_VECTOR (7 downto 0);
           ma : out  STD_LOGIC;
           me : out  STD_LOGIC;
           z : out  STD_LOGIC);
end ALUToFlag;

architecture Behavioral of ALUToFlag is
  SIGNAL mamez: STD_LOGIC_VECTOR(2 DOWNTO 0);
begin
  mamez <= "001" WHEN alu_sal = "00000000" ELSE
           "010" WHEN alu_sal(7) = '1' ELSE
           "100";
  ma <= mamez(2);
  me <= mamez(1);
  z <= mamez(0);
end Behavioral;

