library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


ENTITY orgate IS 
PORT (c_first,c_second: IN STD_LOGIC;
	c_out: OUT STD_LOGIC);
END orgate;


ARCHITECTURE behavioural of orgate IS
BEGIN
c_out <= c_first or c_second;
END behavioural;
