library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity D_FLIPFLOP is
port(d, clk, rst, en: IN STD_LOGIC;
	q: OUT STD_LOGIC);
end D_FLIPFLOP;

--value of input must be stored only on the rising edge of the clock
architecture behavioral of D_FLIPFLOP is
begin
process(clk, rst)
begin
	if rst = '1' then
		q <= '0';
	elsif rising_edge(clk) then 
		if en = '1' then
		q <= d;
		end if;
	end if;
end process;
end behavioral;
