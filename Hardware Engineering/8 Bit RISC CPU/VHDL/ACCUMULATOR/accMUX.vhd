library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity accMUX is
port(inALU, inDU: IN STD_LOGIC_VECTOR (7 downto 0);
	SEL: IN STD_LOGIC;
	DATA: OUT STD_LOGIC_VECTOR (7 downto 0)
);
end accMUX;

architecture behavioral of accMUX is
begin
with SEL select 
	DATA <= inALU when '0',
		 inDU when '1',
	(others => '0') when others;
end behavioral;

