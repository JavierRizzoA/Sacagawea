----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:01:45 06/05/2016 
-- Design Name: 
-- Module Name:    SWITCHES - Behavioral 
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

entity SWITCHES is
    Port ( 
			  clk : in  STD_LOGIC;
			  switch_enable : in STD_LOGIC;
           switch_datos : out std_logic_vector(7 downto 0);
			  switch_in : in  STD_LOGIC_VECTOR (7 downto 0)
			  );
end SWITCHES;

architecture Behavioral of SWITCHES is

begin

	process(clk)
	begin
		if(clk'event and clk = '1') then
			if(switch_enable = '1') then
				switch_datos <= switch_in;
			else
				switch_datos <= "ZZZZZZZZ";
			end if;
		end if;
	end process;

end Behavioral;

