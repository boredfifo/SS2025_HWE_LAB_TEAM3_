library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

ENTITY controlUnit_tb IS
END controlUnit_tb;

ARCHITECTURE simulation OF controlUnit_tb IS
SIGNAL	OPCodeFromInstructionRegister_tb:  STD_LOGIC_VECTOR(2 downto 0);
SIGNAL	instructionRegisterLoad_tb:  STD_LOGIC;
	
SIGNAL	clock_tb, rst_tb:  STD_LOGIC;

SIGNAL	programCounterSelector_tb:	  STD_LOGIC_VECTOR(1 downto 0);
SIGNAL	programCounterLoader_tb:  STD_LOGIC;

SIGNAL	accumulatorLoader_tb:  STD_LOGIC;
SIGNAL	accumulatorSelector_tb:  STD_LOGIC;
SIGNAL	accumulatorFlagEnabler_tb:  STD_LOGIC;
SIGNAL	accumulatorOutputSelector_tb:  STD_LOGIC;

SIGNAL	DataMemoryRead_tb:  STD_LOGIC;
SIGNAL	DataMemoryWrite_tb:  STD_LOGIC;

	
SIGNAL	ALU_operand_tb:  STD_LOGIC_VECTOR(1 downto 0);
SIGNAL	ALU_Enabler_tb, ALU_INVA_tb :  STD_LOGIC;
SIGNAL	ALU_CarryInEnabler_tb :  STD_LOGIC;

SIGNAL	negativeFlag_tb, zeroFlag_tb,carryFlag_tb:  STD_LOGIC;


COMPONENT controlUnit IS
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

	
	ALU_operand: OUT STD_LOGIC_VECTOR(1 downto 0);
	ALU_Enabler, ALU_INVA : OUT STD_LOGIC;
	ALU_CarryInEnabler : OUT STD_LOGIC;

	negativeFlag, zeroFlag,carryFlag: IN STD_LOGIC
	
);
END COMPONENT;
BEGIN
DUT110: controlUnit PORT MAP(	OPCodeFromInstructionRegister=>OPCodeFromInstructionRegister_tb,
				instructionRegisterLoad=>instructionRegisterLoad_tb,clock=>clock_tb,
				rst=>rst_tb,programCounterSelector=>programCounterSelector_tb,
				programCounterLoader=>programCounterLoader_tb,accumulatorLoader=>accumulatorLoader_tb,
				accumulatorSelector=>accumulatorSelector_tb,accumulatorFlagEnabler=>accumulatorFlagEnabler_tb,
				accumulatorOutputSelector=>accumulatorOutputSelector_tb,DataMemoryRead=>DataMemoryRead_tb,
				DataMemoryWrite=>DataMemoryWrite_tb,ALU_operand=>ALU_operand_tb,
				ALU_Enabler=>ALU_Enabler_tb,ALU_INVA=>ALU_INVA_tb,
				ALU_CarryInEnabler=>ALU_CarryInEnabler_tb,
				negativeFlag=>negativeFlag_tb,zeroFlag=>zeroFlag_tb,
				carryFlag=>carryFlag_tb);
PROCESS
    BEGIN
        WHILE NOW < 500 NS LOOP
            clock_tb <= '0';
            WAIT FOR 5 NS;
            clock_tb <= '1';
            WAIT FOR 5 NS;
        END LOOP;
        WAIT;
END PROCESS;

rst_tb<='1', '0' after 10 NS, '1' after 350 NS;

OPCodeFromInstructionRegister_tb<="100","000" after 80 NS,"001" after 110 NS,"010" after 140 NS,
					"011" after 180 NS,"101" after 220 NS,
					"110" after 260 NS, "111" after 300 NS ;

carryFlag_tb<=  '0', '1' after 120 NS, '0' after 250 NS;
negativeFlag_tb<=  '0';
zeroFlag_tb<= '0';

END simulation;