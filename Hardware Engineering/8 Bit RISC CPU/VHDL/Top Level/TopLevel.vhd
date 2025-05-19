library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

ENTITY TopLevelCPU IS
PORT(globalCLK, RESET, WRITE, READ: IN STD_LOGIC;
    actualData: IN STD_LOGIC_VECTOR (7 downto 0);
    dataAddress: IN STD_LOGIC_VECTOR (5 dwonto 0);
    outputOn7seg: OUT STD_LOGIC_VECTOR(7 downto 0));
END TopLevelCPU;

ARCHITECTURE rtl OF TopLevelCPU IS

SIGNAL

COMPONENT ALU_8bit IS
PORT(OperandFromControlUnit_0, OperandFromControlUnit_1, CarryInEnabler_CU,EN_B, EN_A, INV_A: IN BIT;
	MemoryData, AccumulatorData: IN BIT_VECTOR(7 downto 0);
	OutputToAccumulator : OUT BIT_VECTOR(7 downto 0);
	CarryOut: OUT BIT);
END COMPONENT;

COMPONENT ProgramCounter IS
port(operand: IN STD_LOGIC_VECTOR (4 downto 0);
	SELE: IN STD_LOGIC_VECTOR (1 downto 0);
	RESET, CLK, PC_LOAD: IN STD_LOGIC;
 finalpcAddr: OUT STD_LOGIC_VECTOR (7 downto 0));
END COMPONENT;

COMPONENT instruction_memoryUnit is
port(pcAddress: IN STD_LOGIC_VECTOR (7 downto 0);
	instruction: OUT STD_LOGIC_VECTOR (7 downto 0));
end COMPONENT;

COMPONENT controlUnit IS
PORT(	OperandFromInstructionRegister: IN STD_LOGIC_VECTOR(4 downto 0);
	OPCodeFromInstructionRegister: IN STD_LOGIC_VECTOR(2 downto 0);
	instructionRegisterLoad: OUT STD_LOGIC;
	
	clock, reset: IN STD_LOGIC;

	
	userInput: IN STD_LOGIC;
	enableLED, LEDwait: OUT STD_LOGIC;

	programCounterSelector:	 OUT STD_LOGIC_VECTOR(1 downto 0);
	programCounterLoader: OUT STD_LOGIC;

	accumulatorLoader: OUT STD_LOGIC;
	accumulatorSelector: OUT STD_LOGIC;
	accumulatorFlagEnabler: OUT STD_LOGIC;

	InstructionMemoryEnable: OUT STD_LOGIC;

	DataMemoryRead: OUT STD_LOGIC_VECTOR(7 downto 0);
	DataMemoryWrite: OUT STD_LOGIC_VECTOR(7 downto 0);

	
	ALU_operand: OUT STD_LOGIC_VECTOR(1 downto 0);
	ALU_Enabler, ALU_INVA : OUT STD_LOGIC;
	ALU_CarryInEnabler : OUT STD_LOGIC;

	positiveFlag, zeroFlag,carryFlag: IN STD_LOGIC;


	
);
END COMPONENT;

COMPONENT instruction_memoryUnit is
port(pcAddress: IN STD_LOGIC_VECTOR (7 downto 0);
	instruction: OUT STD_LOGIC_VECTOR (7 downto 0));
end COMPONENT;

COMPONENT data_memoryUnit is
port(dataAddress: IN STD_LOGIC_VECTOR (4 downto 0);
	dataIN: IN STD_LOGIC_VECTOR(7 downto 0);
	dataOUT: OUT STD_LOGIC_VECTOR (7 downto 0);
	CLK, MEM_WRITE, MEM_READ: STD_LOGIC);
end COMPONENT;


COMPONENT IR IS
PORT(ControlClock, Loader, ControlReset: IN STD_LOGIC;
	AddressFromInstructionMemory: IN STD_LOGIC_VECTOR(7 downto 0);
	OpCodeForControlUnit: OUT STD_LOGIC_VECTOR(2 downto 0);
	OperandForJump_Data_ALU_Instruction: OUT STD_LOGIC_VECTOR(4 downto 0)
	
);
END COMPONENT;


BEGIN




END ARCHITECTURE;
