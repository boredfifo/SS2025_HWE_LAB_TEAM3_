library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

ENTITY IR IS
PORT(ControlClock, Loader, ControlReset: IN STD_LOGIC;
	AddressFromInstructionMemory: IN STD_LOGIC_VECTOR(7 downto 0);
	OpCodeForControlUnit: OUT STD_LOGIC_VECTOR(2 downto 0);
	OperandForJump_Data_ALU_Instruction: OUT STD_LOGIC_VECTOR(4 downto 0)
	
);
END IR;

ARCHITECTURE behavioural OF IR IS
SIGNAL OPCode: STD_LOGIC_VECTOR(2 downto 0);
SIGNAL Operand: STD_LOGIC_VECTOR(4 downto 0);
BEGIN
PROCESS(ControlClock, ControlReset)
BEGIN
if ControlReset = '1' then
OPCode <= "000";
Operand<="00000";
elseif ControlClock'event and ControlClock = '1'  then
	if Loader = '1' then
	OPCode <= AddressFromInstructionMemory(7 downto 5);
	Operand <= AddressFromInstructionMemory(4 downto 0);
	end if;
end if;
end process;

OpCodeForControlUnit<=OPCode;
OperandForJump_Data_ALU_Instruction<= Operand;



END behavioural;
