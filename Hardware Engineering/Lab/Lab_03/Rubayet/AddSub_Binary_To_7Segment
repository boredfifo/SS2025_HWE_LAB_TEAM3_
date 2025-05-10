ENTITY ADDSUB_BINARYTO7SEGMENT IS
PORT(firstBinary, secondBinary: IN BIT_VECTOR(3 downto 0);
	decider: IN BIT;
	sevenSegment_0, sevenSegment_1: OUT BIT_VECTOR(6 downto 0)
	);
END ADDSUB_BINARYTO7SEGMENT;

ARCHITECTURE structural OF ADDSUB_BINARYTO7SEGMENT IS
SIGNAL resultFrom4BitAdder, BCD_To_Seven_Segment_0, BCD_To_Seven_Segment_1: BIT_VECTOR(3 downto 0);
SIGNAL carryFrom4BitAdder: BIT;
SIGNAL resultFrom5BitAdder: BIT_VECTOR(4 downto 0);

COMPONENT additionANDsubtractor IS 
    PORT (
        a, b     : IN BIT_VECTOR(3 DOWNTO 0);
        c_in     : IN BIT;
        c_out    : OUT BIT;
        s        : OUT BIT_VECTOR(3 DOWNTO 0)
    );
END COMPONENT;

COMPONENT RCA_5bit IS 
    PORT (
        a, b     : IN BIT_VECTOR(4 DOWNTO 0);
        c_in     : IN BIT;
        c_out    : OUT BIT;
        s        : OUT BIT_VECTOR(4 DOWNTO 0)
    );
END COMPONENT;

COMPONENT binaryTObcd_5bit IS
    PORT (
        binaryNumber : IN BIT_VECTOR(4 downto 0); 
        BCD_1        : OUT BIT_VECTOR(3 downto 0); 
        BCD_0        : OUT BIT_VECTOR(3 downto 0)
    );
END COMPONENT;

COMPONENT bcdTOSevensegment IS
PORT(BCD_input:IN BIT_VECTOR(3 downto 0);
	SEVEN_SEGMENT_OUTPUT: OUT BIT_VECTOR(6 downto 0));
END COMPONENT;

BEGIN

U31: additionANDsubtractor PORT MAP(a=>firstBinary,b=>secondBinary,c_in=>decider,c_out=>carryFrom4BitAdder,s=>resultFrom4BitAdder);
U32: RCA_5bit PORT MAP(a(0)=>'0',a(1)=>'0',a(2)=>'0',a(3)=>'0',a(4)=>carryFrom4BitAdder,
			b(0)=>resultFrom4BitAdder(0),b(1)=>resultFrom4BitAdder(1),b(2)=>resultFrom4BitAdder(2),b(3)=>resultFrom4BitAdder(3),b(4)=>'0',
			c_in=> '0', c_out=> OPEN, s=>resultFrom5BitAdder);
U33: binaryTObcd_5bit PORT MAP(binaryNumber=>resultFrom5BitAdder, BCD_0 => BCD_To_Seven_Segment_0,BCD_1 => BCD_To_Seven_Segment_1 );
U34: bcdTOSevensegment PORT MAP(BCD_input => BCD_To_Seven_Segment_0,SEVEN_SEGMENT_OUTPUT => sevenSegment_0);
U35: bcdTOSevensegment PORT MAP(BCD_input => BCD_To_Seven_Segment_1,SEVEN_SEGMENT_OUTPUT => sevenSegment_1);


END structural;
