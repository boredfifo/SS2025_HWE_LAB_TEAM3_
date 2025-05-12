ENTITY ALU_8bit IS
PORT(F0, F1, CarryIn,EN_B, EN_A, INV_A: IN BIT;
	B, A: IN BIT_VECTOR(7 downto 0);
	Output : OUT BIT_VECTOR(7 downto 0);
	CarryOut: OUT BIT);
END ALU_8bit;

ARCHITECTURE structural of ALU_8bit IS

COMPONENT ALU_1BIT IS
PORT(F0, F1, B, EN_B, A, EN_A, INV_A, CarryIn: IN BIT;
	Output, CarryOut: OUT BIT);
END COMPONENT;
SIGNAL carry01, carry12, carry23, carry34, carry45, carry56, carry67: BIT;
BEGIN

U150: ALU_1BIT PORT MAP(F0=>F0, F1=>F1, EN_B=>EN_B, B=>B(0),A=>A(0),EN_A=>EN_A,INV_A=>INV_A,CarryIn=>CarryIn,Output=>Output(0),CarryOut =>carry01 );


U151: ALU_1BIT PORT MAP(F0=>F0, F1=>F1, EN_B=>EN_B, B=>B(1),A=>A(1),EN_A=>EN_A,INV_A=>INV_A,Output=>Output(1),CarryOut =>carry12 , CarryIn=>'0');


U152: ALU_1BIT PORT MAP(F0=>F0, F1=>F1, EN_B=>EN_B, B=>B(2),A=>A(2),EN_A=>EN_A,INV_A=>INV_A,Output=>Output(2),CarryOut =>carry23 , CarryIn=>'0');

U153: ALU_1BIT PORT MAP(F0=>F0, F1=>F1, EN_B=>EN_B, B=>B(3),A=>A(3),EN_A=>EN_A,INV_A=>INV_A,Output=>Output(3),CarryOut =>carry34, CarryIn=>'0' );


U154: ALU_1BIT PORT MAP(F0=>F0, F1=>F1, EN_B=>EN_B, B=>B(4),A=>A(4),EN_A=>EN_A,INV_A=>INV_A,Output=>Output(4),CarryOut =>carry45, CarryIn=>'0' );


U155: ALU_1BIT PORT MAP(F0=>F0, F1=>F1, EN_B=>EN_B, B=>B(5),A=>A(5),EN_A=>EN_A,INV_A=>INV_A,Output=>Output(5),CarryOut =>carry56, CarryIn=>'0' );


U156: ALU_1BIT PORT MAP(F0=>F0, F1=>F1, EN_B=>EN_B, B=>B(6),A=>A(6),EN_A=>EN_A,INV_A=>INV_A,Output=>Output(6),CarryOut =>carry67, CarryIn=>'0');


U157: ALU_1BIT PORT MAP(F0=>F0, F1=>F1, EN_B=>EN_B, B=>B(7),A=>A(7),EN_A=>EN_A,INV_A=>INV_A,Output=>Output(7),CarryOut =>CarryOut, CarryIn=>'0' );

END structural;