library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

ENTITY Accumulator IS
PORT(	
	datafromALU: IN STD_LOGIC_VECTOR(7 downto 0);
	dataFromDataUnit: IN STD_LOGIC_VECTOR(7 downto 0);
	clock, load, reset: IN STD_LOGIC;
	sourceSelector: IN STD_LOGIC_VECTOR(1 downto 0);
	carryBit: IN STD_LOGIC;

    outputSelector: IN STD_LOGIC_VECTOR(1 downto 0);
	dataintoALU: OUT STD_LOGIC_VECTOR(7 downto 0);
	dataintoDataUnit: OUT STD_LOGIC_VECTOR(7 downto 0);
	myOutputSignal: OUT STD_LOGIC_VECTOR(7 downto 0);
	flagEnablerFromControlUnit: IN STD_LOGIC;
	negativeFlag, ZeroFlag, carryFlag: OUT STD_LOGIC);

	
END Accumulator;

ARCHITECTURE BEHAVIOURAL Of Accumulator IS

SIGNAL accumulatorDecode: STD_LOGIC_VECTOR(7 downto 0);
SIGNAL AccumulatorToALU         : STD_LOGIC_VECTOR(7 downto 0);
SIGNAL AccumulatorToDataUnit    : STD_LOGIC_VECTOR(7 downto 0);
BEGIN

PROCESS(clock, reset)
BEGIN
	if reset = '1' then
		accumulatorDecode <= (OTHERS => '0');
	elsif rising_edge(clock) then
		IF load = '1' then
			CASE sourceSelector IS
    				WHEN "00" => accumulatorDecode <= datafromALU;
    				WHEN "01" => accumulatorDecode <= dataFromDataUnit;
    				WHEN "10" => accumulatorDecode <= accumulatorDecode; -- Load previous value
    				WHEN OTHERS => accumulatorDecode <= (others => '0'); -- Optional: default clear
			END CASE;
           	 	
		  END IF;
	
	END IF;
END PROCESS;

PROCESS(clock, reset)
BEGIN
    IF reset = '1' THEN
        aluOutReg <= (OTHERS => '0');
        dataUnitOutReg <= (OTHERS => '0');
    ELSIF rising_edge(clock) THEN
        CASE outputSelector IS
            WHEN "00" => AccumulatorToALU <= accumulatorDecode;
            WHEN "01" => dataUnitOutReg <= accumulatorDecode;
            WHEN OTHERS =>
                AccumulatorToALU <= AccumulatorToALU;
                AccumulatorToDataUnit <= AccumulatorToDataUnit;
        END CASE;
    END IF;
END PROCESS;


dataintoALU      <= AccumulatorToALU;
dataintoDataUnit <= AccumulatorToDataUnit;
myOutputSignal   <= accumulatorDecode;
               	
                	

PROCESS(accumulatorDecode, carryBit, flagEnablerFromControlUnit)
BEGIN
	IF flagEnablerFromControlUnit = '1' then
		IF accumulatorDecode = "00000000" THEN
			ZeroFlag <= '1';
		ELSE
			ZeroFlag <= '0';
		END IF;

		negativeFlag <= accumulatorDecode(7); 

		carryFlag <= carryBit;
	ELSE
		ZeroFlag <= '0';
		negativeFlag <= '0';
		carryFlag <= '0';
	END IF;
END PROCESS;
			
		
END BEHAVIOURAL;
