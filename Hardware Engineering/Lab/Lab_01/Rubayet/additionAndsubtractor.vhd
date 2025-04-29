ENTITY additionANDsubtractor IS 
    PORT (
        a, b     : IN BIT_VECTOR(3 DOWNTO 0);
        c_in     : IN BIT;
        c_out    : OUT BIT;
        s        : OUT BIT_VECTOR(3 DOWNTO 0)
    );
END additionANDsubtractor;

ARCHITECTURE behavioural OF additionANDsubtractor IS
    SIGNAL bXOR : BIT_VECTOR(3 DOWNTO 0);

    COMPONENT RCA_4bit IS 
        PORT (
            a, b     : IN BIT_VECTOR(3 DOWNTO 0);
            c_in     : IN BIT; 
            c_out    : OUT BIT;
            s        : OUT BIT_VECTOR(3 DOWNTO 0)
        );
    END COMPONENT;
COMPONENT xorGate IS
PORT(b: IN BIT_VECTOR(3 downto 0);
	c_in: IN BIT;
	b_signal: OUT BIT_VECTOR(3 downto 0));
END COMPONENT;
    BEGIN
	U11: xorGate PORT MAP(b=>b, c_in=>c_in, b_signal=>bXOR);
   	U12: RCA_4bit PORT MAP(a=>a,b=> bXOR,c_in=>c_in,c_out =>c_out,s=> s);
END behavioural;
