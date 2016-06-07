
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity RAM is
    port (
				clk  : in std_logic;
				write_read   : in std_logic;	--  write = 1  read = 0
				ram_enable   : in std_logic;	
				direccion : in std_logic_vector(9 downto 0);
				ram_datos_escritura : out std_logic_vector(7 downto 0);
				ram_datos_lectura : in std_logic_vector(7 downto 0)
			);
end RAM;

architecture syn of RAM is
    type ram_type is array (0 to 1023) of std_logic_vector (7 downto 0);
    signal RAM: ram_type;
    attribute ram_style : string;
    attribute ram_style of RAM : signal is "block";
begin

    process (clk)
    begin
        if clk'event and clk = '1' then
            if ram_enable = '1' then
                if write_read = '1' then
                    RAM(conv_integer(direccion)) <= ram_datos_lectura;
                else
						ram_datos_escritura <= RAM(conv_integer(direccion)) ;
					 end if;
				else 
					ram_datos_escritura <= "ZZZZZZZZ";
            end if;
        end if;
    end process;

end syn;

					