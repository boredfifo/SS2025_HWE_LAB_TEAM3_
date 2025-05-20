library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

ENTITY controlUnit IS
PORT(	OperandFromInstructionRegister: IN STD_LOGIC_VECTOR(4 downto 0);
	OPCodeFromInstructionRegister: IN STD_LOGIC_VECTOR(2 downto 0);
	instructionRegisterLoad: OUT STD_LOGIC;
	
	clock, rst: IN STD_LOGIC;

	
	--userInput: IN STD_LOGIC;
	--enableLED, LEDwait: OUT STD_LOGIC;

	programCounterSelector:	 OUT STD_LOGIC_VECTOR(1 downto 0);
	programCounterLoader: OUT STD_LOGIC;

	accumulatorLoader: OUT STD_LOGIC;
	accumulatorSelector: OUT STD_LOGIC_VECTOR(1 downto 0);
	accumulatorFlagEnabler: OUT STD_LOGIC;

	--InstructionMemoryEnable: OUT STD_LOGIC;

	DataMemoryRead: OUT STD_LOGIC;
	DataMemoryWrite: OUT STD_LOGIC;

	
	ALU_operand: OUT STD_LOGIC_VECTOR(1 downto 0);
	ALU_Enabler, ALU_INVA : OUT STD_LOGIC;
	ALU_CarryInEnabler : OUT STD_LOGIC;

	negativeFlag, zeroFlag,carryFlag: IN STD_LOGIC
	
);
END controlUnit;


ARCHITECTURE behavioural of controlUnit IS

	type state_type is (
		Reset,                   

		fetchState,                   

		DecodeIR,

		Load,

		Store,

		SUM,

		SUB,

		JumpToZero,

		JumpToProgramStart,

		JumpPosition,
		
		sendToSS,

		defaultState

			
);

SIGNAL state: state_type := Reset;
SIGNAL nextState: state_type := Reset;



Begin
PROCESS(clock, rst)
BEGIN
	IF rst = '1' THEN
		state <= Reset;
	elsif clock'event and clock = '1' then
		state <= nextState;
	END IF;
END PROCESS;


PROCESS(state, OperandFromInstructionRegister, OPCodeFromInstructionRegister, zeroFlag,negativeFlag,carryFlag )
BEGIN
	CASE(state) IS
			
		WHEN Reset => nextState <= fetchState;
		WHEN fetchState => nextState<=DecodeIR;
		When DecodeIR => 
				CASE(OPCodeFromInstructionRegister) IS
					WHEN "000" => nextState<=Load;
					WHEN "001" => nextState<=Store;		
					WHEN "010" => nextState<=SUM;
					WHEN "011" => nextState<=SUB;
					WHEN "101" => nextState<=JumpToZero;
					WHEN "110" => nextState<=JumpToProgramStart;
					WHEN "111" => nextState<=JumpPosition;	
					WHEN OTHERS => nextState<=defaultState;
				END CASE;
	        WHEN OTHERS => nextState<=defaultState;
	END CASE;
END PROCESS;


PROCESS (state)
BEGIN
	CASE(state) IS
		WHEN Reset => 	instructionRegisterLoad<='0'; 
				programCounterLoader <= '1'; programCounterSelector<="10";
				accumulatorLoader <= '0'; accumulatorSelector<= "11";accumulatorFlagEnabler<='0';
				--InstructionMemoryEnable <= '0';
				DataMemoryRead<= '0'; DataMemoryWrite <= '0';
				ALU_Enabler<='0'; ALU_INVA <= '0'; ALU_CarryInEnabler <= '0'; ALU_operand<="00";

		WHEN fetchState => instructionRegisterLoad<='0'; 
				programCounterLoader <= '1'; programCounterSelector<="00"; --Program Counter sends address to IM
				accumulatorLoader <= '0'; accumulatorSelector<= "11";accumulatorFlagEnabler<='0'; 
				--InstructionMemoryEnable <= '1'; --IM sends address to IR
				DataMemoryRead<= '0'; DataMemoryWrite <= '0';
				ALU_Enabler<='0'; ALU_INVA <= '0'; ALU_CarryInEnabler <= '0'; ALU_operand<="00";

		WHEN DecodeIR => instructionRegisterLoad<='1'; 
				programCounterLoader <= '0'; programCounterSelector<="00"; --Program Counter sends address to IM
				accumulatorLoader <= '0'; accumulatorSelector<= "11";accumulatorFlagEnabler<='0'; 
				--InstructionMemoryEnable <= '0'; --IM sends address to IR
				DataMemoryRead<= '0'; DataMemoryWrite <= '0';
				ALU_Enabler<='0'; ALU_INVA <= '0'; ALU_CarryInEnabler <= '0'; ALU_operand<="00";

		WHEN Load =>    instructionRegisterLoad<='1';  --IR splits address from IM into two parts
				programCounterLoader <= '1'; programCounterSelector<="00";
				accumulatorLoader <= '1'; accumulatorSelector<= "01";accumulatorFlagEnabler<='1'; --loads operand into Accumulator
				--InstructionMemoryEnable <= '0';
				DataMemoryRead<= '1'; DataMemoryWrite <= '0';
				ALU_Enabler<= '0'; ALU_INVA <= '0'; ALU_CarryInEnabler <= '0'; ALU_operand<="00";

		WHEN Store => instructionRegisterLoad<='0'; 
				programCounterLoader <= '1'; programCounterSelector<="00";
				accumulatorLoader <= '0'; accumulatorSelector<= "11";accumulatorFlagEnabler<='0';
				--InstructionMemoryEnable <= '0';
				DataMemoryRead<= '0'; DataMemoryWrite <= '1';
				ALU_Enabler<= '0'; ALU_INVA <= '0'; ALU_CarryInEnabler <= '0'; ALU_operand<="00";

		WHEN SUM => instructionRegisterLoad<='0'; 
				programCounterLoader <= '1'; programCounterSelector<="00";
				accumulatorLoader <= '1'; accumulatorSelector<= "01";accumulatorFlagEnabler<='1';
				--InstructionMemoryEnable <= '0';
				DataMemoryRead<= '1'; DataMemoryWrite <= '0';
				ALU_Enabler<='1'; ALU_INVA <= '0'; ALU_CarryInEnabler <= '0'; ALU_operand<="11";	
	
		WHEN SUB => instructionRegisterLoad<='0'; 
				programCounterLoader <= '1'; programCounterSelector<="00";
				accumulatorLoader <= '1'; accumulatorSelector<= "01";accumulatorFlagEnabler<='1';
				--InstructionMemoryEnable <= '0';
				DataMemoryRead<= '1'; DataMemoryWrite <= '0';
				ALU_Enabler<='1'; ALU_INVA <= '1'; ALU_CarryInEnabler <= '1'; ALU_operand<="11";	

		WHEN JumpToZero => instructionRegisterLoad<='1'; 
				    IF zeroFlag = '1' THEN
        				programCounterLoader <= '1';
        				programCounterSelector <= "01";  
    				    ELSE
        			        programCounterLoader <= '1';
        				programCounterSelector <= "00";  
    				    END IF;
				accumulatorLoader <= '0'; accumulatorSelector<= "11";accumulatorFlagEnabler<='1';
				--InstructionMemoryEnable <= '0';
				DataMemoryRead<= '0'; DataMemoryWrite <= '0';
				ALU_Enabler<='0'; ALU_INVA <= '0'; ALU_CarryInEnabler <= '0'; ALU_operand<="00";

		WHEN JumpToProgramStart => instructionRegisterLoad<='1'; 
				programCounterLoader <= '1'; programCounterSelector<="10";
				accumulatorLoader <= '0'; accumulatorSelector<= "11";accumulatorFlagEnabler<='0';
				--InstructionMemoryEnable <= '0';
				DataMemoryRead<= '0'; DataMemoryWrite <= '0';
				ALU_Enabler<='0'; ALU_INVA <= '0'; ALU_CarryInEnabler <= '0'; ALU_operand<="00";

		WHEN JumpPosition => instructionRegisterLoad<='1'; 
				programCounterLoader <= '1'; programCounterSelector<="01";
				accumulatorLoader <= '0'; accumulatorSelector<= "11";accumulatorFlagEnabler<='0';
				--InstructionMemoryEnable <= '0';
				DataMemoryRead<= '0'; DataMemoryWrite <= '0';
				ALU_Enabler<='0'; ALU_INVA <= '0'; ALU_CarryInEnabler <= '0'; ALU_operand<="00";

		WHEN defaultState => instructionRegisterLoad<='0'; 
				programCounterLoader <= '0'; programCounterSelector<="00";
				accumulatorLoader <= '0'; accumulatorSelector<= "11";accumulatorFlagEnabler<='0';
				--InstructionMemoryEnable <= '0';
				DataMemoryRead<= '0'; DataMemoryWrite <= '0';
				ALU_Enabler<='0'; ALU_INVA <= '0'; ALU_CarryInEnabler <= '0'; ALU_operand<="00";
				
	   WHEN sendToSS => instructionRegisterLoad<='0'; 
				programCounterLoader <= '0'; programCounterSelector<="00";
				accumulatorLoader <= '0'; accumulatorSelector<= "11";accumulatorFlagEnabler<='0';
				--InstructionMemoryEnable <= '0';
				DataMemoryRead<= '0'; DataMemoryWrite <= '0';
				ALU_Enabler<='0'; ALU_INVA <= '0'; ALU_CarryInEnabler <= '0'; ALU_operand<="00";		
	END CASE;
END PROCESS;
				 		
END behavioural;
