library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity d_flipFlopTB is
end d_flipFlopTB;

architecture behavioral of d_flipFlopTB is
component D_FLIPFLOP
port(d, clk, rst,en: IN STD_LOGIC;
	q: OUT STD_LOGIC);
end component;

signal d_tb, clk_tb, rst_tb, q_tb, en_tb: STD_LOGIC;
begin
DUT1: D_FLIPFLOP port map( d=>d_tb, clk=>clk_tb, rst=>rst_tb, q=>q_tb, en=>en_tb);

clock_gen: process
begin

while now < 200 ns loop
	clk_tb <= '0';
	wait for 10 ns;
	clk_tb <= '1';
	wait for 10 ns;
	end loop;
	wait;
end process;

stimulus: process
begin
	rst_tb <= '1'; 
	en_tb <= '0';
	wait for 20 ns;
	rst_tb <= '0'; 
	en_tb <= '1';
	wait for 20 ns;
	d_tb <= '1';
	wait for 20 ns;
	en_tb <= '0';
	d_tb <= '0';
	wait for 20 ns;
	d_tb <= '1';
	wait;
end process; 
end behavioral;

