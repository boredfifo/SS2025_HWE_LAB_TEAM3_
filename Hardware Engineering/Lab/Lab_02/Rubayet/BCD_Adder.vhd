ENTITY BCD_Adder IS
PORT(first_binary, second_binary: IN BIT_VECTOR(3 downto 0);
	seven_segment_0, seven_segment_1: OUT BIT_VECTOR(6 downto 0)
);
END BCD_Adder;

ARCHITECTURE behavioural of BCD_Adder IS

COMPONENT binaryTObcd IS
PORT(binaryNumber: IN BIT_VECTOR(3 downto 0);
	BCD_1,BCD_0: OUT BIT_VECTOR(3 downto 0)	);
END COMPONENT;

COMPONENT RCA_4bit IS 
    PORT (
        a, b     : IN BIT_VECTOR(3 DOWNTO 0);
        c_in     : IN BIT;
        c_out    : OUT BIT;
        s        : OUT BIT_VECTOR(3 DOWNTO 0)
    );
END COMPONENT;

COMPONENT BCD_Verifier IS
PORT(BCD_INPUT: IN BIT_VECTOR(3 downto 0);
	BCD_check: OUT BIT
);
END COMPONENT;

COMPONENT AddingSixOrZero IS
PORT(checkingBIT: IN BIT;
	SixOrZero: OUT BIT_VECTOR(3 downto 0));
END COMPONENT;


COMPONENT bcdTOSevensegment IS
PORT(BCD_input:IN BIT_VECTOR(3 downto 0);
	SEVEN_SEGMENT_OUTPUT: OUT BIT_VECTOR(6 downto 0));
END COMPONENT;

SIGNAL BCD_0_0, BCD_0_1,BCD_0_2,BCD_0_3, 
	BCD_1_0,BCD_1_1, BCD_1_2, BCD_1_3,	BCD_2_0, BCD_2_1,BCD_2_2,BCD_2_3, 
	BCD_3_0,BCD_3_1, BCD_3_2, BCD_3_3, 
	firstBITcheck, ultimate_carry_out: BIT;
SIGNAL BCD_TO_Seven_0, BCD_TO_Seven_1, first_BCD_additon, second_BCD_addition, BCD_addition, polishedBCD_0,polishedBCD_1: BIT_VECTOR (3 downto 0);
BEGIN
U13: binaryTObcd PORT MAP(binaryNumber(0)=>first_binary(0),
			binaryNumber(1)=>first_binary(1), 
			binaryNumber(2)=>first_binary(2),
			binaryNumber(3)=>first_binary(3),
			BCD_1(0)=>BCD_1_0,
			BCD_1(1)=>BCD_1_1,
			BCD_1(2)=>BCD_1_2,
			BCD_1(3)=>BCD_1_3,
			BCD_0(0)=>BCD_0_0,
			BCD_0(1)=>BCD_0_1,
			BCD_0(2)=>BCD_0_2,
			BCD_0(3)=>BCD_0_3);
U14: binaryTObcd PORT MAP(binaryNumber(0)=>second_binary(0),
			binaryNumber(1)=>second_binary(1), 
			binaryNumber(2)=>second_binary(2),
			binaryNumber(3)=>second_binary(3),
			BCD_1(0)=>BCD_3_0,
			BCD_1(1)=>BCD_3_1,
			BCD_1(2)=>BCD_3_2,
			BCD_1(3)=>BCD_3_3,
			BCD_0(0)=>BCD_2_0,
			BCD_0(1)=>BCD_2_1,
			BCD_0(2)=>BCD_2_2,
			BCD_0(3)=>BCD_2_3);

U15: RCA_4bit PORT MAP(a(0)=>BCD_0_0,a(1)=>BCD_0_1,a(2)=>BCD_0_2,a(3)=>BCD_0_3,
			b(0)=>BCD_2_0,b(1)=>BCD_2_1,b(2)=>BCD_2_2,b(3)=>BCD_2_3,
			c_out=>OPEN,s=>first_BCD_additon, c_in => '0'
			
	);
U16: RCA_4bit PORT MAP(a(0)=>BCD_1_0,a(1)=>BCD_1_1,a(2)=>BCD_1_2,a(3)=>BCD_1_3,
			b(0)=>BCD_3_0,b(1)=>BCD_3_1,b(2)=>BCD_3_2,b(3)=>BCD_3_3,
			c_out=>OPEN,s=> second_BCD_addition, c_in => '0'
			
	);

U17: BCD_Verifier PORT MAP(BCD_INPUT=>first_BCD_additon, BCD_check=> firstBITcheck);


U18: AddingSixOrZero PORT MAP(checkingBIT => firstBITcheck, SixOrZero=> BCD_addition);

U19: RCA_4bit PORT MAP(a => BCD_addition,
			b=>first_BCD_additon,
			c_out=>ultimate_carry_out,s=>polishedBCD_0, c_in =>'0'
			
	);


U20: RCA_4bit PORT MAP(a => second_BCD_addition,
			b=>"0000",
			c_out=>OPEN,s=>polishedBCD_1, c_in =>ultimate_carry_out
			
	);

U21: bcdTOSevensegment PORT MAP(BCD_input=>polishedBCD_0,SEVEN_SEGMENT_OUTPUT=>seven_segment_0);

U22: bcdTOSevensegment PORT MAP(BCD_input=>polishedBCD_1,SEVEN_SEGMENT_OUTPUT=>seven_segment_1 );



END behavioural;


