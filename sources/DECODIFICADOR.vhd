----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:18:59 06/05/2016 
-- Design Name: 
-- Module Name:    DECODIFICADOR - Behavioral 
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

entity DECODIFICADOR is
    Port ( dir_ar : in  STD_LOGIC_VECTOR (1 downto 0);
           enable_ROM : out  STD_LOGIC;
           enable_RAM : out  STD_LOGIC;
           enable_LEDS : out  STD_LOGIC;
           enable_SWITCHES : out  STD_LOGIC
			  );
end DECODIFICADOR;

architecture Behavioral of DECODIFICADOR is

	signal temp : std_logic_vector(3 downto 0);

begin

	temp <= "1000" when (dir_ar = "00") else
			  "0100" when (dir_ar = "01") else
			  "0010" when (dir_ar = "10") else
			  "0001";
			  
	enable_ROM <= temp(3);
	enable_RAM <= temp(2);
	enable_LEDS <= temp(1);
	enable_SWITCHES <= temp(0);

end Behavioral;

