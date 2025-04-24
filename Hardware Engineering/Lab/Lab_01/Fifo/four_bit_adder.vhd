entity four_bit_adder is 
	port(a1, a2, a3, a4, b1, b2, b3, b4: IN BIT;
	s1, s2, s3, s4, c_o: OUT BIT);
end four_bit_adder;

architecture structural of four_bit_adder is
component full_adder
	port(a,b,c_in : IN BIT;
	c_out, s: OUT BIT);
end component;
signal x,y,z : BIT;
signal gnd: BIT := '0';

begin
	U4: full_adder port map(a=>a1, b=>b1, c_in=>gnd , c_out=>x, s=>s1);
	U5: full_adder port map(a=>a2, b=>b2, c_in=>x , c_out=>y, s=>s2);
	U6: full_adder port map(a=>a3, b=>b3, c_in=>y , c_out=>z, s=>s3);
	U7: full_adder port map(a=>a4, b=>b4, c_in=>z , c_out=>c_o, s=>s4);

end structural;
