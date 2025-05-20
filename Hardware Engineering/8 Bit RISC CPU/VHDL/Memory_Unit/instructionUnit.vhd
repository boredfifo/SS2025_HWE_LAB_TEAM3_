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
instruction <= "00001000" when "00000001", --LOAD
		"00110001" when "00000010", --STORE
		"01011010" when "00000011", --ADD
		"01100011" when "00000100", --SUB
	--	"10001100" when "00000101", --IN
		"10010100" when "00000110", --OUT
		"10111101"  when "00000111", --JZ
		"11000110" when "00001000", --JPOS
		"11101111" when "00001001", --J
		"00000000" when others;
end structural;
