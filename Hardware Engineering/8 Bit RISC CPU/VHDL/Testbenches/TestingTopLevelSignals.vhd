library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

ENTITY TopLevelCPUTester IS
PORT(globalCLK, RESET : IN STD_LOGIC;
    outputFor7seg: OUT STD_LOGIC_VECTOR(7 downto 0);
    carry : OUT std_logic;
	programCounterSelector:	 OUT STD_LOGIC_VECTOR(1 downto 0);
	programCounterLoader: OUT STD_LOGIC;

	accumulatorLoader: OUT STD_LOGIC;
	accumulatorSelector: OUT STD_LOGIC;
	accumulatorFlagEnabler: OUT STD_LOGIC;
	accumulatorOutputSelector: OUT STD_LOGIC;

	DataMemoryRead: OUT STD_LOGIC;
	DataMemoryWrite: OUT STD_LOGIC;

	
	operandALU: OUT STD_LOGIC_VECTOR(1 downto 0);
	ALU_Enabler, ALU_INVA : OUT STD_LOGIC;
	ALU_CarryInEnabler, ZeroFlag, CarryFlag : OUT STD_LOGIC;
	instructionRegisterLoad: OUT STD_LOGIC;
	instruction: OUT STD_LOGIC_VECTOR(7 downto 0);
	ALUOpCodeA: OUT STD_LOGIC_VECTOR(7 downto 0);
	ALUOpCodeB, ALU_Output, programCounterOutput,accumulatorInputFromDataUnit  : OUT STD_LOGIC_VECTOR(7 downto 0);
	dataUnitAddressInput:OUT STD_LOGIC_VECTOR(4 downto 0)
    );
END TopLevelCPUTester;

ARCHITECTURE rtl OF TopLevelCPUTester IS

SIGNAL CUCarryEnabler, ALUInputEnablers, AFromAccumulatorInverterByControlUnit, CarryOutToAccumulator: STD_LOGIC;
SIGNAL BFromDataMemory, AFromAccumulator, ALUResultToAccumulator : STD_LOGIC_VECTOR(7 downto 0);
SIGNAL ALUOperand : STD_LOGIC_VECTOR(1 downto 0);
SIGNAL InstructionRegisterOperand: STD_LOGIC_VECTOR(4 downto 0); 
SIGNAL	SelectorFromControlUnit: STD_LOGIC_VECTOR(1 downto 0);
SIGNAL	PCLoadFromControlUnit: STD_LOGIC;
SIGNAL	AddressToInstructioUnit: STD_LOGIC_VECTOR(7 downto 0);
SIGNAL InstructionToInstructionRegister:  STD_LOGIC_VECTOR (7 downto 0);
SIGNAL storingDataFromAccumulatorToDataUnit: STD_LOGIC_VECTOR(7 downto 0);
SIGNAL controlUnitMemoryWriteController, controlUnitMemoryReadController: STD_LOGIC;
SIGNAL intructionRegisterLoaderByControlUnit: STD_LOGIC;
SIGNAL opcodeFromInstructionRegisterForControlUnit: STD_LOGIC_VECTOR(2 downto 0);
SIGNAL accumulatorLoaderFromControlUnit, AccumulatorFlagEnablerFromControlUnit: STD_LOGIC;
SIGNAL accumulatorSourceSelectorFromControlUnit: STD_LOGIC;
SIGNAL negativeFlagFromAccumulatorToCU, carryFlagFromAccumulatorToCU, zeroFlagFromAccumulatorCU : STD_LOGIC;
SIGNAL accumulatorOuputSelector, dataUnitOutputSelector,ALUFlipFlopLoaderByControlUnit : STD_LOGIC;
SIGNAL dataUnitToAccumulator, accumulatorOutputToALU: STD_LOGIC_VECTOR (7 downto 0);
--SIGNAL accumulatorInputFromDataUnit: STD_LOGIC_VECTOR(7 downto 0);

COMPONENT ALU_8bit IS
PORT(OperandFromControlUnit_0, OperandFromControlUnit_1, CarryInEnabler_CU,EN_B, EN_A, INV_A,
	CLK, RESET,ALUFlipFlopLoader : IN STD_LOGIC;
	MemoryData, AccumulatorData: IN STD_LOGIC_VECTOR(7 downto 0);
	OutputToAccumulator : OUT STD_LOGIC_VECTOR(7 downto 0);
	CarryOut: OUT STD_LOGIC);
END COMPONENT;

COMPONENT ProgramCounter is
port(operand: IN STD_LOGIC_VECTOR (4 downto 0);
 SELE: IN STD_LOGIC_VECTOR (1 downto 0);
 RESET, CLK, PC_LOAD: IN STD_LOGIC;
 finalpcAddr: OUT STD_LOGIC_VECTOR (7 downto 0));
end COMPONENT;

COMPONENT instruction_memoryUnit is
port(pcAddress: IN STD_LOGIC_VECTOR (7 downto 0);
	instruction: OUT STD_LOGIC_VECTOR (7 downto 0));
end COMPONENT;

COMPONENT controlUnitTest IS
PORT(
	OPCodeFromInstructionRegister: IN STD_LOGIC_VECTOR(2 downto 0);
	instructionRegisterLoad: OUT STD_LOGIC;
	
	clock, rst: IN STD_LOGIC;

	programCounterSelector:	 OUT STD_LOGIC_VECTOR(1 downto 0);
	programCounterLoader: OUT STD_LOGIC;

	accumulatorLoader: OUT STD_LOGIC;
	accumulatorSelector: OUT STD_LOGIC;
	accumulatorFlagEnabler: OUT STD_LOGIC;
	accumulatorOutputSelector: OUT STD_LOGIC;

	DataMemoryRead: OUT STD_LOGIC;
	DataMemoryWrite: OUT STD_LOGIC;
	dataUnitSelector: OUT STD_LOGIC;
	
	ALU_operand: OUT STD_LOGIC_VECTOR(1 downto 0);
	ALU_Enabler, ALU_INVA : OUT STD_LOGIC;
	ALU_CarryInEnabler : OUT STD_LOGIC;
	ALUFlipFlopLoader: OUT STD_LOGIC;

	negativeFlag, zeroFlag,carryFlag: IN STD_LOGIC
	
);
END COMPONENT;

COMPONENT data_memoryUnit is
port(dataAddress: IN STD_LOGIC_VECTOR (4 downto 0);
	dataIN: IN STD_LOGIC_VECTOR(7 downto 0);
	outputToAccumulator, outputToALU: OUT STD_LOGIC_VECTOR (7 downto 0);
	CLK, MEM_WRITE, MEM_READ, OutputSelector: IN STD_LOGIC);
end COMPONENT;


COMPONENT IR IS
PORT(ControlClock, Loader, ControlReset: IN STD_LOGIC;
	AddressFromInstructionMemory: IN STD_LOGIC_VECTOR(7 downto 0);
	OpCodeForControlUnit: OUT STD_LOGIC_VECTOR(2 downto 0);
	OperandForJump_Data_ALU_Instruction: OUT STD_LOGIC_VECTOR(4 downto 0)
	
);
END COMPONENT;

COMPONENT Accumulator is 
port(datafromALU, datafromDataUnit: IN STD_LOGIC_VECTOR (7 downto 0);
	CLK, RST, EN, MUX_SEL, DEMUX_SEL,carryBit,flagEnablerFromControlUnit: IN STD_LOGIC;
	datatoALU, datatoDataUnit: OUT STD_LOGIC_VECTOR (7 downto 0);
	outputForDisplay: OUT STD_LOGIC_VECTOR(7 downto 0);
	negativeFlag         : OUT STD_LOGIC;
        ZeroFlag             : OUT STD_LOGIC;
        carryFlag            : OUT STD_LOGIC
);
end COMPONENT;

BEGIN

CPU100: ALU_8bit PORT MAP (OperandFromControlUnit_0=>ALUOperand(0),
                            OperandFromControlUnit_1=>ALUOperand(1),
                            CarryInEnabler_CU=>CUCarryEnabler,
                            EN_B=>ALUInputEnablers,
                            EN_A=>ALUInputEnablers,
			                 INV_A=>AFromAccumulatorInverterByControlUnit,
			                 MemoryData=>BFromDataMemory,
			                 AccumulatorData=>AFromAccumulator,
			                 OutputToAccumulator=>ALUResultToAccumulator,
		                 CarryOut=>CarryOutToAccumulator,
				 CLK=>globalCLK, RESET=>RESET,
				 ALUFlipFlopLoader=>ALUFlipFlopLoaderByControlUnit
				);
carry <= carryFlagFromAccumulatorToCU;

CPU101: ProgramCounter PORT MAP (operand=>InstructionRegisterOperand,
                                SELE=>SelectorFromControlUnit,
                                RESET=>RESET,CLK=>globalCLK,
                                PC_LOAD=>PCLoadFromControlUnit,
                                finalpcAddr=>AddressToInstructioUnit);

CPU102: instruction_memoryUnit PORT MAP (pcAddress=>AddressToInstructioUnit,
                                        instruction=>InstructionToInstructionRegister);

CPU103: data_memoryUnit PORT MAP (dataAddress=>InstructionRegisterOperand,
                                    dataIN=>storingDataFromAccumulatorToDataUnit, 
						          outputToAccumulator=>dataUnitToAccumulator,
							outputToALU=>BFromDataMemory,	
						          CLK=> globalCLK, 
						          MEM_WRITE=> controlUnitMemoryWriteController, 
						          MEM_READ=> controlUnitMemoryReadController,
								OutputSelector=> dataUnitOutputSelector);				          
CPU104: IR PORT MAP (ControlClock=>globalCLK,
                    Loader=>intructionRegisterLoaderByControlUnit, 
                     ControlReset=>RESET,
		              AddressFromInstructionMemory=> InstructionToInstructionRegister, 
		              OpCodeForControlUnit=>opcodeFromInstructionRegisterForControlUnit , 
		              OperandForJump_Data_ALU_Instruction=>InstructionRegisterOperand);

CPU105: Accumulator PORT MAP (datafromALU=>ALUResultToAccumulator, 
                               dataFromDataUnit=>dataUnitToAccumulator,
		                      CLK=> globalCLK, 
		                      EN=>accumulatorLoaderFromControlUnit , 
		                      RST=>RESET, 
		                      MUX_SEL=>accumulatorSourceSelectorFromControlUnit, 
		                      carryBit=>CarryOutToAccumulator, 
		                      DEMUX_SEL=> accumulatorOuputSelector,
		                      datatoALU=>AFromAccumulator,
		                      datatoDataUnit=>storingDataFromAccumulatorToDataUnit,
		                      outputForDisplay=>outputFor7seg,
		                      flagEnablerFromControlUnit=>AccumulatorFlagEnablerFromControlUnit,
		                      negativeFlag=>negativeFlagFromAccumulatorToCU, 
		                      ZeroFlag=>zeroFlagFromAccumulatorCU,
		                      carryFlag=> carryFlagFromAccumulatorToCU);
			
CPU106: controlUnitTest PORT MAP(		OPCodeFromInstructionRegister=>opcodeFromInstructionRegisterForControlUnit,
				            instructionRegisterLoad=>intructionRegisterLoaderByControlUnit,
				            clock=>globalCLK,
				            rst=>RESET,
				            programCounterSelector=>SelectorFromControlUnit,
				            programCounterLoader=>PCLoadFromControlUnit,
				            accumulatorLoader=>accumulatorLoaderFromControlUnit,
				            accumulatorSelector=>accumulatorSourceSelectorFromControlUnit,
				            accumulatorFlagEnabler=>AccumulatorFlagEnablerFromControlUnit,
					    accumulatorOutputSelector=>	accumulatorOuputSelector,
				            DataMemoryRead=>controlUnitMemoryReadController,
				            DataMemoryWrite=>controlUnitMemoryWriteController,
				            ALU_operand=>ALUOperand,
				            ALU_Enabler=>ALUInputEnablers,
				            ALU_INVA=>AFromAccumulatorInverterByControlUnit, 
				            ALU_CarryInEnabler=> CUCarryEnabler,
				            negativeFlag=>negativeFlagFromAccumulatorToCU,
				            zeroFlag=>zeroFlagFromAccumulatorCU, 
				            carryFlag=>carryFlagFromAccumulatorToCU,
						dataUnitSelector=>dataUnitOutputSelector,
						ALUFlipFlopLoader=>ALUFlipFlopLoaderByControlUnit);

	programCounterSelector<=SelectorFromControlUnit;
	programCounterLoader<=PCLoadFromControlUnit;

	accumulatorLoader<=accumulatorLoaderFromControlUnit;
	accumulatorSelector<=accumulatorSourceSelectorFromControlUnit;
	accumulatorFlagEnabler<=AccumulatorFlagEnablerFromControlUnit;
	accumulatorOutputSelector<=accumulatorOuputSelector;

	DataMemoryRead<=controlUnitMemoryReadController;
	DataMemoryWrite<=controlUnitMemoryWriteController;

	
	operandALU<=ALUOperand;
	ALU_Enabler<=ALUInputEnablers;
	 ALU_INVA <=AFromAccumulatorInverterByControlUnit;
	ALU_CarryInEnabler<=CUCarryEnabler;
	instructionRegisterLoad<=intructionRegisterLoaderByControlUnit;
	instruction<=InstructionToInstructionRegister;
	ALUOpCodeA<=AFromAccumulator;
	ALUOpCodeB<=BFromDataMemory;
	ALU_Output<= ALUResultToAccumulator;
	programCounterOutput<= AddressToInstructioUnit;
	accumulatorInputFromDataUnit<=dataUnitToAccumulator;
	dataUnitAddressInput<=InstructionRegisterOperand;
	ZeroFlag<=zeroFlagFromAccumulatorCU;
	CarryFlag<=carryFlagFromAccumulatorToCU;	
END ARCHITECTURE;
