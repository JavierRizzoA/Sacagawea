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
	port(
    clk: IN STD_LOGIC;
    mbr_sal: IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    control: IN STD_LOGIC_VECTOR(24 DOWNTO 0);
    alu_sal: OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    ma, me, z: OUT STD_LOGIC
  );
end Alu_regs;

architecture Behavioral of Alu_regs is
	component Alu
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
  
  component Register4
    Port (
      d : in  STD_LOGIC_VECTOR(3 downto 0); --Input.
      ld : in  STD_LOGIC;                   --Load/Enable.
      clr : in  STD_LOGIC;                  --Async clear.
      clk : in  STD_LOGIC;                  --Clock.
      q : out  STD_LOGIC_VECTOR(3 downto 0) --Output
    );
  end component;
  
  component ALUToFlag
    Port (
      alu_sal : in  STD_LOGIC_VECTOR (7 downto 0);
      ma : out  STD_LOGIC;
      me : out  STD_LOGIC;
      z : out  STD_LOGIC);
  end component;
  
  SIGNAL mux_a_sal, mux_b_sal, alu_sal_gay : STD_LOGIC_VECTOR(7 DOWNTO 0);
  SIGNAL r0_sal, r1_sal, r2_sal : STD_LOGIC_VECTOR(7 DOWNTO 0);
  SIGNAL nomamez : STD_LOGIC_VECTOR(3 DOWNTO 0);
  SIGNAL flag_reg_sal : STD_LOGIC_VECTOR(3 DOWNTO 0);
begin
  aluvergas: Alu port map(mux_a_sal, mux_b_sal, control(22 DOWNTO 19), alu_sal_gay);
  alu_sal <= alu_sal_gay;
  muxa: Mux4to1_8bit port map(r0_sal, r1_sal, r2_sal, mbr_sal, control(3 DOWNTO 2), mux_a_sal);
  muxb: Mux4to1_8bit port map(r0_sal, r1_sal, r2_sal, mbr_sal, control(1 DOWNTO 0), mux_b_sal);
  r0: Register8 port map(alu_sal_gay, control(13), '0', clk, r0_sal);
  r1: Register8 port map(alu_sal_gay, control(12), '0', clk, r1_sal);
  r2: Register8 port map(alu_sal_gay, control(11), '0', clk, r2_sal);
  aluflag: ALUToFlag port map(alu_sal_gay, nomamez(2), nomamez(1), nomamez(0));
  flagreg: Register4 port map(nomamez, control(10), '0', clk, flag_reg_sal);
  ma <= flag_reg_sal(2);
  me <= flag_reg_sal(1);
  z <= flag_reg_sal(0);
end Behavioral;

