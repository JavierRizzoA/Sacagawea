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
	port(ar : in std_logic_vector(11 downto 0);
			clk : in std_logic;
			ram_we: in std_logic;
			
			bus_datos : inout std_logic_vector(7 downto 0);
			led_out: out std_logic_vector(7 downto 0);
			switch_in : in std_logic_vector(7 downto 0));
		  
end Dispositivos;

architecture Behavioral of Dispositivos is
	
	component RAM 
	port(
			CLK  : in std_logic;
          WE   : in std_logic;
          EN   : in std_logic;
          ADDR : in std_logic_vector(9 downto 0);
          DI   : in std_logic_vector(7 downto 0);
          DO   : out std_logic_vector(7 downto 0));
	end component;
	component ROM
	port(CLK : in std_logic;
      EN : in std_logic;
      ADDR : in std_logic_vector(9 downto 0);
      DATA : out std_logic_vector(7 downto 0));
	end component;
	signal ram_en : std_logic;
	signal rom_en : std_logic;
	signal ram_out: std_logic_vector(7 downto 0);
	signal rom_out : std_logic_vector(7 downto 0);
	
	signal switch_out: std_logic_vector(7 downto 0);
begin
	led_out <= bus_datos when ar(11 downto 10) = "11" else
				"ZZZZZZZZ";
	switch_out <= switch_in when ar(11 downto 10) = "10" else
				"ZZZZZZZZ";
	ram_en <= '1' when ar(11 downto 10) = "00" else 
				'0';
	rom_en <= '1' when ar(11 downto 10) = "01" else 
				'0';
	r0: RAM port map(clk, ram_we, ram_en, ar(9 downto 0), bus_datos, ram_out);
	r1: ROM port map(clk, rom_en, ar(9 downto 0), rom_out);
	
	bus_datos <= ram_out when ram_out /= "ZZZZZZZZ" else
					 rom_out when rom_out /= "ZZZZZZZZ" else
					 switch_out when switch_out /= "ZZZZZZZZ" else
					 "ZZZZZZZZ";
						
end Behavioral;

