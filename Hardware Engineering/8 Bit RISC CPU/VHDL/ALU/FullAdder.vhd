library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


ENTITY full_adder_enabler IS 
PORT (a,b,c_in, enabler: IN STD_LOGIC;
	c_out, output: OUT STD_LOGIC);
END full_adder_enabler;

ARCHITECTURE structural OF full_adder_enabler is
SIGNAL c_first, s_a, c_second, result: STD_LOGIC;

COMPONENT half_adder_enabler IS
PORT (a,b, enabler: IN STD_LOGIC;
	s,c: OUT STD_LOGIC);
END COMPONENT;

COMPONENT orgate IS
PORT (c_first,c_second: IN STD_LOGIC;
	c_out: OUT STD_LOGIC);
END COMPONENT;

COMPONENT andGate IS 
PORT (c_first,c_second: IN STD_LOGIC;
	c_out: OUT STD_LOGIC);
END COMPONENT;

BEGIN
U100: half_adder_enabler PORT MAP(a=>a,b=>b,enabler=>enabler,c=>c_first,s=>s_a);
U101: half_adder_enabler PORT MAP(a=>s_a,b=>c_in,c=>c_second,s=>result,enabler=>enabler);
U102: orgate PORT MAP(c_first=>c_first,c_second=>c_second,c_out=>c_out);
U103: andGate PORT MAP (c_first => result, c_second=> enabler, c_out=> output);
END structural;
