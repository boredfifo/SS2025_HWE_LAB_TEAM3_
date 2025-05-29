library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

ENTITY TopLevelCPUTester_TB IS

END TopLevelCPUTester_TB;

ARCHITECTURE simulation OF TopLevelCPUTester_TB IS
SIGNAL globalCLK_TB, RESET_TB, carry_TB, programCounterLoader_TB, accumulatorLoader_TB,accumulatorSelector_TB,accumulatorFlagEnabler_TB,accumulatorOutputSelector_TB, DataMemoryRead_TB, 
	 DataMemoryWrite_TB, ALU_Enabler_TB, ALU_INVA_TB, ALU_CarryInEnabler_TB, instructionRegisterLoad_TB,
	ZeroFlag_TB, CarryFlag_TB : STD_LOGIC;
SIGNAL outputFor7seg_TB,instruction_TB, ALUOpCodeA_TB, ALU_Output_TB,ALUOpCodeB_TB, programCounterOutput_TB,accumulatorInputFromDataUnit_TB : STD_LOGIC_VECTOR(7 downto 0);
SIGNAL programCounterSelector_TB, operandALU_TB: STD_LOGIC_VECTOR(1 downto 0);
SIGNAL dataUnitAddressInput_TB: STD_LOGIC_VECTOR(4 downto 0);

COMPONENT TopLevelCPUTester IS
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
	ALUOpCodeB, ALU_Output, programCounterOutput, accumulatorInputFromDataUnit: OUT STD_LOGIC_VECTOR(7 downto 0);
	dataUnitAddressInput:OUT STD_LOGIC_VECTOR(4 downto 0)
    );
END COMPONENT;


BEGIN

DUT111: TopLevelCPUTester PORT MAP(globalCLK=>globalCLK_TB,
			RESET=>RESET_TB,
			outputFor7seg=>outputFor7seg_TB,
			carry=>carry_TB,
			programCounterSelector=>programCounterSelector_TB,
			programCounterLoader=>programCounterLoader_TB,
			accumulatorLoader=>accumulatorLoader_TB,
			accumulatorSelector=>accumulatorSelector_TB,
			accumulatorFlagEnabler=>accumulatorFlagEnabler_TB,
			accumulatorOutputSelector=>accumulatorOutputSelector_TB,
			DataMemoryRead=>DataMemoryRead_TB,
			DataMemoryWrite=>DataMemoryWrite_TB,
			operandALU=>operandALU_TB,
			ALU_Enabler=>ALU_Enabler_TB,	
			ALU_INVA=>ALU_INVA_TB, 
			ALU_CarryInEnabler=>ALU_CarryInEnabler_TB,
			instructionRegisterLoad=>instructionRegisterLoad_TB,
			instruction=>instruction_TB,
			ALUOpCodeA=>ALUOpCodeA_TB,
			ALUOpCodeB=>ALUOpCodeB_TB,
			ALU_Output=>ALU_Output_TB,
			programCounterOutput=>programCounterOutput_TB,
			accumulatorInputFromDataUnit=> accumulatorInputFromDataUnit_TB,
			dataUnitAddressInput=>dataUnitAddressInput_TB,
			ZeroFlag=>ZeroFlag_TB,
			CarryFlag=>CarryFlag_TB
			);

PROCESS
    BEGIN
        WHILE NOW < 2000 NS LOOP
            globalCLK_TB <= '0';
            WAIT FOR 5 NS;
            globalCLK_TB <= '1';
            WAIT FOR 5 NS;
        END LOOP;
        WAIT;
END PROCESS;

RESET_TB<= '0';
--, '0' after 10 NS;

END simulation;
