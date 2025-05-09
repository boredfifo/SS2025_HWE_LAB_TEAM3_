ENTITY binaryTObcd IS
PORT(binaryNumber: IN BIT_VECTOR(3 downto 0);
	BCD_1,BCD_0: OUT BIT_VECTOR(3 downto 0)	);
END binaryTObcd;

ARCHITECTURE behavioural of binaryTObcd IS
BEGIN
with binaryNumber select
	BCD_0 <= "0000" when "0000", 
		"0001" when "0001", 
		"0010" when "0010", 
		"0011" when "0011",
		"0100" when "0100",
		"0101" when "0101",
		"0110" when "0110",
		"0111" when "0111",
		"1000" when "1000",
		"1001" when "1001",
		"0000" when "1010",
		"0001" when "1011",
		"0010" when "1100",
		"0011" when "1101",
		"0100" when "1110",
		"0101" when "1111";
with binaryNumber select 
	BCD_1 <= "0000" when "0000", 
		"0000" when "0001", 
		"0000" when "0010", 
		"0000" when "0011",
		"0000" when "0100",
		"0000" when "0101",
		"0000" when "0110",
		"0000" when "0111",
		"0000" when "1000",
		"0000" when "1001",
		"0001" when "1010",
		"0001" when "1011",
		"0001" when "1100",
		"0001" when "1101",
		"0001" when "1110",
		"0001" when "1111";

END behavioural;