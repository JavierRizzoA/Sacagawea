----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:07:44 06/06/2016 
-- Design Name: 
-- Module Name:    SumadorIP - Behavioral 
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity SumadorIP is
    Port ( ip_sal : in  STD_LOGIC_VECTOR (11 downto 0);
           mux_sum_ip_sal : in  STD_LOGIC_VECTOR (11 downto 0);
           sum_sal : out  STD_LOGIC_VECTOR (11 downto 0));
end SumadorIP;

architecture Behavioral of SumadorIP is
begin
  sum_sal <= ip_sal + mux_sum_ip_sal;
end Behavioral;