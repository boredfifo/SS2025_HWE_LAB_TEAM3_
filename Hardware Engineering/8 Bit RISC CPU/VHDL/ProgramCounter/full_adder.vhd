library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity full_adder is
	port(a,b,c_in : IN STD_LOGIC;
	c_out, s: OUT STD_LOGIC);
end full_adder;

architecture structural of full_adder is
component half_adder
	port(a, b : in STD_LOGIC;
		s,c: out STD_LOGIC);
end component;

signal s_1, s_2, s_3: STD_LOGIC;
begin
	U1: half_adder port map(a => a,
				b => b,
				c => s_1,
				s => s_2);

	U2: half_adder port map(a => s_2,
				b => c_in,
				c => s_3,
				s => s);

	c_out <= s_1 or s_3;
end structural;
