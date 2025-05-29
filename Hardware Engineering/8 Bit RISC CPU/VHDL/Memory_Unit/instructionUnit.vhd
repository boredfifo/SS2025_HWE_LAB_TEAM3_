library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity instruction_memoryUnit is
port(pcAddress: IN STD_LOGIC_VECTOR (7 downto 0);
	instruction: OUT STD_LOGIC_VECTOR (7 downto 0));
end instruction_memoryUnit;

architecture structural of instruction_memoryUnit is
begin

process(pcAddress)
begin
		CASE(pcAddress) IS
				WHEN "00000000" => instruction<="00000000"; 
				WHEN "00000001" => instruction<="10011110";	--Load 250 from address 30
				WHEN "00000010" => instruction<="01000001";	--Add 1
				WHEN "00000011" => instruction<="00111110";	--Store result where 250 was stored
				WHEN "00000100" => instruction<="11000001";	--Jump	to program counter 00000001 if no carry flag
				WHEN "00000101" => instruction<="10001010";	--Load 10
            	WHEN OTHERS => instruction <= "00000000"; -- No Operation
		END CASE;

END PROCESS;

end structural;

--		CASE(pcAddress) IS
--				WHEN "00000000" => instruction<="00000000"; 
--				WHEN "00000001" => instruction<="10011111";	--Load 255 from address 31
--				WHEN "00000010" => instruction<="01000001";	--Add 1
--				WHEN "00000011" => instruction<="11000001";	--Jump	to program counter 00000001 if no carry flag
--				WHEN "00000100" => instruction<="10001010";	--Load 10
--            	WHEN OTHERS => instruction <= "00000000"; -- No Operation
--		END CASE;

--		CASE(pcAddress) IS
--				WHEN "00000000" => instruction<="00000000"; 
--				WHEN "00000001" => instruction<="10011110";	--Load 250 from address 30
--				WHEN "00000010" => instruction<="01000001";	--Add 1
--				WHEN "00000011" => instruction<="11000001";	--Jump	to program counter 00000001 if no carry flag
--				WHEN "00000100" => instruction<="10001010";	--Load 10
--            	WHEN OTHERS => instruction <= "00000000"; -- No Operation
--		END CASE;

--		CASE(pcAddress) IS
--				WHEN "00000000" => instruction<="00000000"; 
--				WHEN "00000001" => instruction<="10000100";	--Load	
--				WHEN "00000010" => instruction<="00100011";	--Store
--				WHEN "00000011" => instruction<="10000011";	--Load
--            			WHEN OTHERS => 
--                		instruction <= "00000000"; -- No Operation
--		END CASE;
	

--		CASE(pcAddress) IS
--				WHEN "00000000" => instruction<="00000000"; 
--				WHEN "00000001" => instruction<="10000110";	--Load	
--				WHEN "00000010" => instruction<="01000011";	--Add
--				WHEN "00000011" => instruction<="00100000";	--Store					
--				WHEN "00000100" => instruction<="10000000";	--Load				
--            			WHEN OTHERS => 
--                		instruction <= "00000000";
--		END CASE;

--		CASE(pcAddress) IS
--				WHEN "00000000" => instruction<="00000000"; 
--				WHEN "00000001" => instruction<="10000110";	--Load 6	
--				WHEN "00000010" => instruction<="01100001";	--Sub  1
--				WHEN "00000011" => instruction<="00100011";	--Store
--				WHEN "00000100" => instruction<="10000011";	--Load				
--            			WHEN OTHERS => 
--                		instruction <= "00000000";
--		END CASE;
		
--				CASE(pcAddress) IS
--				WHEN "00000000" => instruction<="00000000"; 
--				WHEN "00000001" => instruction<="10000110";	--Load	
--				WHEN "00000010" => instruction<="11100011";	--AND
--				WHEN "00000011" => instruction<="00100011";	--Store
--				WHEN "00000100" => instruction<="10000011";	--Load				
--            			WHEN OTHERS => 
--                		instruction <= "00000011";
--		END CASE;


--		CASE(pcAddress) IS
--				WHEN "00000000" => instruction<="00000000"; 
--				WHEN "00000001" => instruction<="10000110";	--Load	
--				WHEN "00000010" => instruction<="10100011";	--OR
--				WHEN "00000011" => instruction<="00100011";	--Store
--				WHEN "00000100" => instruction<="10000011";	--Load				
--            			WHEN OTHERS => 
--                		instruction <= "00000011";
--		END CASE;
