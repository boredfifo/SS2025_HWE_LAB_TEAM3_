library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity eightBit_dfftb is 
end eightBit_dfftb;

architecture behavioral of eightBit_dfftb is
component eightBIT_DFLIPFLOP is 
port(a: IN STD_LOGIC_VECTOR (7 downto 0);
    b: OUT STD_LOGIC_VECTOR (7 downto 0);
 clk, rst: IN STD_LOGIC);
end component;

signal a_tb, b_tb: STD_LOGIC_VECTOR (7 downto 0);
signal clk_tb, rst_tb: STD_LOGIC;

begin
DUT2: eightBIT_DFLIPFLOP port map (a=> a_tb, b=>b_tb, clk=> clk_tb, rst => rst_tb);
a_tb <= "00000000", "00000001" after 10 ns, "00011110" after 20 ns, "01001000" after 30 ns;
clk_tb <= '0', '1' after 10 ns, '0' after 20 ns, '1' after 30 ns;
rst_tb <= '0', '0' after 10 ns, '0' after 20 ns, '0' after 30 ns;
end behavioral;

