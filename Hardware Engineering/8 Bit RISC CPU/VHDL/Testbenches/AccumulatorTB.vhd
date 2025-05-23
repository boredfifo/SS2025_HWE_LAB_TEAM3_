library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

ENTITY Accumulator_TB IS
END Accumulator_TB;

ARCHITECTURE simulation of Accumulator_TB IS
SIGNAl datafromALU_TB, dataFromDataUnit_tb, dataintoALU_tb, dataintoDataUnit_tb: STD_LOGIC_VECTOR(7 downto 0);
SIGNAL clock_tb, load_tb, reset_tb, carryBit_tb, flagEnablerFromControlUnit_tb, negativeFlag_tb, ZeroFlag_tb, carryFlag_tb : STD_LOGIC;
SIGNAL sourceSelector_tb: STD_LOGIC_VECTOR(1 downto 0);
SIGNAL outputSelector_tb: STD_LOGIC;

COMPONENT Accumulator IS
    PORT(	
        datafromALU          : IN STD_LOGIC_VECTOR(7 downto 0);
        dataFromDataUnit     : IN STD_LOGIC_VECTOR(7 downto 0);
        clock, load, reset   : IN STD_LOGIC;
        sourceSelector       : IN STD_LOGIC_VECTOR(1 downto 0);
        carryBit             : IN STD_LOGIC;
        outputSelector       : IN STD_LOGIC;
        
        dataintoALU          : OUT STD_LOGIC_VECTOR(7 downto 0);
        dataintoDataUnit     : OUT STD_LOGIC_VECTOR(7 downto 0);
        --myOutputSignal       : OUT STD_LOGIC_VECTOR(7 downto 0);
        flagEnablerFromControlUnit : IN STD_LOGIC;
        
        negativeFlag         : OUT STD_LOGIC;
        ZeroFlag             : OUT STD_LOGIC;
        carryFlag            : OUT STD_LOGIC
    );
END COMPONENT;

BEGIN
DUT100: Accumulator PORT MAP(datafromALU=>datafromALU_TB, dataFromDataUnit=>dataFromDataUnit_tb,dataintoALU=>dataintoALU_tb,dataintoDataUnit=>dataintoDataUnit_tb
				,clock=>clock_tb,
				load=>load_tb,reset=>reset_tb,carryBit=>carryBit_tb,flagEnablerFromControlUnit=>flagEnablerFromControlUnit_tb,
				negativeFlag=>negativeFlag_tb,ZeroFlag=>ZeroFlag_tb,carryFlag=>carryFlag_tb,
				outputSelector=>outputSelector_tb,sourceSelector=>sourceSelector_tb);


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

reset_tb  	   		<= '1', '0' after 10 NS, 									'1' after 100 NS;
load_tb  	   		<= '0', '1' after 10 NS, 			'0' after 50 NS;
sourceSelector_tb  		<="00", "01" after 20 NS, "11" after 30 NS;
datafromALU_TB 	  		 <= "10101111", "11111111" after 10 NS;
dataFromDataUnit_tb 		<=  "00001111", "10101010" after 10 NS;
outputSelector_tb  		<='0', '0' after 30 NS, '1' after 40 NS, '0' after 50 NS;
flagEnablerFromControlUnit_tb   <= '0', 									'1' after 80 NS;
carryBit_tb  			<= '0', 					'1' after 50 NS;
END simulation;
