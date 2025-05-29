library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity dataDemux is
port(dataOutput: IN STD_LOGIC_VECTOR (7 downto 0);
	SEL: IN STD_LOGIC;
	toAccu, toALU: OUT STD_LOGIC_VECTOR (7 downto 0)
);
end dataDemux;

architecture behavioral of dataDemux is
begin
    process(dataOutput, SEL)
    begin
        if SEL = '1' then
            toAccu        <= dataOutput;
            toALU <= (others => '0');
        else
            toAccu        <= (others => '0');
            toALU <= dataOutput;
        end if;
    end process;
end behavioral;
