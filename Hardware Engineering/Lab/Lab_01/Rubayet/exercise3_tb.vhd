ENTITY RCA_4bit_tb IS 

END RCA_4bit_tb;


ARCHITECTURE structural OF RCA_4bit_tb is
COMPONENT RCA_4bit IS 
    PORT (
        a, b     : IN BIT_VECTOR(3 DOWNTO 0);
        c_in     : IN BIT;
        c_out    : OUT BIT;
        s        : OUT BIT_VECTOR(3 DOWNTO 0)
    );
END COMPONENT;

SIGNAL a_tb,b_tb,s_tb: BIT_VECTOR(3 DOWNTO 0);
SIGNAL c_in_tb,c_out_tb: BIT;

BEGIN
DUT3: RCA_4bit PORT MAP(a => a_tb, b => b_tb, c_in=>c_in_tb, c_out=>c_out_tb,s=>s_tb);
a_tb <= "0000", "0001" after 10 NS,"1111" after 20 NS,"1010" after 30 NS,"0000" after 40 NS;
b_tb <= "0000", "0001" after 10 NS,"0001" after 20 NS,"0101" after 30 NS,"0000" after 40 NS;
c_in_tb <= '0','0' after 10 NS,'0' after 20 NS,'1' after 30 NS,'0' after 40 NS;

END structural;