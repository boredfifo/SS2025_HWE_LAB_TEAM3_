ENTITY ALU_TOP_LEVEL IS
PORT(F0, F1, B, EN_B, A, EN_A, INV_A, CarryIn: IN BIT;
	clk : IN BIT; 
    anodes : OUT BIT_VECTOR(7 DOWNTO 0);
    display : OUT BIT_VECTOR(7 DOWNTO 0) );
END ALU_TOP_LEVEL;



ARCHITECTURE structural OF ALU_TOP_LEVEL IS
	SIGNAL OutputTo7SS, CarryOutTo7SS : BIT;
    SIGNAL seg_output, seg_carry : BIT_VECTOR(6 DOWNTO 0);

COMPONENT ALU_1BIT IS
PORT(F0, F1, B, EN_B, A, EN_A, INV_A, CarryIn: IN BIT;
	Output, CarryOut: OUT BIT);
END COMPONENT;

COMPONENT bit_to_7seg IS
    PORT(
        bit_input : IN BIT;
        seg : OUT BIT_VECTOR(6 DOWNTO 0)
    );
END COMPONENT;

COMPONENT SevenSegmentController IS
PORT (
    clk : IN BIT;
    cathodeController_0, cathodeController_1 : IN BIT_VECTOR(6 DOWNTO 0); 
    anodes : OUT BIT_VECTOR(7 DOWNTO 0);
    display : OUT BIT_VECTOR(7 DOWNTO 0) 
);
END COMPONENT;

BEGIN
U120: ALU_1BIT PORT MAP(F0=>F0,F1=>F1,B=>B,EN_B=>EN_B,A=>A,EN_A=>EN_A,INV_A=>INV_A,CarryIn=>CarryIn,
			Output=> OutputTo7SS, CarryOut=> CarryOutTo7SS);

U121: bit_to_7seg PORT MAP(bit_input=>CarryOutTo7SS, seg=>seg_carry);
U122: bit_to_7seg PORT MAP(bit_input=>OutputTo7SS, seg=>seg_output);
U123: SevenSegmentController PORT MAP(clk=>clk, cathodeController_0=>seg_output,cathodeController_1=>seg_carry,
					anodes=>anodes, display =>display);

END structural;

