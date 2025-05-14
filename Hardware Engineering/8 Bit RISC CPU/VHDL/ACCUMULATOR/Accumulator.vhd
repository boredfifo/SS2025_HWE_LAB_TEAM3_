library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

ENTITY Accumulator IS
PORT(	
	datafromALU: IN STD_LOGIC_VECTOR(7 downto 0);
	dataFromUser: IN STD_LOGIC_VECTOR(7 downto 0);
	dataFromMemory: IN STD_LOGIC_VECTOR(7 downto 0);
	clock, load, reset: IN STD_LOGIC;
	sourceSelector: IN STD_LOGIC_VECTOR(1 downto 0);
	carryBit: IN STD_LOGIC;

	dataintoALU: OUT STD_LOGIC_VECTOR(7 downto 0);
	positiveFlag, ZeroFlag, carryFlag: OUT STD_LOGIC);
END Accumulator;

ARCHITECTURE BEHAVIOURAL Of Accumulator IS

SIGNAL accumulatorDecode: STD_LOGIC_VECTOR(7 downto 0);
BEGIN

PROCESS(clock, reset)
VARIABLE temporaryVariable: STD_LOGIC_VECTOR(7 downto 0);
BEGIN
	if reset = '1' then
		accumulatorDecode <= (OTHERS => '0');
	elsif rising_edge(clock) then
		IF load = '1' then
                	CASE sourceSelector is
                    		WHEN "00" => temporaryVariable := datafromALU;
                    		WHEN "01" => temporaryVariable := dataFromMemory;
                    		WHEN "10" => temporaryVariable := dataFromUser;
                    		WHEN OTHERS => temporaryVariable := (OTHERS => '0');
                	END CASE;
           	 	
			accumulatorDecode <= temporaryVariable;
				
		END IF;
	
	END IF;
END PROCESS;
		dataintoALU <= accumulatorDecode;

WITH accumulatorDecode SELECT
		ZeroFlag <= '1' WHEN "00000000",
			    '0' WHEN OTHERS;

WITH accumulatorDecode(7) SELECT
		positiveFlag <= '1' WHEN '0',
				'0' WHEN OTHERS;

WITH carryBit SELECT
		carryFlag <= '1' WHEN '1',
				'0' WHEN OTHERS;
			
		
END BEHAVIOURAL;
