library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

ENTITY half_adder_enabler IS
PORT (a,b, enabler: IN STD_LOGIC;
	s,c: OUT STD_LOGIC);
END half_adder_enabler;

ARCHITECTURE behavioural of half_adder_enabler IS
BEGIN
s <= a XOR b;
c <=  a AND b AND enabler;
END behavioural;
