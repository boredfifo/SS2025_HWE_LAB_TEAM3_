library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity instruction_memoryUnit_TB is
end instruction_memoryUnit_TB;

ARCHITECTURE simulation OF instruction_memoryUnit_TB IS
SIGNAL pcAddress_tb, instruction_tb: STD_LOGIC_VECTOR (7 downto 0);

COMPONENT instruction_memoryUnit is
port(pcAddress: IN STD_LOGIC_VECTOR (7 downto 0);
	instruction: OUT STD_LOGIC_VECTOR (7 downto 0));
end COMPONENT;

BEGIN

DUT001: instruction_memoryUnit PORT MAP (pcAddress=>pcAddress_tb, instruction=>instruction_tb);

pcAddress_tb<= "00000000", "00000001" after 10 NS, "00000010" after 20 NS, "00000011" after 30 NS, "00000100" after 40 NS, "11111111" after 50 NS, "00000000" after 60 NS;


END simulation;
