entity half_adder_tb is
end half_adder_tb;

architecture structural of half_adder_tb is
component half_adder
	port(a , b: in bit;
	c, s: out bit);
end component;


signal a_tb, b_tb, c_tb, s_tb : bit;
begin

	DUT: half_adder port map (a => a_tb,
				b => b_tb,
				c => c_tb,
				s => s_tb);
        a_tb <= '0' after 10 ns ,'1' after 20 ns, '0' after 30 ns, '1'  after 40 ns;
        b_tb <= '0' after 10 ns,'0' after 20 ns, '1' after 30 ns, '1' after 40 ns;
end structural;
