entity four_bit_adder_subtractor is
	port(a: IN BIT_VECTOR (3 downto 0);
	  b: IN BIT_VECTOR (3 downto 0);
	S: OUT BIT_VECTOR (3 downto 0);
	K: IN BIT;
	C_OUT: OUT BIT);
end four_bit_adder_subtractor;

architecture structural of four_bit_adder_subtractor is
component full_adder
	port(a,b,c_in : IN BIT;
	c_out, s: OUT BIT);
end component;

signal c1,c2,c3: BIT;
signal b_xor_k : BIT_VECTOR  (3 downto 0);
begin
b_xor_k(0) <= b(0) xor k;
b_xor_k(1) <= b(1) xor k;
b_xor_k(2) <= b(2) xor k;
b_xor_k(3) <= b(3) xor k;

U1: full_adder port map (a => a(0),
			b => b_xor_k(0),
			s => S(0),
			c_in => k,
			c_out => c1);
U2: full_adder port map  (a => a(1),
			b => b_xor_k(1),
			s => S(1),
			c_in => c1,
			c_out => c2);
U3: full_adder port map  (a => a(2),
			b => b_xor_k(2),
			s => S(2),
			c_in => c2,
			c_out => c3);
U4: full_adder port map  (a => a(3),
			b => b_xor_k(3),
			s => S(3),
			c_in => c3,
			c_out => C_OUT);
end structural;