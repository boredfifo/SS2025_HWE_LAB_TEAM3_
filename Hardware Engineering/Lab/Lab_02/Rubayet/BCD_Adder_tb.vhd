ENTITY BCD_Adder_tb IS
END BCD_Adder_tb;
ARCHITECTURE behavioural of BCD_Adder_tb IS

COMPONENT BCD_Adder IS
PORT(first_binary, second_binary: IN BIT_VECTOR(3 downto 0);
	seven_segment_0, seven_segment_1: OUT BIT_VECTOR(6 downto 0)
);
END COMPONENT;


SIGNAL first_binary_tb, second_binary_tb: BIT_VECTOR(3 downto 0);
SIGNAL seven_segment_0_tb,seven_segment_1_tb : BIT_VECTOR(6 downto 0);
BEGIN

DUT9: BCD_Adder PORT MAP(first_binary=>first_binary_tb, second_binary => second_binary_tb, 
			seven_segment_0=>seven_segment_0_tb,seven_segment_1=>seven_segment_1_tb );


first_binary_tb <= "0000", "0000" after 10 NS, "0001" after 20 NS, "1000" after 30 NS, "0100" after 40 NS, "0101" after 50 NS, "0101" after 60 NS, "0000" after 70 NS;
second_binary_tb <= "0000", "0001" after 10 NS, "0000" after 20 NS , "0000" after 30 NS, "0100" after 40 NS,"0100" after 50 NS,"0101" after 60 NS, "0000" after 70 NS;
END behavioural;
