ENTITY ALU_8bit IS
PORT(OperandFromControlUnit_0, OperandFromControlUnit_1, CarryInEnabler_CU,EN_B, EN_A, INV_A: IN BIT;
	MemoryData, AccumulatorData: IN BIT_VECTOR(7 downto 0);
	OutputToAccumulator : OUT BIT_VECTOR(7 downto 0);
	CarryOut: OUT BIT);
END ALU_8bit;

ARCHITECTURE structural of ALU_8bit IS

COMPONENT ALU_1BIT IS
PORT(F0, F1, B, EN_B, A, EN_A, INV_A, CarryIn: IN BIT;
	Output, CarryOut: OUT BIT);
END COMPONENT;
SIGNAL carry01, carry12, carry23, carry34, carry45, carry56, carry67: BIT;
BEGIN

U150: ALU_1BIT PORT MAP(F0=>OperandFromControlUnit_0, F1=>OperandFromControlUnit_1, EN_B=>EN_B, B=>MemoryData(0),A=>AccumulatorData(0),EN_A=>EN_A,INV_A=>INV_A,CarryIn=>CarryInEnabler_CU,Output=>OutputToAccumulator(0),CarryOut =>carry01 );


U151: ALU_1BIT PORT MAP(F0=>OperandFromControlUnit_0, F1=>OperandFromControlUnit_1, EN_B=>EN_B, B=>MemoryData(1),A=>AccumulatorData(1),EN_A=>EN_A,INV_A=>INV_A,Output=>OutputToAccumulator(1),CarryOut =>carry12 , CarryIn=>carry01);


U152: ALU_1BIT PORT MAP(F0=>OperandFromControlUnit_0, F1=>OperandFromControlUnit_1, EN_B=>EN_B, B=>MemoryData(2),A=>AccumulatorData(2),EN_A=>EN_A,INV_A=>INV_A,Output=>OutputToAccumulator(2),CarryOut =>carry23 , CarryIn=>carry12);

U153: ALU_1BIT PORT MAP(F0=>OperandFromControlUnit_0, F1=>OperandFromControlUnit_1, EN_B=>EN_B, B=>MemoryData(3),A=>AccumulatorData(3),EN_A=>EN_A,INV_A=>INV_A,Output=>OutputToAccumulator(3),CarryOut =>carry34, CarryIn=>carry23 );


U154: ALU_1BIT PORT MAP(F0=>OperandFromControlUnit_0, F1=>OperandFromControlUnit_1, EN_B=>EN_B, B=>MemoryData(4),A=>AccumulatorData(4),EN_A=>EN_A,INV_A=>INV_A,Output=>OutputToAccumulator(4),CarryOut =>carry45, CarryIn=>carry34 );


U155: ALU_1BIT PORT MAP(F0=>OperandFromControlUnit_0, F1=>OperandFromControlUnit_1, EN_B=>EN_B, B=>MemoryData(5),A=>AccumulatorData(5),EN_A=>EN_A,INV_A=>INV_A,Output=>OutputToAccumulator(5),CarryOut =>carry56, CarryIn=>carry45 );


U156: ALU_1BIT PORT MAP(F0=>OperandFromControlUnit_0, F1=>OperandFromControlUnit_1, EN_B=>EN_B, B=>MemoryData(6),A=>AccumulatorData(6),EN_A=>EN_A,INV_A=>INV_A,Output=>OutputToAccumulator(6),CarryOut =>carry67, CarryIn=>carry56);


U157: ALU_1BIT PORT MAP(F0=>OperandFromControlUnit_0, F1=>OperandFromControlUnit_1, EN_B=>EN_B, B=>MemoryData(7),A=>AccumulatorData(7),EN_A=>EN_A,INV_A=>INV_A,Output=>OutputToAccumulator(7),CarryOut =>CarryOut, CarryIn=>carry67 );

END structural;
