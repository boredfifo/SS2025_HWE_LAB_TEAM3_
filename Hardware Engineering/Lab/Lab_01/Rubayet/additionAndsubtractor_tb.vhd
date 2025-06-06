ENTITY additionANDsubtractor_tb IS 

END additionANDsubtractor_tb;

ARCHITECTURE behavioural OF additionANDsubtractor_tb IS
    	SIGNAL a_tb, b_tb, s_tb : BIT_VECTOR(3 DOWNTO 0);
	SIGNAL c_in_tb, c_out_tb: BIT;

COMPONENT additionANDsubtractor IS 
    PORT (
        a, b     : IN BIT_VECTOR(3 DOWNTO 0);
        c_in     : IN BIT;
        c_out    : OUT BIT;
        s        : OUT BIT_VECTOR(3 DOWNTO 0)
    );
END COMPONENT;
BEGIN
	DUT6: additionANDsubtractor PORT MAP(a=>a_tb,b=>b_tb,s=>s_tb,c_in=>c_in_tb,c_out=>c_out_tb);
	c_in_tb <= '0','1' after 50 NS;
	a_tb <= "0000", "0001" after 10 NS,"1111" after 20 NS,"1010" after 30 NS,"0000" after 40 NS, "0000" after 50 NS, "0001" after 60 NS,"1111" after 70 NS,"1010" after 80 NS,"0000" after 90 NS;
	b_tb <= "0000", "0001" after 10 NS,"0001" after 20 NS,"0101" after 30 NS,"0000" after 40 NS, "0000" after 50 NS, "0001" after 60 NS,"0001" after 70 NS,"0101" after 80 NS,"0000" after 90 NS;
END behavioural;
