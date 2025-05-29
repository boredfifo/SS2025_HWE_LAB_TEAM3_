library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity accDEMUXTB is 
end accDEMUXTB;

architecture behavioral of accDEMUXTB is
component accDEMUX
port(accOUTPUT: IN STD_LOGIC_VECTOR (7 downto 0);
	SEL: IN STD_LOGIC;
	toALU, todataMEMORY: OUT STD_LOGIC_VECTOR (7 downto 0)
);
end component;
signal accOUTPUT_TB, toALU_TB, MEM_TB: STD_LOGIC_VECTOR (7 downto 0);
signal  SEL_TB: STD_LOGIC;
begin
DUT500: accDEMUX port map (accOUTPUT=>accOUTPUT_TB, SEL=>SEL_TB, toALU=>toALU_TB, todataMEMORY=>MEM_TB);
SEL_TB <= '0', '0' after 10 ns,'1' after 20 ns,'0' after 30 ns;
accOUTPUT_TB <= "00000000", "10000100" after 10 ns, "10000100" after 20 ns, "00000000" after 30 ns;
end behavioral;
