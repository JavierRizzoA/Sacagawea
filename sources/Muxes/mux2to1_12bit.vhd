library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
-- use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
-- library UNISIM;
-- use UNISIM.VComponents.all;

entity Mux2to1_12bit is
	port(A, B : in std_logic_vector(11 downto 0);
		  sel : in std_logic;
		  S : out std_logic_vector(11 downto 0));
end Mux2to1_12bit;

architecture Behavioral of Mux2to1_12bit is

begin
	with sel select
	s <= A when '0',
		B when '1',
		"XXXXXXXXXXXX" when others;

end Behavioral;