ENTITY full_adder_tb IS 
END full_adder_tb;

ARCHITECTURE structural OF full_adder_tb is


COMPONENT full_adder
PORT(a,b,c_in: IN BIT; c_out,s: OUT BIT);
END COMPONENT;
SIGNAl a_tb, b_tb, cin_tb,cout_tb,s_tb: BIT;
BEGIN
DUT2: full_adder PORT MAP (a => a_tb, b => b_tb, c_in=>cin_tb, c_out=>cout_tb,s=>s_tb);
a_tb <= '0' after 0 NS,'1' after 10 NS,'0' after 20 NS,'1' after 30 NS,'0' after 40 NS,'1' after 50 NS,'0' after 60 NS,'1' after 70 NS;
b_tb <= '0','0' after 10 NS,'1' after 20 NS,'1' after 30 NS,'0' after 40 NS,'0' after 50 NS,'1' after 60 NS,'1' after 70 NS;
cin_tb <= '0','0' after 10 NS,'0' after 20 NS,'0' after 30 NS,'1' after 40 NS,'1' after 50 NS,'1' after 60 NS,'1' after 70 NS;
END structural;
