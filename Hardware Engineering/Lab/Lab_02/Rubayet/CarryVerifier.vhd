ENTITY BCD_Verifier IS
PORT(BCD_INPUT: IN BIT_VECTOR(3 downto 0);
	BCD_check: OUT BIT
);
END BCD_Verifier;
ARCHITECTURE behavioural of BCD_Verifier IS
BEGIN
with BCD_INPUT select
	BCD_check <= '1' when "1010",
		'1' when "1011",
		'1' when "1100",
		'1' when "1101",
		'1' when "1110",
		'1' when "1111",
		'0' when OTHERS;
END behavioural;
