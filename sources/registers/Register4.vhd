library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Register4 is
  Port (
    d : in  STD_LOGIC_VECTOR(3 downto 0); --Input.
    ld : in  STD_LOGIC;                   --Load/Enable.
    clr : in  STD_LOGIC;                  --Async clear.
    clk : in  STD_LOGIC;                  --Clock.
    q : out  STD_LOGIC_VECTOR(3 downto 0) --Output
  );
end Register4;

architecture Behavioral of Register4 is
begin
  process(clk, clr)
  begin
    if clr = '1' then
      q <= "0000";
    elsif rising_edge(clk) then
      if ld = '1' then
        q <= d;
      end if;
    end if;
  end process;
end Behavioral;