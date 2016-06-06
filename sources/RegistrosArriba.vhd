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
		ar_s : out std_logic_vector(11 downto 0));
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
  
  component SumadorIP
    port(
      ip_sal : in  STD_LOGIC_VECTOR (11 downto 0);
      mux_sum_ip_sal : in  STD_LOGIC_VECTOR (11 downto 0);
      sum_sal : out  STD_LOGIC_VECTOR (11 downto 0)
    );
  end component;
  
  component MBRToOffset
    Port ( mbr_sal : in  STD_LOGIC_VECTOR (7 downto 0);
           mux_flags_sal : in  STD_LOGIC;
           offset_sal : out  STD_LOGIC_VECTOR (11 downto 0));
   end component;
   
   SIGNAL mux_ip_sal : STD_LOGIC_VECTOR(11 DOWNTO 0);
   SIGNAL ip_sal : STD_LOGIC_VECTOR(11 DOWNTO 0);
   SIGNAL sumador_sal : STD_LOGIC_VECTOR(11 DOWNTO 0);
   SIGNAL temporal_sal : STD_LOGIC_VECTOR(11 DOWNTO 0);
   SIGNAL sum_mux_ip_sal : STD_LOGIC_VECTOR(11 DOWNTO 0);
   SIGNAL offset_sal : STD_LOGIC_VECTOR(11 DOWNTO 0);
   SIGNAL mux_flags_sal : STD_LOGIC;
   SIGNAL ban_sal : STD_LOGIC_VECTOR(3 DOWNTO 0);
   SIGNAL mux_ar_sal : STD_LOGIC_VECTOR(11 DOWNTO 0);
begin
  ar: Register12 port map(mux_ar_sal, control(16), '0', clk, ar_s);
  ban: Register4 port map(ir_s(3 DOWNTO 0), control(17), '0', clk, ban_sal);
  muxar: Mux2to1_12bit port map(ip_sal,ban_sal & mbr_s_datos, control(5), mux_ar_sal);
  ip: Register12 port map(mux_ip_sal, control(18), '0', clk, mux_ip_sal);
  temporal: Register12 port map(ip_sal, control(24), '0', clk, temporal_sal);
  muxip: Mux4to1_12bit port map(sumador_sal, ir_s(3 DOWNTO 0) & mbr_s_datos, temporal_sal, "000000000000", control(7 DOWNTO 6), mux_ip_sal);
  sum: SumadorIP port map(ip_sal, sum_mux_ip_sal, sumador_sal);
  summux: Mux2to1_12bit port map(offset_sal, "000000000001", control(8), sum_mux_ip_sal);
  offset: MBRToOffset port map(mbr_s_datos, mux_flags_sal, offset_sal);
  muxflags: Mux4to1_1bit port map(MA, ME, Z, '0', ir_s(1 DOWNTO 0), mux_flags_sal);
end Behavioral;

