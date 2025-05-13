library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity eightBitFA_TB is 
end eightBitFA_TB;

architecture structural of eightBitFA_TB is
component eightBit_FullAdder
port(a,b : IN STD_LOGIC_VECTOR (7 downto 0);
	s: OUT STD_LOGIC_VECTOR (7 downto 0);
	c_in: IN STD_LOGIC;
	c_out: OUT STD_LOGIC);
end component;
signal a_tb, b_tb, s_tb: STD_LOGIC_VECTOR (7 downto 0);
signal c_in_tb, c_out_tb: STD_LOGIC;
begin
DUT3: eightBit_FullAdder port map (a=> a_tb, b=> b_tb, s=>s_tb, c_in=> c_in_tb, c_out=> c_out_tb);
a_tb <= "00000000", "00000001" after 10 ns, "10001000" after 20 ns, "11000100" after 30 ns, "00000000" after 40 ns;
b_tb <= "00000000", "00000000" after 10 ns, "11001000" after 20 ns, "10000001" after 30 ns, "00000000" after 40 ns;
c_in_tb <= '0', '0' after 10 ns, '0' after 20 ns, '0' after 30 ns, '0' after 40 ns;
end structural;

