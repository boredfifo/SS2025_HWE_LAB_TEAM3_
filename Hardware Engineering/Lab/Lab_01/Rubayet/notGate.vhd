ENTITY notGate IS
PORT(a: IN BIT;
	b: OUT BIT);
END notGate;

ARCHITECTURE behavioural of notGate IS
BEGIN
b <= NOT a;
END behavioural;
