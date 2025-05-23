library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity instruction_memoryUnit is
port(pcAddress: IN STD_LOGIC_VECTOR (7 downto 0);
	instruction: OUT STD_LOGIC_VECTOR (7 downto 0));
end instruction_memoryUnit;

architecture structural of instruction_memoryUnit is
begin
with pcAddress select                     --INSTRUCTION SET
instruction <=  "10000000" when "00000001", --NO OP 3
		"00000011" when "00000010", --LOAD 3
--		"01000100" when "00000011", --ADD 4
--		"00100011" when "00000100", --STORE 3
--		"01100101" when "00000101", --SUB 5
--		"10000000" when "00000110", --JZ 0
--		"11000001" when "00000111", --JUMP 1
		"10000000" when others;
end structural;
	
