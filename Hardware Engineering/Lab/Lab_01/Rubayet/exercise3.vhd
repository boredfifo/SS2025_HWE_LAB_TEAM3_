ENTITY RCA_4bit IS 
    PORT (
        a, b     : IN BIT_VECTOR(3 DOWNTO 0);
        c_in     : IN BIT;
        c_out    : OUT BIT;
        s        : OUT BIT_VECTOR(3 DOWNTO 0)
    );
END RCA_4bit;

ARCHITECTURE structural OF RCA_4bit is
COMPONENT full_adder
PORT (a,b,c_in: IN BIT;
	c_out,s: OUT BIT);
END COMPONENT;
SIGNAL c_first, c_second,c_third: BIT;
BEGIN
U4: full_adder PORT MAP(a=>a(0),b=>b(0),c_in=>c_in,s=>s(0),c_out=>c_first);
U5: full_adder PORT MAP(a=>a(1),b=>b(1),c_in=>c_first,s=>s(1),c_out=>c_second);
U6: full_adder PORT MAP(a=>a(2),b=>b(2),c_in=>c_second,s=>s(2),c_out=>c_third);
U7: full_adder PORT MAP(a=>a(3),b=>b(3),c_in=>c_third,s=>s(3),c_out=>c_out);
END structural;