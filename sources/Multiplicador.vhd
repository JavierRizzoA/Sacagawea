----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:27:04 06/05/2016 
-- Design Name: 
-- Module Name:    Multiplicador - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;
USE IEEE.std_LOGIC_UNSIGNED.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Multiplicador is
	port(Multiplicando, Multiplicador : in std_logic_vector(3 downto 0);
			Salida: out std_logic_vector(7 downto 0));
	
end Multiplicador;

architecture Behavioral of Multiplicador is
	begin
	process(Multiplicando, Multiplicador)
		variable A: signed(3 downto 0);
		variable M: signed(3 downto 0);
		variable Q: signed(3 downto 0);
		variable Q_1 : std_logic; 
	begin
		A:= "0000";
		M:= signed(Multiplicando);
		Q:= signed(Multiplicador);
		Q_1 := '0';
		for I in 0 to 3 loop
			if std_logic_vector(std_logic(Q(0)) & Q_1)  = "10" then
				 A:= A - M;
			elsif	std_logic_vector(std_logic(Q(0)) & Q_1) = "01" then
				A:= A + M;
			end if;
			
			Q_1 := Q(0);
			Q = Q srl 1;
			Q(3) = A(0);
			A = A srl 1;
			A(3) := A(2);
		end loop;
		Salida <= std_logic_vector(A & Q);
	end process;



end Behavioral;