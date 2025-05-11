ENTITY half_adder_enabler IS
PORT (a,b, enabler: IN BIT;
	s,c: OUT BIT);
END half_adder_enabler;

ARCHITECTURE behavioural of half_adder_enabler IS
BEGIN
s <= a XOR b;
c <=  a AND b AND enabler;
END behavioural;
