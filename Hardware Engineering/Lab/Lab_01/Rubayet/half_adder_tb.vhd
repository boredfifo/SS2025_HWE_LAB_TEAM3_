ENTITY half_adder_tb IS
END half_adder_tb;

ARCHITECTURE behavioural of half_adder_tb IS
COMPONENT half_adder
PORT(a,b: IN BIT; c,s: OUT BIT);
END COMPONENT;

signal a_tb, b_tb, c_tb, s_tb: bit;


BEGIN
DUT1: half_adder port map (a=>a_tb,
				b=>b_tb,c=>c_tb,s=>s_tb);
a_tb <= '0','1' after 10 NS,'0' after 20 NS,'1' after 30 NS,'0' after 40 NS;
b_tb <= '0','1' after 10 NS,'1' after 20 NS,'0' after 30 NS,'0' after 40 NS;

END behavioural;
