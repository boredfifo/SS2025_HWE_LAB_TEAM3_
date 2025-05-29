library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

ENTITY TopLevelCPU_TB IS

END TopLevelCPU_TB;

ARCHITECTURE simulation OF TopLevelCPU_TB IS
SIGNAL globalCLK_TB, RESET_TB, carry_TB: STD_LOGIC;
SIGNAL outputFor7seg_TB: STD_LOGIC_VECTOR(7 downto 0);

COMPONENT TopLevelCPU IS
PORT(globalCLK, RESET : IN STD_LOGIC;
    outputFor7seg: OUT STD_LOGIC_VECTOR(7 downto 0);
    carry : OUT std_logic
    );
END COMPONENT;

BEGIN

DUT111: TopLevelCPU PORT MAP(globalCLK=>globalCLK_TB,RESET=>RESET_TB,outputFor7seg=>outputFor7seg_TB,carry=>carry_TB);

PROCESS
    BEGIN
        WHILE NOW < 500 NS LOOP
            globalCLK_TB <= '0';
            WAIT FOR 5 NS;
            globalCLK_TB <= '1';
            WAIT FOR 5 NS;
        END LOOP;
        WAIT;
END PROCESS;

RESET_TB<= '1', '0' after 10 NS;

END simulation;