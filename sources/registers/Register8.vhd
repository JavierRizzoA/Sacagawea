library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Register8 is
  Port (
    d : in  STD_LOGIC_VECTOR(7 downto 0) := X"00"; --Input.
    load : in  STD_LOGIC;                   --Load/Enable.
    clr : in  STD_LOGIC;                  --Async clear.
    clk : in  STD_LOGIC;                  --Clock.
    q : out  STD_LOGIC_VECTOR(7 downto 0) := X"00" --Output
  );
end Register8;

architecture Behavioral of Register8 is
begin
  process(clk, clr)
  begin
    if rising_edge(clk) then
		 if clr = '1' then
			q <= "00000000";
		 elsif load = '1' then
			  q <= d;
		 end if;
    end if;
  end process;
end Behavioral;