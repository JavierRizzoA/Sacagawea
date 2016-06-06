----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:31:06 06/05/2016 
-- Design Name: 
-- Module Name:    Cntrl_cont - Behavioral 
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
use ieee.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Cntrl_cont is
    Port ( clk : in  STD_LOGIC;
				reset : in std_logic;
           sal_cont : out  STD_LOGIC_VECTOR (2 downto 0)
			  );
end Cntrl_cont;

architecture Behavioral of Cntrl_cont is
	signal temp : std_logic_vector(2 downto 0):= "000";
begin

	process(clk)
	begin
		if(clk'event and clk = '1')then
			if(reset = '1') then
				temp <= "000";
			else
				temp <= temp + "001";
		end if;
		end if;
	end process;

	sal_cont <= temp;
end Behavioral;

