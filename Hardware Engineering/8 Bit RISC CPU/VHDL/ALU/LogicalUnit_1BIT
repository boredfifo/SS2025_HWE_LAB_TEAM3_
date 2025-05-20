library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


ENTITY LogicalUnit_1bit IS
PORT(A, B: IN STD_LOGIC;
	F_00, F_01, F_10: IN STD_LOGIC;
	OUT_BNOT, OUT_AND, OUT_OR: OUT STD_LOGIC);
END LogicalUnit_1bit;

ARCHITECTURE behavioural OF LogicalUnit_1bit IS
SIGNAL ab, aORb, invB: STD_LOGIC;
BEGIN
ab <= A AND B;
aORb <= A OR B;
invB <= NOT B;

OUT_AND <= ab AND F_00;
OUT_OR <= aORb AND F_01;
OUT_BNOT <= invB AND F_10;




END behavioural;
