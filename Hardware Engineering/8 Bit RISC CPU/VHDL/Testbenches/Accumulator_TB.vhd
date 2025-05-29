library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

ENTITY Accumulator_TB IS
END Accumulator_TB;

ARCHITECTURE simulation of Accumulator_TB IS
SIGNAl datafromALU_TB, dataFromDataUnit_tb, dataintoALU_tb, dataintoDataUnit_tb, outputForDisplay_TB: STD_LOGIC_VECTOR(7 downto 0);
SIGNAL clock_tb, load_tb, reset_tb, carryBit_tb, flagEnablerFromControlUnit_tb, 
	negativeFlag_tb, ZeroFlag_tb, carryFlag_tb,outputSelector_tb, sourceSelector_tb: STD_LOGIC;

COMPONENT Accumulator is 
port(datafromALU, datafromDataUnit: IN STD_LOGIC_VECTOR (7 downto 0);
	CLK, RST, EN, MUX_SEL, DEMUX_SEL,carryBit,flagEnablerFromControlUnit: IN STD_LOGIC;
	datatoALU, datatoDataUnit: OUT STD_LOGIC_VECTOR (7 downto 0);
	outputForDisplay: OUT STD_LOGIC_VECTOR(7 downto 0);
	negativeFlag         : OUT STD_LOGIC;
        ZeroFlag             : OUT STD_LOGIC;
        carryFlag            : OUT STD_LOGIC
);
end COMPONENT;

BEGIN

DUT100: Accumulator PORT MAP(datafromALU=>datafromALU_TB, dataFromDataUnit=>dataFromDataUnit_tb,
				datatoALU=>dataintoALU_tb,datatoDataUnit=>dataintoDataUnit_tb
				,CLK=>clock_tb,EN=>load_tb,RST=>reset_tb,
				carryBit=>carryBit_tb,flagEnablerFromControlUnit=>flagEnablerFromControlUnit_tb,
				negativeFlag=>negativeFlag_tb,ZeroFlag=>ZeroFlag_tb,carryFlag=>carryFlag_tb,
				DEMUX_SEL=>outputSelector_tb,MUX_SEL=>sourceSelector_tb, 
				outputForDisplay=> outputForDisplay_TB
				);



PROCESS
    BEGIN
        WHILE NOW < 100 NS LOOP
            clock_tb <= '0';
            WAIT FOR 5 NS;
            clock_tb <= '1';
            WAIT FOR 5 NS;
        END LOOP;
        WAIT;
END PROCESS;

reset_tb  	   		<= '1', '0' after 10 NS;
load_tb  	   		<= '0', '1' after 10 NS, '0' after 50 NS;
sourceSelector_tb  		<='0', '1' after 10 NS, '0' after 50 NS;
datafromALU_TB 	  		 <= "00000000", "11111111" after 10 NS, "11110000" after 20 NS, "00000000" after 30 NS;
dataFromDataUnit_tb 		<=  "00000000", "10101010" after 10 NS, "10111111" after 20 NS, "00000000" after 30 NS;
outputSelector_tb  		<='0', '0' after 30 NS, '1' after 40 NS, '0' after 50 NS;
flagEnablerFromControlUnit_tb   <= '0', '1' after 80 NS;
carryBit_tb  			<= '0', '1' after 50 NS;
END simulation;
