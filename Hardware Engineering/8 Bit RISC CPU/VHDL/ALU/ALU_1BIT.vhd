ENTITY ALU_1BIT IS
PORT(F0, F1, B, EN_B, A, EN_A, INV_A, CarryIn: IN BIT;
	Output, CarryOut: OUT BIT);
END ALU_1BIT;

ARCHITECTURE structural OF ALU_1BIT IS
SIGNAL lineA, lineB, ORLine, AndLine, NotBLine, SumLine, output_NOTB, output_OR, output_AND, output_SUM: BIT;	

COMPONENT LogicalUnit_1bit IS
PORT(A, B: IN BIT;
	F_00, F_01, F_10: IN BIT;
	OUT_BNOT, OUT_AND, OUT_OR: OUT BIT);
END COMPONENT;

COMPONENT ALU_DECODER IS
PORT(F0, F1: IN BIT;
	F_00, F_01, F_10, F_11: OUT BIT);
END COMPONENT;

COMPONENT full_adder_enabler IS 
PORT (a,b,c_in, enabler: IN BIT;
	c_out, output: OUT BIT);
END COMPONENT;

COMPONENT ALU_INPUTS IS 
PORT(A, B, ENA, ENB, INVA: IN BIT;
	EnabledB, OutputA: OUT BIT);
END COMPONENT;

COMPONENT orgate_ALU IS 
PORT (c_first,c_second, c_third, c_fourth: IN BIT;
	c_out: OUT BIT);
END COMPONENT;

BEGIN

U105: ALU_INPUTS PORT MAP(A =>A,B=>B,ENA=>EN_A,ENB=>EN_B,INVA=>INV_A,EnabledB=>lineB, OutputA=>lineA);
U106: ALU_DECODER PORT MAP(F0 =>F0, F1=>F1, F_00=>AndLine,F_01=>ORLine,F_10=>NotBLine,F_11=>SumLine);
U107: LogicalUnit_1bit PORT MAP(A=>lineA, B=> lineB, F_00=>AndLine, F_01=>ORLine, F_10=>NotBLine, 
				OUT_BNOT=>output_NOTB, OUT_AND=>output_AND, OUT_OR=>output_OR);

U108: full_adder_enabler PORT MAP(a=>lineA,b=>lineB,c_in=>CarryIn,enabler=>SumLine, c_out=>CarryOut, output=>output_SUM );

U109: orgate_ALU PORT MAP(c_first=>output_AND, c_second=> output_OR, c_third=> output_NOTB, c_fourth=> output_SUM, c_out=>Output);

END structural;
