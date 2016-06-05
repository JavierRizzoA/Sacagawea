----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:01:07 06/04/2016 
-- Design Name: 
-- Module Name:    Alu_regs - Behavioral 
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

entity Alu_regs is
	port(r0_ld, r1_ld, r2_ld : in std_logic;
		  sel_a, sel_b : in std_logic_vector ( 1 downto 0);
		  s_mbr: in std_logic_vector(7 downto 0);
		  clk : in std_logic;
		  r0_clr, r1_clr, r2_clr : in std_logic;
		  ctrl_alu : in std_logic_vector(3 downto 0);
		  s_alu_regs: out std_logic_vector( 7 downto 0);
		  x_reg0, x_reg1, x_reg2 : out std_logic_vector( 7 downto 0));
end Alu_regs;

architecture Behavioral of Alu_regs is
	component ALU
		port (s_muxa, s_muxb : in std_logic_vector(7 downto 0);
			ctrl_alu : in std_logic_vector(3 downto 0);
			s_alu : out std_logic_vector(7 downto 0));
	end component;
	component Mux4to1_8bit
		port(A, B, C, D : in std_logic_vector(7 downto 0);
		  sel : in std_logic_vector(1 downto 0);
		  S : out std_logic_vector(7 downto 0));
	end component;
	component Register8
	  Port (
		d : in  STD_LOGIC_VECTOR(7 downto 0); --Input.
		ld : in  STD_LOGIC;                   --Load/Enable.
		clr : in  STD_LOGIC;                  --Async clear.
		clk : in  STD_LOGIC;                  --Clock.
		q : out  STD_LOGIC_VECTOR(7 downto 0) --Output
		);
	end component;
	signal s_r0, s_r1, s_r2 : std_logic_vector(7 downto 0);
	signal s_ma, s_mb : std_logic_vector(7 downto 0);
	signal salu: std_logic_vector(7 downto 0);
begin
	
	m0: Register8 port map (salu, r0_ld, r0_clr, clk, s_r0);
	m1: Register8 port map (salu, r1_ld, r1_clr, clk, s_r1);
	m2: Register8 port map (salu, r2_ld, r2_clr, clk, s_r2);
	r1: Mux4to1_8bit port map (s_r0, s_r1, s_r2, s_mbr, sel_a, s_ma); 
	r2: Mux4to1_8bit port map (s_r0, s_r1, s_r2, s_mbr, sel_b, s_mb); 
	s1: ALU port map (s_ma, s_mb, ctrl_alu, salu);
	s_alu_regs <= salu;
	x_reg0 <= s_r0;
	x_reg1 <= s_r1;	
	x_reg2 <= s_r2;
end Behavioral;

