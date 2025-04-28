ENTITY fullAdder is 
PORT (a,b,c : in bit;
	s, cOUT : out bit);
END ENTITY;

ARCHITECTURE behavioural of fullAdder is
signal S1,S2,S3: bit;
begin
s <= a xor b xor c;
S1 <= a and b;
S2<= a and c;
S3 <= b and c;
cOUT<= S1 or S2 or S3;
END behavioural;
