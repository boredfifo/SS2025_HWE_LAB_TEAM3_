ENTITY ALU_INPUTS IS 
PORT(A, B, ENA, ENB, INVA: IN BIT;
	EnabledB, OutputA: OUT BIT);
END ALU_INPUTS;

ARCHITECTURE behavioural OF ALU_INPUTS IS

Signal EnabledA: BIT;

BEGIN
EnabledB <= B AND ENB;
EnabledA <= A AND ENA;
OutputA <= EnabledA XOR INVA;

END behavioural;
