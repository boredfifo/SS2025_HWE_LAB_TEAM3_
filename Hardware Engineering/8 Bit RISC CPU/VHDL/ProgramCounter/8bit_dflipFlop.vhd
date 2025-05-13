library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity eightBIT_DFLIPFLOP is 
port(a: IN STD_LOGIC_VECTOR (7 downto 0);
    b: OUT STD_LOGIC_VECTOR (7 downto 0);
 clk, rst: IN STD_LOGIC);
end eightBIT_DFLIPFLOP;

architecture behavioral of eightBIT_DFLIPFLOP is
component D_FLIPFLOP is
port(d, clk, rst: IN STD_LOGIC;
	q: OUT STD_LOGIC);
end component;

begin
UT0: D_FLIPFLOP port map(d=> a(0), clk=>clk, rst=>rst, q=> b(0));
UT1: D_FLIPFLOP port map(d=> a(1), clk=>clk, rst=>rst, q=> b(1));
UT2: D_FLIPFLOP port map(d=> a(2), clk=>clk, rst=>rst, q=> b(2));
UT3: D_FLIPFLOP port map(d=> a(3), clk=>clk, rst=>rst, q=> b(3));
UT4: D_FLIPFLOP port map(d=> a(4), clk=>clk, rst=>rst, q=> b(4));
UT5: D_FLIPFLOP port map(d=> a(5), clk=>clk, rst=>rst, q=> b(5));
UT6: D_FLIPFLOP port map(d=> a(6), clk=>clk, rst=>rst, q=> b(6));
UT7: D_FLIPFLOP port map(d=> a(7), clk=>clk, rst=>rst, q=> b(7));
end behavioral;

