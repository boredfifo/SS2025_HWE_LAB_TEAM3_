entity full_adder_tb is 
end full_adder_tb;

architecture structural of full_adder_tb is
component fulladder

      port(a,b,c_in : IN BIT;
           s, c_out : OUT BIT);

end component;

signal a_tb,  b_tb, c_in_tb, s_tb, C_out_tb: BIT;
begin

     DUT2: fulladder port map(a => a_tb, b => b_tb, c_in => c_in_tb, s => s_tb, c_out => c_out_tb);
        a_tb <= '0' after 10 ns , '0' after 20 ns, '0' after 30 ns ,'0' after 40 ns , '1' after 50 ns, '1' after 60 ns, '1' after 70 ns, '1' after 80 ns;
	b_tb <= '0' after 10 ns , '0' after 20 ns, '1' after 30 ns ,'1' after 40 ns , '0' after 50 ns, '0' after 60 ns, '1' after 70 ns, '1' after 80 ns;
	c_in_tb <= '0' after 10 ns , '1' after 20 ns, '0' after 30 ns ,'1' after 40 ns , '0' after 50 ns, '1' after 60 ns, '0' after 70 ns, '1' after 80 ns;

end structural;
