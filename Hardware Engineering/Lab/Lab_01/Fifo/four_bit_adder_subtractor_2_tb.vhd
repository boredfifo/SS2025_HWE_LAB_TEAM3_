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
DUT5: four_bit_adder_subtractor port map (a(0) => a_tb(0),a(1) => a_tb(1), a(2) => a_tb(2) ,a(3) => a_tb(3), b(0) => b_tb(0),
b(1) => b_tb(1),b(2) => b_tb(2),b(3) => b_tb(3), S(0) => s_tb(0),S(1) => s_tb(1),S(2) => s_tb(2),S(3) => s_tb(3), K => k_tb, C_OUT => c_out_tb);

k_tb <= '0', '1' after 10 ns, '0' after 20 ns;
a_tb(0) <= '0', '1' after 10 ns, '1' after 20 ns;
a_tb(1) <= '0', '0' after 10 ns, '1' after 20 ns;
a_tb(2) <= '0', '1' after 10 ns, '0' after 20 ns;
a_tb(3) <= '0', '0' after 10 ns, '1' after 20 ns;
b_tb(0) <= '0', '1' after 10 ns, '1' after 20 ns;
b_tb(1) <= '0', '1' after 10 ns, '1' after 20 ns;
b_tb(2) <= '0', '0' after 10 ns, '0' after 20 ns;
b_tb(3) <= '0', '1' after 10 ns, '0' after 20 ns;


end structural;
