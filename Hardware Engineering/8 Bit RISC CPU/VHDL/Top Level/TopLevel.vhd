library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

ENTITY TopLevelCPU IS
PORT(globalCLK, RESET, TRIGGER_BTN: IN STD_LOGIC;
    actualData: IN STD_LOGIC_VECTOR (7 downto 0);
    dataAddress: IN STD_LOGIC_VECTOR (5 dwonto 0);
    outputOn7seg: OUT STD_LOGIC_VECTOR(7 downto 0));
END TopLevelCPU;

ARCHITECTURE rtl OF TopLevelCPU IS

SIGNAL CUCarryEnabler, ALUInputEnablers, BFromDataMemory, AFromAccumulator, AFromAccumulatorInverterByControlUnit, ALUResultToAccumulator, CarryOutToAccumulator: STD_LOGIC;
SIGNAL ALUOperand : STD_LOGIC_VECTOR(1 downto 0);
SIGNAL InstructionRegisterOperand: STD_LOGIC_VECTOR(4 downto 0); 
SIGNAL	SelectorFromControlUnit: STD_LOGIC_VECTOR(1 downto 0);
SIGNAL	PCLoadFromControlUnit: STD_LOGIC;
SIGNAL	AddressToInstructioUnit: STD_LOGIC_VECTOR(7 downto 0);
SIGNAL InstructionToInstructionRegister:  STD_LOGIC_VECTOR (7 downto 0);
SIGNAL userDataFromAccumulator: STD_LOGIC_VECTOR(7 downto 0);
SIGNAL controlUnitMemoryWriteController, controlUnitMemoryReadController: STD_LOGIC;
SIGNAL intructionRegisterLoaderByControlUnit: STD_LOGIC;
SIGNAL opcodeFromInstructionRegisterForControlUnit: STD_LOGIC_VECTOR(2 downto 0);
SIGNAL accumulatorLoaderFromControlUnit, AccumulatorFlagEnablerFromControlUnit: STD_LOGIC;
SIGNAL accumulatorSourceSelectorFromControlUnit: STD_LOGIC_VECTOR(1 downto 0);
SIGNAL negativeFlagFromAccumulatorToCU, carryFlagFromAccumulatorToCU, zeroFlagFromAccumulatorCU : STD_LOGIC;

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

	negativeFlag, zeroFlag,carryFlag: IN STD_LOGIC;


	
);
END COMPONENT;

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

COMPONENT Accumulator IS
PORT(	
	datafromALU: IN STD_LOGIC_VECTOR(7 downto 0);
	dataFromUser: IN STD_LOGIC_VECTOR(7 downto 0);
	dataFromDataUnit: IN STD_LOGIC_VECTOR(7 downto 0);
	clock, load, reset: IN STD_LOGIC;
	sourceSelector: IN STD_LOGIC_VECTOR(1 downto 0);
	carryBit: IN STD_LOGIC;

	dataintoALU: OUT STD_LOGIC_VECTOR(7 downto 0);
	flagEnablerFromControlUnit: IN STD_LOGIC;
	negativeFlag, ZeroFlag, carryFlag: OUT STD_LOGIC);

	
END COMPONENT;

BEGIN

CPU100: ALU_8bit PORT MAP (OperandFromControlUnit_0=>ALUOperand(0),OperandFromControlUnit_1=>ALUOperand(1),CarryInEnabler_CU=>CUCarryEnabler,EN_B=>ALUInputEnablers,EN_A=>ALUInputEnablers,
			INV_A=>AFromAccumulatorInverterByControlUnit,MemoryData=>BFromDataMemory,AccumulatorData=>AFromAccumulator,OutputToAccumulator=>ALUResultToAccumulator,CarryOut=>CarryOutToAccumulator);

CPU101: ProgramCounter PORT MAP (operand=>InstructionRegisterOperand,SELE=>SelectorFromControlUnit,RESET=>RESET,CLK=>globalCLK,PC_LOAD=>PCLoadFromControlUnit,finalpcAddr=>AddressToInstructioUnit);

CPU102: instruction_memoryUnit PORT MAP (pcAddress=>AddressToInstructioUnit,instruction=>InstructionToInstructionRegister);

CPU103: data_memoryUnit PORT MAP (dataAddress=>AddressToInstructioUnit,dataIN=>userDataFromAccumulator, 
						dataOUT=>BFromDataMemory,CLK=> globalCLK, MEM_WRITE=> controlUnitMemoryWriteController, MEM_READ=> controlUnitMemoryReadController);
CPU104: IR PORT MAP (ControlClock=>globalCLK,Loader=>intructionRegisterLoaderByControlUnit, ControlReset=>RESET,
		AddressFromInstructionMemory=> InstructionToInstructionRegister, OpCodeForControlUnit=>opcodeFromInstructionRegisterForControlUnit , 
		OperandForJump_Data_ALU_Instruction=>InstructionRegisterOperand);

CPU105: Accumulator PORT MAP (datafromALU=>ALUResultToAccumulator,dataFromUser=>intructionRegisterLoaderByControlUnit, dataFromDataUnit=>RESET,
		clock=> globalCLK, load=>accumulatorLoaderFromControlUnit , reset=>RESET, 
		sourceSelector=>accumulatorSourceSelectorFromControlUnit, carryBit=>,CarryOutToAccumulator=>, flagEnablerFromControlUnit=>AccumulatorFlagEnablerFromControlUnit,
		negativeFlag=>negativeFlagFromAccumulatorToCU, ZeroFlag=>zeroFlagFromAccumulatorCU,carryFlag=> carryFlagFromAccumulatorToCU);

CPU106: controlUnit PORT MAP(OperandFromInstructionRegister=>InstructionRegisterOperand,OPCodeFromInstructionRegister=>opcodeFromInstructionRegisterForControlUnit,
				instructionRegisterLoad=>intructionRegisterLoaderByControlUnit,clock=>globalCLK,
				reset=>RESET,userInput=>,enableLED=>,LEDwait=>,
				programCounterSelector=>SelectorFromControlUnit,programCounterLoader=>PCLoadFromControlUnit,
				accumulatorLoader=>accumulatorLoaderFromControlUnit,accumulatorSelector=>accumulatorSourceSelectorFromControlUnit,
				accumulatorFlagEnabler=>AccumulatorFlagEnablerFromControlUnit,InstructionMemoryEnable=>,
				DataMemoryRead=>controlUnitMemoryReadController,DataMemoryWrite=>controlUnitMemoryWriteController,
				ALU_operand=>ALUOperand,ALU_Enabler=>ALUInputEnablers,ALU_INVA=>AFromAccumulatorInverterByControlUnit, ALU_CarryInEnabler=> CUCarryEnabler,
				negativeFlag=>negativeFlagFromAccumulatorToCU,zeroFlag=>zeroFlagFromAccumulatorCU, carryFlag=>carryFlagFromAccumulatorToCU );

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

	negativeFlag, zeroFlag,carryFlag: IN STD_LOGIC;


	
);
END COMPONENT;
END ARCHITECTURE;
