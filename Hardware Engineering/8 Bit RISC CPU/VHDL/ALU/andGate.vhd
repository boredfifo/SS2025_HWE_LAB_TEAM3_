library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

ENTITY andGate IS 
PORT (c_first,c_second: IN STD_LOGIC;
	c_out: OUT STD_LOGIC);
END andGate;


ARCHITECTURE behavioural of andGate IS
BEGIN
c_out <= c_first AND c_second;
END behavioural;
