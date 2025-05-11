ENTITY ClockedSevenSegment IS
PORT(binary_0, binary_1: IN BIT_VECTOR(3 downto 0);
	additionOrSubtraction: IN BIT;
	finalOut: OUT BIT_VECTOR(7 downto 0);
	clock: IN BIT;
	finalAnodes: OUT BIT_VECTOR(7 downto 0));
END ClockedSevenSegment;

ARCHITECTURE structural OF ClockedSevenSegment IS
SIGNAL FPGASevenSegment_0, FPGASevenSegment_1: BIT_VECTOR(6 downto 0);


COMPONENT ADDSUB_BINARYTO7SEGMENT IS
PORT(firstBinary, secondBinary: IN BIT_VECTOR(3 downto 0);
	decider: IN BIT;
	sevenSegment_0, sevenSegment_1: OUT BIT_VECTOR(6 downto 0)
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
U40: ADDSUB_BINARYTO7SEGMENT PORT MAP(firstBinary=>binary_0,secondBinary=>binary_1,
		decider=>additionOrSubtraction, sevenSegment_0 =>FPGASevenSegment_0, sevenSegment_1 => FPGASevenSegment_1);
U41: SevenSegmentController PORT MAP(clk =>clock, cathodeController_0 => FPGASevenSegment_0, cathodeController_1 => FPGASevenSegment_1,
					display=> finalOut,  anodes=> finalAnodes );
END structural;
