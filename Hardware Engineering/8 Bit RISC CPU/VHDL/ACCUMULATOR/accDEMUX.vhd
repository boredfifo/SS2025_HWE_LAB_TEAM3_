library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity accDEMUX is
port(accOUTPUT: IN STD_LOGIC_VECTOR (7 downto 0);
	SEL: IN STD_LOGIC;
	toALU, todataMEMORY: OUT STD_LOGIC_VECTOR (7 downto 0)
);
end accDEMUX;

architecture behavioral of accDEMUX is
begin
    process(accOUTPUT, SEL)
    begin
        if SEL = '0' then
            toALU        <= accOUTPUT;
            todataMEMORY <= (others => '0');
        else
            toALU        <= (others => '0');
            todataMEMORY <= accOUTPUT;
        end if;
    end process;
end behavioral;
