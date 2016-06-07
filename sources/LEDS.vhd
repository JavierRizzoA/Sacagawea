----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:45:18 06/05/2016 
-- Design Name: 
-- Module Name:    LEDS - Behavioral 
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

entity LEDS is
    Port ( 
			  clk : in std_logic;
			  leds_enable : in std_logic;
			  leds_input : in  STD_LOGIC_VECTOR (7 downto 0);
           leds_output : out  STD_LOGIC_VECTOR (7 downto 0)
			  );
end LEDS;

architecture Behavioral of LEDS is
begin

	process(clk)
	begin
		if (clk'event and clk='1') then
			if (leds_enable = '1') then
				leds_output <= leds_input;
			else
				--temp <= leds_input;
				leds_output <= "ZZZZZZZZ";
			end if;
		end if;
	end process;

end Behavioral;

