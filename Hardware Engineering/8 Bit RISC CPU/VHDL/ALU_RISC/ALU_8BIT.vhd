library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

ENTITY ALU_8bit IS
PORT(OperandFromControlUnit_0, OperandFromControlUnit_1, CarryInEnabler_CU,EN_B, EN_A, INV_A: IN STD_LOGIC;
	MemoryData, AccumulatorData: IN STD_LOGIC_VECTOR(7 downto 0);
	OutputToAccumulator : OUT STD_LOGIC_VECTOR(7 downto 0);
	CarryOut: OUT STD_LOGIC);
END ALU_8bit;
	
ARCHITECTURE structural of ALU_8bit IS

COMPONENT ALU_1BIT IS
PORT(F0, F1, B, EN_B, A, EN_A, INV_A, CarryIn: IN STD_LOGIC;
	Output, CarryOut: OUT STD_LOGIC);
END COMPONENT;
SIGNAL carry01, carry12, carry23, carry34, carry45, carry56, carry67: STD_LOGIC;
BEGIN

U150: ALU_1BIT PORT MAP(F0=>OperandFromControlUnit_0, F1=>OperandFromControlUnit_1, EN_B=>EN_B, A=>MemoryData(0),B=>AccumulatorData(0),EN_A=>EN_A,INV_A=>INV_A,CarryIn=>CarryInEnabler_CU,Output=>OutputToAccumulator(0),CarryOut =>carry01 );


U151: ALU_1BIT PORT MAP(F0=>OperandFromControlUnit_0, F1=>OperandFromControlUnit_1, EN_B=>EN_B, A=>MemoryData(1),B=>AccumulatorData(1),EN_A=>EN_A,INV_A=>INV_A,Output=>OutputToAccumulator(1),CarryOut =>carry12 , CarryIn=>carry01);


U152: ALU_1BIT PORT MAP(F0=>OperandFromControlUnit_0, F1=>OperandFromControlUnit_1, EN_B=>EN_B, A=>MemoryData(2),B=>AccumulatorData(2),EN_A=>EN_A,INV_A=>INV_A,Output=>OutputToAccumulator(2),CarryOut =>carry23 , CarryIn=>carry12);

U153: ALU_1BIT PORT MAP(F0=>OperandFromControlUnit_0, F1=>OperandFromControlUnit_1, EN_B=>EN_B, A=>MemoryData(3),B=>AccumulatorData(3),EN_A=>EN_A,INV_A=>INV_A,Output=>OutputToAccumulator(3),CarryOut =>carry34, CarryIn=>carry23 );


U154: ALU_1BIT PORT MAP(F0=>OperandFromControlUnit_0, F1=>OperandFromControlUnit_1, EN_B=>EN_B, A=>MemoryData(4),B=>AccumulatorData(4),EN_A=>EN_A,INV_A=>INV_A,Output=>OutputToAccumulator(4),CarryOut =>carry45, CarryIn=>carry34 );


U155: ALU_1BIT PORT MAP(F0=>OperandFromControlUnit_0, F1=>OperandFromControlUnit_1, EN_B=>EN_B, A=>MemoryData(5),B=>AccumulatorData(5),EN_A=>EN_A,INV_A=>INV_A,Output=>OutputToAccumulator(5),CarryOut =>carry56, CarryIn=>carry45 );


U156: ALU_1BIT PORT MAP(F0=>OperandFromControlUnit_0, F1=>OperandFromControlUnit_1, EN_B=>EN_B, A=>MemoryData(6),B=>AccumulatorData(6),EN_A=>EN_A,INV_A=>INV_A,Output=>OutputToAccumulator(6),CarryOut =>carry67, CarryIn=>carry56);


U157: ALU_1BIT PORT MAP(F0=>OperandFromControlUnit_0, F1=>OperandFromControlUnit_1, EN_B=>EN_B, A=>MemoryData(7),B=>AccumulatorData(7),EN_A=>EN_A,INV_A=>INV_A,Output=>OutputToAccumulator(7),CarryOut =>CarryOut, CarryIn=>carry67 );

END structural;
