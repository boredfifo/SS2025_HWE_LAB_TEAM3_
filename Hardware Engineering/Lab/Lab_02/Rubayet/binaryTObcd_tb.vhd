ENTITY binaryTObcd_tb IS
END binaryTObcd_tb;

ARCHITECTURE behavioural of binaryTObcd_tb IS

COMPONENT binaryTObcd IS
PORT(binaryNumber: IN BIT_VECTOR(3 downto 0);
	BCD_1,BCD_0: OUT BIT_VECTOR(3 downto 0)	);
END COMPONENT;

SIGNAL binary_input_tb, BCD_0_out_tb, BCD_1_out_tb: BIT_VECTOR(3 downto 0);
BEGIN
DUT7: binaryTObcd port map (binaryNumber => binary_input_tb, BCD_1 => BCD_1_out_tb, BCD_0 => BCD_0_out_tb);
binary_input_tb <= "0000", "1001" after 10 NS, "1010" after 20 NS, "1111" after 30 NS, "0110" after 40 NS, "0000" after 50NS;

end behavioural;