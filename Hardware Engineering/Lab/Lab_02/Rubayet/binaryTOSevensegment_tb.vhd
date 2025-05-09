ENTITY bcdTOSevensegment_tb IS
END bcdTOSevensegment_tb;

ARCHITECTURE behavioural OF bcdTOSevensegment_tb IS
SIGNAL	BCD_input_tb: BIT_VECTOR(3 downto 0);
SIGNAL SEVEN_SEGMENT_OUTPUT_tb: BIT_VECTOR(6 downto 0);

COMPONENT bcdTOSevensegment IS
PORT(BCD_input:IN BIT_VECTOR(3 downto 0);
	SEVEN_SEGMENT_OUTPUT: OUT BIT_VECTOR(6 downto 0));
END COMPONENT;
BEGIN

DUT8: bcdTOSevensegment PORT MAP(BCD_input=>BCD_input_tb, SEVEN_SEGMENT_OUTPUT=>SEVEN_SEGMENT_OUTPUT_tb);

BCD_input_tb <= "0000","0001" after 10 NS, "1111" after 20 NS;
END behavioural;

