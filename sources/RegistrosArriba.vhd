----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:59:14 06/04/2016 
-- Design Name: 
-- Module Name:    RegistrosArriba - Behavioral 
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity RegistrosArriba is
	port(
		clk : in std_logic;
		ME, Z, MA: in std_logic;
		control: in std_logic_vector(24 downto 0);
		mbr_s_datos: in std_logic_vector(7 downto 0);
		ir_s: in std_logic_vector(7 downto 0);
		ar_s : out std_logic_vector(11 downto 0);
		sum_s: out std_logic_vector(11 downto 0));
end RegistrosArriba;

architecture Behavioral of RegistrosArriba is
	component Register12
		port (
			 d : in  STD_LOGIC_VECTOR(11 downto 0); --Input.
			 ld, clr, clk : in  STD_LOGIC;                 
			 q : out  STD_LOGIC_VECTOR(11 downto 0));
	end component;
	 
	 component Register4
	  port (
			 d : in  STD_LOGIC_VECTOR(3 downto 0); --Input.
			 ld, clr, clk : in  STD_LOGIC;                 
			 q : out  STD_LOGIC_VECTOR(3 downto 0));
	 end component;
	 
	 component Mux2to1_12bit
	 port(A, B : in std_logic_vector(11 downto 0);
		  sel : in std_logic;
		  S : out std_logic_vector(11 downto 0));
	 end component;
	 
	 component Mux4to1_12bit
	 port( A, B, C, D: in std_logic_vector(11 downto 0);
			sel: in std_logic_vector(1 downto 0);
			S : out std_logic_vector(11 downto 0));
	end component;
	
	component Mux2to1_8bit
	port (A, B : in std_logic_vector(7 downto 0);
			sel: in std_logic;
			S : out std_logic_vector(7 downto 0));
	end component;
	
	component Mux4to1_1bit
	port(A, B, C, D : in std_logic;
		  sel : in std_logic_vector(1 downto 0);
		  S : out std_logic);
	end component;

	signal ip_mux_s : std_logic_vector(11 downto 0);
	signal ip_s : std_logic_vector(11 downto 0);
	signal sumador_s : std_logic_vector(11 downto 0);
	signal temp_s : std_logic_vector(11 downto 0);
	signal ban_s : std_logic_vector(3 downto 0);
	signal ar_mux_s : std_logic_vector(11 downto 0);
	signal flags_mux_s :std_logic;
	signal flags_and_s: std_logic_vector(7 downto 0);
	signal sum_mux_s : std_logic_vector(11 downto 0);
	signal sum_tail : std_logic_vector(7 downto 0);
	signal sum_head : std_logic_vector(3 downto 0);
begin
	ip_reg: Register12 port map (ip_mux_s, control(18), '0', clk, ip_s); -- IP
	ip_mux: Mux4to1_12bit port map (sumador_s, ir_s(3 downto 0) & mbr_s_datos, temp_s, "000000000000", control(7 downto 6), ip_mux_s);

	temp_reg : Register12 port map (ip_s, control(24), '0', clk, temp_s); -- TEMP
	
	ban_reg : Register4 port map (ir_s(3 downto 0), control(17), '0', clk, ban_s); -- BAN
	
	ar_reg : Register12 port map (ar_mux_s, control(16), '0', clk, ar_s); -- AR
	ar_mux: Mux2to1_12bit port map (ip_s, ban_s & mbr_s_datos, control(5), ar_mux_s);

	flags_mux: Mux4to1_1bit port map (ME, Z, MA, 'X', ir_s(1 downto 0),  flags_mux_s); -- mux flags
	
	with flags_mux_s select
	flags_and_s <= mbr_s_datos when '1',
					"00000000" when '0',
					"XXXXXXXX" when others;
					
	sum_mux : Mux2to1_12bit port map ("0000"&flags_and_s ,ip_s + 1, control(8), sumador_s);
	
	--sumador_s <= std_logic_vector(signed(ip_s) + signed(sum_head & sum_tail));
end Behavioral;

