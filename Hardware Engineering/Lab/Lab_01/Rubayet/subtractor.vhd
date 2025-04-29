ENTITY subtractor IS 
    PORT (
        a, b     : IN BIT_VECTOR(3 DOWNTO 0);
        c_in     : IN BIT;
        c_out    : OUT BIT;
        s        : OUT BIT_VECTOR(3 DOWNTO 0)
    );
END subtractor;

ARCHITECTURE behavioural OF subtractor IS
    SIGNAL b_inverted : BIT_VECTOR(3 DOWNTO 0);

    COMPONENT RCA_4bit IS 
        PORT (
            a, b     : IN BIT_VECTOR(3 DOWNTO 0);
            c_in     : IN BIT; 
            c_out    : OUT BIT;
            s        : OUT BIT_VECTOR(3 DOWNTO 0)
        );
    END COMPONENT;

    COMPONENT notGate IS
        PORT (
            a        : IN BIT_VECTOR(3 DOWNTO 0);
            b : OUT BIT_VECTOR(3 DOWNTO 0)
        );
    END COMPONENT;

BEGIN
	U8: notGate PORT MAP(a=>b, b=>b_inverted);
    	U9: RCA_4bit PORT MAP(a=> a,b=> b_inverted,c_in=> c_in,c_out=>c_out,s=> s);

END behavioural;

