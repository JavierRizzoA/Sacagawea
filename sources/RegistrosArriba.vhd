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
		s_alu : in std_logic_vector(7 downto 0);
		clk : in std_logic;
		mbr_ld, ir_ld, ip_ld, temp_ld, ban_ld, ar_ld: in std_logic;
		mbr_clr, ir_clr, ip_clr, temp_clr, ban_clr , ar_clr: in std_logic;
		mbr_sel, ar_sel, sum_sel, ir_sel: in std_logic;
		ip_sel2: in std_logic_vector(1 downto 0);
		ME, Z, MA: in std_logic;
		bus_datos : inout std_logic_vector(7 downto 0);
		ar_s : out std_logic_vector(11 downto 0));
end RegistrosArriba;

architecture Behavioral of RegistrosArriba is
	component Register12
		port (
			 d : in  STD_LOGIC_VECTOR(11 downto 0); --Input.
			 ld, clr, clk : in  STD_LOGIC;                 
			 q : out  STD_LOGIC_VECTOR(11 downto 0));
	end component;
	component Register8
		 port (
			 d : in  STD_LOGIC_VECTOR(7 downto 0); --Input.
			 ld, clr, clk : in  STD_LOGIC;                 
			 q : out  STD_LOGIC_VECTOR(7 downto 0));
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
	 port(A, B : in std_logic_vector(7 downto 0);
		  sel : in std_logic;
		  S : out std_logic_vector(7 downto 0));
	 end component;
	 component Mux4to1_8bit
	 port(A, B, C, D : in std_logic_vector(7 downto 0);
			sel: in std_logic_vector(1 downto 0);
			S: out std_logic_vector(7 downto 0));
	end component;
	component Mux4to1_1bit
	port(A, B, C, D : in std_logic;
		  sel : in std_logic_vector(1 downto 0);
		  S : out std_logic);
	end component;
	signal mbr_e : std_logic_Vector(7 downto 0);
	signal ir_s : std_logic_vector(7 downto 0);
	signal ip_e : std_logic_vector(11 downto 0);
	signal ip_s : std_logic_vector(11 downto 0);
	signal sumador_s : std_logic_vector(11 downto 0);
	signal temp_s : std_logic_vector(11 downto 0);
	signal ban_s : std_logic_vector(3 downto 0);
	signal ar_e : std_logic_vector(11 downto 0);
	signal flag :std_logic;
	signal sum_mux_e: std_logic_vector(7 downto 0);
	signal sum_e : std_logic_vector(11 downto 0);
	signal sum_tail : std_logic_vector(7 downto 0);
	signal sum_head : std_logic_vector(3 downto 0);
	signal ir_e : std_logic_vector(7 downto 0);
begin
	u1 : Register8 port map (mbr_e, mbr_ld, mbr_clr, clk, bus_datos); -- MBR
	u2 : Mux2to1_8bit port map(s_alu,bus_datos ,mbr_sel, mbr_e); --MUX MBR
	
	ir : Register8 port map (ir_e, ir_ld, ir_clr, clk, ir_s); -- IR
	ir1: Mux2to1_8bit port map (bus_datos, "10011100", ir_sel, ir_e);
	
	ip : Register12 port map (ip_e, ip_ld, ip_clr, clk, ip_s); -- IP
	ip2: Mux4to1_12bit port map (sumador_s, ir_s(3 downto 0) & bus_datos, temp_s, "000000000000", ip_sel2, ip_e);

	tp : Register12 port map (ip_s, temp_ld, temp_clr, clk, temp_s); -- TEMP
	
	bn : Register4 port map (ir_s(3 downto 0), ban_ld, ban_clr, clk, ban_s); -- BAN
	
	ar : Register12 port map (ar_e, ar_ld, ar_clr, clk, ar_s); -- AR
	ar2: Mux2to1_12bit port map (ip_s, ban_s & bus_datos, ar_sel, ar_e);

	flgs: Mux4to1_1bit port map (ME, Z, MA, 'X', ir_s(1 downto 0),  flag); -- mux flags
	with flag select
	sum_mux_e <= bus_datos when '1',
					"00000000" when '0',
					"XXXXXXXX" when others;
					
	sum : Mux2to1_8bit port map (sum_mux_e , "00000001", sum_sel, sum_tail);
	with sum_tail(7) select
	sum_head <= "1111" when '1',
					"0000" when '0',
					"XXXX" when others;
	sumador_s <= std_logic_vector(signed(ip_s) + signed(sum_head & sum_tail));
end Behavioral;

