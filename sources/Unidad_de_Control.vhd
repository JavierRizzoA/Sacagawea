----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:08:42 06/05/2016 
-- Design Name: 
-- Module Name:    Unidad_de_Control - Behavioral 
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

entity Unidad_de_Control is
    Port ( IR : in  STD_LOGIC_VECTOR (7 downto 0);
           clk : in  STD_LOGIC;
           sal_control : out  STD_LOGIC_VECTOR (24 downto 0)
			  );
end Unidad_de_Control;

architecture Behavioral of Unidad_de_Control is

	component Cntrl_cont is
		port(
				clk : in std_logic;
				reset : in std_logic;
				sal_cont : out std_logic_vector(2 downto 0)
			);
	end component;
	
	component mem_control is
		port(
					IR: in std_logic_vector(7 downto 0);
					CONT: in std_logic_vector(2 downto 0);
					salida_mem_control: out std_logic_vector(24 downto 0)
			  );
	end component;
	
	signal sal_cont_temp: std_logic_vector(24 downto 0);
	signal sal_contador_temp: std_logic_vector(2 downto 0);
	signal rst : std_logic;

begin
	
	rst <= sal_cont_temp(23);
	c0: Cntrl_cont port map(clk, rst, sal_contador_temp);
	mem0: mem_control port map(IR, sal_contador_temp, sal_cont_temp);
	sal_control <= sal_cont_temp(24 downto 0);
	
end Behavioral;

