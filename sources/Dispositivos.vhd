----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    06:01:19 06/05/2016 
-- Design Name: 
-- Module Name:    Dispositivos - Behavioral 
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

entity Dispositivos is
	port(	
			ar : in std_logic_vector(11 downto 0);
			clk : in std_logic;
			ram_w_r: in std_logic;
			bus_datos_out : out std_logic_vector(7 downto 0);
			bus_datos_in : in std_logic_vector(7 downto 0);
			sal_leds_spartan : out std_logic_vector(7 downto 0);
			in_switches_spartan : in std_logic_vector(7 downto 0)
		);
		  
end Dispositivos;

architecture Behavioral of Dispositivos is
	
	component RAM 
		port(
				 clk : in std_logic;
				 write_read : in std_logic;
				 ram_enable : in std_logic;
				 direccion : in std_logic_vector(9 downto 0);
				 ram_datos_escritura : out std_logic_vector(7 downto 0);
				 ram_datos_lectura : in std_logic_vector(7 downto 0)
			 );
	end component;
	
	component ROM
		port(
			clk : in std_logic;
			rom_enable : in std_logic;
			direccion : in std_logic_vector(9 downto 0);
			rom_datos : out std_logic_vector(7 downto 0)
			);
	end component;
	
	component LEDS
		port(
				clk : in std_logic;
				leds_enable : in std_logic;
				leds_input : in std_logic_vector(7 downto 0);
				leds_output : out std_logic_vector(7 downto 0)
			  );
	end component;
	
	component DECODIFICADOR
		port(
				dir_ar : in std_logic_vector(1 downto 0);
				enable_ROM : out std_logic;
				enable_RAM : out std_logic;
				enable_LEDS : out std_logic;
				enable_SWITCHES : out std_logic
			  );
	end component;
	
	component SWITCHES 
		port(
				clk : in std_logic;
				switch_enable : in STD_LOGIC;
				switch_datos : out std_logic_vector(7 downto 0);
				switch_in : in  STD_LOGIC_VECTOR (7 downto 0)
			  );
	end component;
	
	signal temp0, temp1, temp2, temp3 : std_logic;
	
begin

	decodificador0: DECODIFICADOR port map(ar(11 downto 10), temp0, temp1, temp2, temp3);
	disp0: ROM port map(clk, temp0, ar(9 downto 0), bus_datos_out);
	disp1: RAM port map(clk, ram_w_r, temp1, ar(9 downto 0), bus_datos_out, bus_datos_in);
	disp2: LEDS port map(clk, temp2, bus_datos_in, sal_leds_spartan);
	disp3: SWITCHES port map(clk, temp3, bus_datos_out, in_switches_spartan);
						
end Behavioral;

