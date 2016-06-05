library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Register1 is
  Port (
    d : in  STD_LOGIC;    --Input.
    ld : in  STD_LOGIC;   --Load/Enable.
    clr : in  STD_LOGIC;  --Async clear.
    clk : in  STD_LOGIC;  --Clock.
    q : out  STD_LOGIC    --Output
  );
end Register1;

architecture Behavioral of Register1 is
begin
  process(clk, clr)
  begin
    if clr = '1' then
      q <= '0';
    elsif rising_edge(clk) then
      if ld = '1' then
        q <= d;
      end if;
    end if;
  end process;
end Behavioral;