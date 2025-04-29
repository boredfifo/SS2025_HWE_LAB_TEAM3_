entity xorGate IS
PORT(b: IN BIT_VECTOR(3 downto 0);
	c_in: IN BIT;
	b_signal: OUT BIT_VECTOR(3 downto 0));
END xorGate;

ARCHITECTURE behavioural of xorGate IS
BEGIN
b_signal(0) <=  c_in xor b(0);
b_signal(1) <=  c_in xor b(1);
b_signal(2)<=  c_in xor b(2);
b_signal(3) <=  c_in xor b(3);
END behavioural;