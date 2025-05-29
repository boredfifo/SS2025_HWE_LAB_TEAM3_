library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

ENTITY controlUnitTest IS
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
END controlUnitTest;


ARCHITECTURE behavioural of controlUnitTest IS

	type state_type is (
		Reset,                  

		fetchState,

		getFetchedState,                   

		DecodeIR,

		getDecodedInstruction,

		Load,

		getLoadedInstruction,

		Store,

		confirmingStore,

		SUM,

		SavingResult,

		DisplayingResult,

		SUB,

		SavingResultForSUB,

		DisplayingResultForSUB,

		JumpToNoCarry,

		JumpingIfNoCarry,

		NoOperation,
	
		ANDING,

		SavingResultForAND,

		DisplayingResultForAND,

		ORING,

		SavingResultForOR,

		DisplayingResultForOR

			
);

SIGNAL state: state_type := Reset;
SIGNAL nextState: state_type := Reset;


BEGIN



PROCESS(clock, rst)
BEGIN
    IF rising_edge(clock) THEN

	IF rst = '1' THEN
            state <= Reset;
        ELSE
            state <= nextState;
        END IF;
    END IF;
END PROCESS;


PROCESS(state, OPCodeFromInstructionRegister )
BEGIN
	CASE(state) IS		
		WHEN Reset => nextState <= fetchState;
		WHEN fetchState => nextState<=getFetchedState;
		WHEN getFetchedState => nextState<=DecodeIR;
		WHEN DecodeIR => nextState<=getDecodedInstruction;			
		When getDecodedInstruction => 
				CASE(OPCodeFromInstructionRegister) IS
					WHEN "000" => nextState<=NoOperation;
					WHEN "001" => nextState<=Store;		
					WHEN "010" => nextState<=SUM;
					WHEN "011" => nextState<=SUB;
					WHEN "100" => nextState<=Load;
            				WHEN "101" => nextState <= ORING;
					WHEN "110" => nextState <= JumpToNoCarry;
					WHEN "111" => nextState <= ANDING;
            				WHEN OTHERS => 
                				nextState <= NoOperation;
        			END CASE;
		WHEN Load => nextState<=getLoadedInstruction;
		WHEN getLoadedInstruction => nextState<=NoOperation;

		WHEN Store => nextState<=confirmingStore;
		WHEN confirmingStore => nextState<=fetchState;

		WHEN SUM => nextState<=SavingResult;
		WHEN SavingResult => nextState<=DisplayingResult;
		WHEN DisplayingResult => nextState<=NoOperation;

		WHEN SUB => nextState<=SavingResultForSUB;
		WHEN SavingResultForSUB => nextState<=DisplayingResultForSUB;
		WHEN DisplayingResultForSUB => nextState<=NoOperation;

		WHEN ANDING => nextState<=SavingResultForAND;
		WHEN SavingResultForAND => nextState<=DisplayingResultForAND;
		WHEN DisplayingResultForAND => nextState<=NoOperation;

		WHEN ORING => nextState<=SavingResultForOR;
		WHEN SavingResultForOR => nextState<=DisplayingResultForOR;
		WHEN DisplayingResultForOR => nextState<=NoOperation;

		WHEN JumpToNoCarry => nextState<=JumpingIfNoCarry;
		WHEN JumpingIfNoCarry => nextState<=getFetchedState;

		WHEN NoOperation => nextState<=fetchState;		 
	        WHEN OTHERS => nextState<=fetchState;
	END CASE;
END PROCESS;


PROCESS (state, carryFlag)
BEGIN
	CASE(state) IS
		WHEN Reset => 	instructionRegisterLoad<='0'; 
				programCounterLoader <= '1'; programCounterSelector<="11";
				accumulatorLoader <= '0'; accumulatorSelector<= '0';
				accumulatorFlagEnabler<='0';accumulatorOutputSelector<= '0';
				DataMemoryRead<= '0'; DataMemoryWrite <= '0';
				ALU_Enabler<='0'; ALU_INVA <= '0'; ALU_CarryInEnabler <= '0'; ALU_operand<="00"; dataUnitSelector<= '0'; ALUFlipFlopLoader<= '0';

		WHEN fetchState => programCounterLoader <= '1'; programCounterSelector<="00";DataMemoryWrite <= '0';

		WHEN getFetchedState => programCounterLoader <= '0';

		WHEN DecodeIR => instructionRegisterLoad<='1'; 

		WHEN getDecodedInstruction => instructionRegisterLoad<='0'; 

		WHEN Load =>	accumulatorSelector<= '1';
				DataMemoryRead<= '1';dataUnitSelector<= '1';

		WHEN getLoadedInstruction =>    accumulatorLoader <= '1'; accumulatorSelector<= '1';
						dataUnitSelector<= '1';
	
		WHEN NoOperation => accumulatorLoader <= '0'; accumulatorSelector<= '1';
				DataMemoryRead<= '0';dataUnitSelector<= '0';
				accumulatorOutputSelector<= '0';DataMemoryWrite <= '0';					
				accumulatorFlagEnabler<='0';


		WHEN Store => 	accumulatorOutputSelector<= '1';DataMemoryWrite <= '1';

		WHEN confirmingStore => accumulatorOutputSelector<= '1';DataMemoryWrite <= '0';
		
		WHEN SUM => 		DataMemoryRead<= '1';

		WHEN SavingResult => 	ALU_Enabler<='1';DataMemoryRead<= '0';
					dataUnitSelector<= '0';accumulatorOutputSelector<= '0';
					ALU_operand<="11";ALUFlipFlopLoader<= '1';


		WHEN DisplayingResult => DataMemoryRead<= '0';ALU_Enabler<='0';
					accumulatorOutputSelector<= '0';
					accumulatorLoader <= '1';accumulatorSelector<= '0';
					ALUFlipFlopLoader<= '0';accumulatorFlagEnabler<='0';

		WHEN SUB => 		DataMemoryRead<= '1';

		WHEN SavingResultForSUB => 	ALU_Enabler<='1';DataMemoryRead<= '0';
						dataUnitSelector<= '0';accumulatorOutputSelector<= '0';
						ALU_operand<="11";ALUFlipFlopLoader<= '1';
						ALU_INVA <= '1'; ALU_CarryInEnabler <= '1';


		WHEN DisplayingResultForSUB => ALU_Enabler<='0';accumulatorOutputSelector<= '0';
						accumulatorLoader <= '1';accumulatorSelector<= '0';
						ALUFlipFlopLoader<= '0';accumulatorFlagEnabler<='1';
						ALU_INVA <= '0'; ALU_CarryInEnabler <= '0';
	

		WHEN JumpToNoCarry =>	accumulatorFlagEnabler<='1';


		WHEN JumpingIfNoCarry =>accumulatorFlagEnabler<='0';
					IF carryFlag = '0' THEN
					programCounterLoader <= '1'; programCounterSelector <= "01";
					ELSE
					programCounterLoader <= '1'; programCounterSelector <= "00";
					END IF;	

		
		WHEN ANDING => 		DataMemoryRead<= '1';

		WHEN SavingResultForAND => 	ALU_Enabler<='1';DataMemoryRead<= '0';
					dataUnitSelector<= '0';accumulatorOutputSelector<= '0';
					ALU_operand<="00";ALUFlipFlopLoader<= '1';


		WHEN DisplayingResultForAND => DataMemoryRead<= '0';ALU_Enabler<='0';
					accumulatorOutputSelector<= '0';
					accumulatorLoader <= '1';accumulatorSelector<= '0';
					ALUFlipFlopLoader<= '0';accumulatorFlagEnabler<='1';

		WHEN ORING => 		DataMemoryRead<= '1';
		WHEN SavingResultForOR => 	ALU_Enabler<='1';DataMemoryRead<= '0';
					dataUnitSelector<= '0';accumulatorOutputSelector<= '0';
					ALU_operand<="10";ALUFlipFlopLoader<= '1';


		WHEN DisplayingResultForOR => DataMemoryRead<= '0';ALU_Enabler<='0';
					accumulatorOutputSelector<= '0';
					accumulatorLoader <= '1';accumulatorSelector<= '0';
					ALUFlipFlopLoader<= '0';accumulatorFlagEnabler<='1';

	END CASE;
END PROCESS;
				 		
END behavioural;
