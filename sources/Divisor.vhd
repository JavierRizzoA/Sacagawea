----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:31:04 06/03/2016 
-- Design Name: 
-- Module Name:    Divisor - Behavioral 
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
use IEEE.std_logic_arith.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Divisor is
	port(M, Q : in std_logic_vector(7 downto 0);
		  S : out std_logic_vector (7 downto 0));
end Divisor;

architecture Behavioral of Divisor is
begin
	process(M, Q)
		variable A, B : std_logic_vector(7 downto 0);
	begin
		A := "00000000";
		B := Q;
		for I in 0 to 7 loop
			A := to_stdlogicvector(to_bitvector(A) sll 1);
			A(0) := B(7);
			B := to_stdlogicvector(to_bitvector(B) sll 1);
			A := SIGNED(A) - SIGNED(M);
			if SIGNED(A) < conv_signed(0, 7) then
				B(0) := '0';
				A := UNSIGNED(A) + UNSIGNED(M);
			else
				B(0) := '1';
			end if;
			report "ITER: "&integer'image(I);
			for t in 0 to 7 loop
				 report "A("&integer'image(t)&") value is" &   
						std_logic'image(A(t));
			end loop;
			for t in 0 to 7 loop
				report "B("&integer'image(t)&") value is" &   
					std_logic'image(B(t));
			end loop;
		end loop;
		S <= B;
	end process;

end Behavioral;

