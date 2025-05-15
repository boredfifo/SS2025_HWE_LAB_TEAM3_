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
		"00010001" when "00000010", --STORE
		"00011010" when "00000011", --ADD
		"00100011" when "00000100", --SUB
		"00101100" when "00000101", --IN
		"00110100" when "00000110", --OUT
		"00111101"  when "00000111", --JZ
		"01000110" when "00001000", --JPOS
		"01001111" when "00001001", --J
		"00000000" when others;
end structural;
