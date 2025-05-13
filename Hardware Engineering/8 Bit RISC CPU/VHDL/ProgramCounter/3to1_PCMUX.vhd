library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity PC_MUX is
port(currPC,jumpADDR: IN STD_LOGIC_VECTOR (7 downto 0);
	sel: IN STD_LOGIC_VECTOR (1 downto 0);
	final_PC: OUT STD_LOGIC_VECTOR (7 downto 0));
end PC_MUX;

architecture behavioral of PC_MUX is
begin
with sel select
final_PC <= currPC when "00",
	    jumpADDR when "01",
		"00000000" when "10",
		(others => '0') when others;
end behavioral;

