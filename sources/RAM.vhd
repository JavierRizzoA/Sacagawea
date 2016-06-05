
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity RAM is
    port (CLK  : in std_logic;
          WE   : in std_logic;
          EN   : in std_logic;
          ADDR : in std_logic_vector(9 downto 0);
          DI   : in std_logic_vector(7 downto 0);
          DO   : out std_logic_vector(7 downto 0));
end RAM;

architecture syn of RAM is
    type ram_type is array (1023 downto 0) of std_logic_vector (7 downto 0);
    signal RAM: ram_type;
begin

    process (CLK)
    begin
        if CLK'event and CLK = '1' then
            if EN = '1' then
                if WE = '1' then
                    RAM(conv_integer(ADDR)) <= DI;
						  DO <= "ZZZZZZZZ";
                end if;
                DO <= RAM(conv_integer(ADDR)) ;
				else 
					DO <= "ZZZZZZZZ";
            end if;
        end if;
    end process;

end syn;

					