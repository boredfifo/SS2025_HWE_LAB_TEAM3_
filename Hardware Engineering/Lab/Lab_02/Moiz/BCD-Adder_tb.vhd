entity bcd_adder_tb is 
end bcd_adder_tb;

architecture behavioral of bcd_adder_tb is
component bcd_adder 
port(bcd_a, bcd_b: IN BIT_VECTOR (3 downto 0);
	sum_a, sum_b: OUT BIT_VECTOR (3 downto 0));
end component;

signal bcd_a_tb, bcd_b_tb, sum_a_tb, sum_b_tb: BIT_VECTOR (3 downto 0);
begin
DUT2: bcd_adder port map (bcd_a => bcd_a_tb, bcd_b => bcd_b_tb, sum_a => sum_a_tb, sum_b=>sum_b_tb);
bcd_a_tb <= "0000", "0001" after 10 ns, "1111" after 20 ns, "1000" after 30 ns;
bcd_b_tb <= "0000", "0011" after 10 ns, "1111" after 20 ns, "0111" after 30 ns;
end behavioral;

