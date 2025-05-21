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
	accumulatorOutputSelector: OUT STD_LOGIC_VECTOR(1 downto 0);

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

		defaultState

			
);

SIGNAL state: state_type := Reset;
SIGNAL nextState: state_type := Reset;
signal resetCounter : integer range 0 to 4 := 0;



Begin
PROCESS(clock, rst)
BEGIN
	IF rst = '1' THEN
		state <= Reset;
		resetCounter <= 0;
	elsif clock'event and clock = '1' then
		state <= nextState;
		IF state = Reset AND resetCounter < 4 THEN
			resetCounter <= resetCounter + 1;
		END IF;
	END IF;
END PROCESS;

PROCESS(state, OPCodeFromInstructionRegister, zeroFlag,negativeFlag,carryFlag )
BEGIN
	CASE(state) IS
			
		WHEN Reset => 
			IF resetCounter < 4 THEN
			nextState <= Reset; 
			ELSE
			nextState <= fetchState;
			END IF;
		WHEN fetchState => nextState<=DecodeIR;
		When DecodeIR => 
				CASE(OPCodeFromInstructionRegister) IS
					WHEN "000" => nextState<=Load;
					WHEN "001" => nextState<=Store;		
					WHEN "010" => nextState<=SUM;
					WHEN "011" => nextState<=SUB;
					WHEN "100" => nextState<=JumpToZero;
					WHEN "101" => nextState<=JumpToProgramStart;
					WHEN "110" => nextState<=JumpPosition;	
					WHEN OTHERS => nextState<=defaultState;
				END CASE;
	        WHEN OTHERS => nextState<=fetchState;
	END CASE;
END PROCESS;


PROCESS (state)
BEGIN
	CASE(state) IS
		WHEN Reset => 	instructionRegisterLoad<='0'; 
				programCounterLoader <= '0'; programCounterSelector<="11";
				accumulatorLoader <= '0'; accumulatorSelector<= "11";
				accumulatorFlagEnabler<='0';accumulatorOutputSelector<= "11";
				DataMemoryRead<= '0'; DataMemoryWrite <= '0';
				ALU_Enabler<='0'; ALU_INVA <= '0'; ALU_CarryInEnabler <= '0'; ALU_operand<="00";

		WHEN fetchState => instructionRegisterLoad<='0'; 
				programCounterLoader <= '1'; programCounterSelector<="00"; 
				accumulatorLoader <= '0'; accumulatorSelector<= "11";
				accumulatorFlagEnabler<='0'; accumulatorOutputSelector<= "10";
				DataMemoryRead<= '0'; DataMemoryWrite <= '0';
				ALU_Enabler<='0'; ALU_INVA <= '0'; ALU_CarryInEnabler <= '0'; ALU_operand<="00";

		WHEN DecodeIR => instructionRegisterLoad<='1'; 
				programCounterLoader <= '0'; programCounterSelector<="11"; 
				accumulatorLoader <= '0'; accumulatorSelector<= "11";
				accumulatorFlagEnabler<='0'; accumulatorOutputSelector<= "10";
				DataMemoryRead<= '0'; DataMemoryWrite <= '0';
				ALU_Enabler<='0'; ALU_INVA <= '0'; ALU_CarryInEnabler <= '0'; ALU_operand<="00";

		WHEN Load =>    instructionRegisterLoad<='0';  
				programCounterLoader <= '0'; programCounterSelector<="11";
				accumulatorLoader <= '1'; accumulatorSelector<= "01";
				accumulatorFlagEnabler<='0'; accumulatorOutputSelector<= "10";
				DataMemoryRead<= '1'; DataMemoryWrite <= '0';
				ALU_Enabler<= '0'; ALU_INVA <= '0'; ALU_CarryInEnabler <= '0'; ALU_operand<="00";

		WHEN Store => instructionRegisterLoad<='0'; 
				programCounterLoader <= '0'; programCounterSelector<="11";
				accumulatorLoader <= '0'; accumulatorSelector<= "11";
				accumulatorFlagEnabler<='0';accumulatorOutputSelector<= "01";
				DataMemoryRead<= '0'; DataMemoryWrite <= '1';
				ALU_Enabler<= '0'; ALU_INVA <= '0'; ALU_CarryInEnabler <= '0'; ALU_operand<="00";

		WHEN SUM => instructionRegisterLoad<='0'; 
				programCounterLoader <= '0'; programCounterSelector<="11";
				accumulatorLoader <= '1'; accumulatorSelector<= "00";
				accumulatorFlagEnabler<='1';accumulatorOutputSelector<= "00";
				DataMemoryRead<= '1'; DataMemoryWrite <= '0';
				ALU_Enabler<='1'; ALU_INVA <= '0'; ALU_CarryInEnabler <= '0'; ALU_operand<="11";	
	
		WHEN SUB => instructionRegisterLoad<='0'; 
				programCounterLoader <= '0'; programCounterSelector<="11";
				accumulatorLoader <= '1'; accumulatorSelector<= "00";
				accumulatorFlagEnabler<='1';accumulatorOutputSelector<= "00";
				DataMemoryRead<= '1'; DataMemoryWrite <= '0';
				ALU_Enabler<='1'; ALU_INVA <= '1'; ALU_CarryInEnabler <= '1'; ALU_operand<="11";	

		WHEN JumpToZero => instructionRegisterLoad<='0'; 
				    IF zeroFlag = '1' THEN
        				programCounterLoader <= '1';
        				programCounterSelector <= "01";  
    				    ELSE
        			    programCounterLoader <= '1';
        				programCounterSelector <= "00";  
    				    END IF;
				accumulatorLoader <= '0'; accumulatorSelector<= "10";
				accumulatorFlagEnabler<='0';accumulatorOutputSelector<= "10";
				DataMemoryRead<= '0'; DataMemoryWrite <= '0';
				ALU_Enabler<='0'; ALU_INVA <= '0'; ALU_CarryInEnabler <= '0'; ALU_operand<="00";

		WHEN JumpToProgramStart => instructionRegisterLoad<='0'; 
			            IF carryFlag = '1' THEN
        				programCounterLoader <= '1';
        				programCounterSelector <= "11";  
    				    ELSE
        			    programCounterLoader <= '1';
        				programCounterSelector <= "00";  
    				    END IF;
				accumulatorLoader <= '0'; accumulatorSelector<= "10";
				accumulatorFlagEnabler<='0';accumulatorOutputSelector<= "10";
				DataMemoryRead<= '0'; DataMemoryWrite <= '0';
				ALU_Enabler<='0'; ALU_INVA <= '0'; ALU_CarryInEnabler <= '0'; ALU_operand<="00";

		WHEN JumpPosition => instructionRegisterLoad<='0'; 
				programCounterLoader <= '0'; programCounterSelector<="01";
				accumulatorLoader <= '0'; accumulatorSelector<= "11";
				accumulatorFlagEnabler<='0';accumulatorOutputSelector<= "10";
				DataMemoryRead<= '0'; DataMemoryWrite <= '0';
				ALU_Enabler<='0'; ALU_INVA <= '0'; ALU_CarryInEnabler <= '0'; ALU_operand<="00";

		WHEN defaultState => instructionRegisterLoad<='0'; 
				programCounterLoader <= '1'; programCounterSelector<="00";
				accumulatorLoader <= '0'; accumulatorSelector<= "11";
				accumulatorFlagEnabler<='0';accumulatorOutputSelector<= "10";
				DataMemoryRead<= '0'; DataMemoryWrite <= '0';
				ALU_Enabler<='0'; ALU_INVA <= '0'; ALU_CarryInEnabler <= '0'; ALU_operand<="00";
						
	END CASE;
END PROCESS;
				 		
END behavioural;
