library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

ENTITY IR_tb IS
END IR_tb;

ARCHITECTURE simulation OF IR_tb IS
SIGNAL ControlClock_tb, Loader_tb, ControlReset_tb: STD_LOGIC;
SIGNAL AddressFromInstructionMemory_tb: STD_LOGIC_VECTOR(7 downto 0);
SIGNAL OpCodeForControlUnit_tb: STD_LOGIC_VECTOR(2 downto 0);
SIGNAL OperandForJump_Data_ALU_Instruction_tb: STD_LOGIC_VECTOR(4 downto 0);

COMPONENT IR IS
PORT(ControlClock, Loader, ControlReset: IN STD_LOGIC;
	AddressFromInstructionMemory: IN STD_LOGIC_VECTOR(7 downto 0);
	OpCodeForControlUnit: OUT STD_LOGIC_VECTOR(2 downto 0);
	OperandForJump_Data_ALU_Instruction: OUT STD_LOGIC_VECTOR(4 downto 0)
	
);
END COMPONENT;

BEGIN
DUT011: IR PORT MAP(ControlClock=>ControlClock_tb, Loader=>Loader_tb,ControlReset=>ControlReset_tb,
			AddressFromInstructionMemory=>AddressFromInstructionMemory_tb,
			OpCodeForControlUnit=>OpCodeForControlUnit_tb,OperandForJump_Data_ALU_Instruction=>OperandForJump_Data_ALU_Instruction_tb);


PROCESS
    BEGIN
        WHILE NOW < 100 NS LOOP
            ControlClock_tb <= '0';
            WAIT FOR 5 NS;
            ControlClock_tb <= '1';
            WAIT FOR 5 NS;
        END LOOP;
        WAIT;
END PROCESS;

Loader_tb <='0', '1' after 10 NS;
ControlReset_tb<='1', '0' after 10 NS, '1' after 20 NS;
AddressFromInstructionMemory_tb<="00000000", "00000011" after 10 NS;

END simulation;