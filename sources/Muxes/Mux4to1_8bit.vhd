----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:08:51 06/04/2016 
-- Design Name: 
-- Module Name:    Mux4to1_8bit - Behavioral 
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

entity Mux4to1_8bit is
	port(A, B, C, D : in std_logic_vector(7 downto 0);
		  sel : in std_logic_vector(1 downto 0);
		  S : out std_logic_vector(7 downto 0));
end Mux4to1_8bit;

architecture Behavioral of Mux4to1_8bit is

begin
	with sel select
	s <= A when "00",
		  B when "01",
		  C when "10",
		  D when "11",
		  "XXXXXXXX" when others;

end Behavioral;

