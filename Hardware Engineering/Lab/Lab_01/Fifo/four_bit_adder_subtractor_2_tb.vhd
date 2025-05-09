entity four_bit_adder_subtractor_tb is
end entity;

architecture structural of four_bit_adder_subtractor_tb is
component four_bit_adder_subtractor
port(a: IN BIT_VECTOR (3 downto 0);
	  b: IN BIT_VECTOR (3 downto 0);
	S: OUT BIT_VECTOR (3 downto 0);
	K: IN BIT;
	C_OUT: OUT BIT);
end component;
signal a_tb, b_tb, s_tb: BIT_VECTOR (3 downto 0);
signal k_tb, c_out_tb: BIT;

begin
DUT5: four_bit_adder_subtractor port map (a => a_tb, b => b_tb, S=> s_tb, K => k_tb, C_OUT => c_out_tb);

k_tb <=    '0', '1' after 10 ns, '0' after 20 ns, '1' after 30 ns;
a_tb <= "0000", "1011" after 10 ns, "1000" after 20 ns, "0111" after 30 ns;
b_tb <= "0000", "0011" after 10 ns, "0001" after 20 ns, "0111" after 30 ns;

end structural;
