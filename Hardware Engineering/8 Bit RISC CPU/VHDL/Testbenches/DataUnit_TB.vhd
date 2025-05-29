library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity data_memoryUnit_TB is
end data_memoryUnit_TB;

ARCHITECTURE simulation OF data_memoryUnit_TB IS
SIGNAL dataAddress_tb:STD_LOGIC_VECTOR (4 downto 0);
SIGNAL dataIN_tb, outputToAccumulator_tb, outputToALU_tb:STD_LOGIC_VECTOR(7 downto 0);
SIGNAL CLK_tb, MEM_WRITE_tb, MEM_READ_tb, OutputSelector_tb:STD_LOGIC;

COMPONENT data_memoryUnit is
port(dataAddress: IN STD_LOGIC_VECTOR (4 downto 0);
	dataIN: IN STD_LOGIC_VECTOR(7 downto 0);
	outputToAccumulator, outputToALU: OUT STD_LOGIC_VECTOR (7 downto 0);
	CLK, MEM_WRITE, MEM_READ, OutputSelector: IN STD_LOGIC);
end COMPONENT;

BEGIN
DUT010: data_memoryUnit PORT MAP(dataAddress=>dataAddress_tb, dataIN=>dataIN_tb, outputToAccumulator=>outputToAccumulator_tb,outputToALU=>outputToALU_tb,
				CLK=>CLK_tb, MEM_WRITE=>MEM_WRITE_tb, MEM_READ=>MEM_READ_tb,OutputSelector=>OutputSelector_tb );

PROCESS
    BEGIN
        WHILE NOW < 100 NS LOOP
            CLK_TB <= '0';
            WAIT FOR 5 NS;
            CLK_TB <= '1';
            WAIT FOR 5 NS;
        END LOOP;
        WAIT;
END PROCESS;

MEM_WRITE_tb    <='1', '0' after 10 NS;
MEM_READ_tb    <='0', '1' after 10 NS;
dataAddress_tb    <="00000", "00000" after 20 NS, "00100" after 30 NS, "00000" after 40 NS;
dataIN_tb    <= "11111111";


END simulation;