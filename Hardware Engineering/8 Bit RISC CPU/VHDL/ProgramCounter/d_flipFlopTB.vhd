library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity d_flipFlopTB is
end d_flipFlopTB;

architecture behavioral of d_flipFlopTB is
signal d_tb, clk_tb, rst_tb, q_tb: STD_LOGIC;
component D_FLIPFLOP
port(d, clk, rst: IN STD_LOGIC;
	q: OUT STD_LOGIC);
end component;
begin
DUT1: D_FLIPFLOP port map( d=>d_tb, clk=>clk_tb, rst=>rst_tb, q=>q_tb);
d_tb <= '0', '0' after 10 ns, '1' after 20 ns, '1' after 30 ns, '1' after 40 ns;
clk_tb <= '0', '1' after 10 ns, '0' after 20 ns, '1' after 30 ns, '1' after 40 ns;
rst_tb <= '0', '0' after 10 ns, '0' after 20 ns, '0' after 30 ns, '0' after 40 ns;
end behavioral;

