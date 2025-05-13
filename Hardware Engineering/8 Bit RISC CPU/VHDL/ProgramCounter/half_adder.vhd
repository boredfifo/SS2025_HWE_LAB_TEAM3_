library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity half_adder is 
	port(a, b : IN STD_LOGIC; 
	s, c: OUT STD_LOGIC); 
end half_adder;


architecture structural of half_adder is 
begin
	c <= a and b; 
 	s <= a xor b;
end structural;
