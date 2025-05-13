library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity eightBit_FullAdder is
port(a,b : IN STD_LOGIC_VECTOR (7 downto 0);
	s: OUT STD_LOGIC_VECTOR (7 downto 0);
	c_in: IN STD_LOGIC;
	c_out: OUT STD_LOGIC);
end eightBit_FullAdder;

architecture structural of eightBit_FullAdder is
component full_adder is
	port(a,b,c_in : IN STD_LOGIC;
	c_out, s: OUT STD_LOGIC);
end component;
signal s0, s1, s2, s3, s4, s5, s6: STD_LOGIC;
begin
UT8: full_adder port map (a=> a(0), b=> b(0), c_in => c_in, s=>s(0), c_out => s0);
UT9: full_adder port map (a=> a(1), b=> b(1), c_in =>s0, s=>s(1), c_out => s1);
UT10: full_adder port map (a=> a(2), b=> b(2), c_in => s1, s=>s(2), c_out => s2);
UT11: full_adder port map (a=> a(3), b=> b(3), c_in => s2, s=>s(3), c_out => s3);
UT12: full_adder port map (a=> a(4), b=> b(4), c_in => s3, s=>s(4), c_out => s4);
UT13: full_adder port map (a=> a(5), b=> b(5), c_in => s4, s=>s(5), c_out => s5);
UT14: full_adder port map (a=> a(6), b=> b(6), c_in => s5, s=>s(6), c_out => s6);
UT15: full_adder port map (a=> a(7), b=> b(7), c_in => s6, s=>s(7), c_out => c_out);

end structural;
