library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity controlLED is
    Port ( BTNU : in STD_LOGIC;
           LED0 : out STD_LOGIC);
end controlLED;

architecture Behavioral of controlLED is

begin
LED0 <= BTNU;

end Behavioral;
