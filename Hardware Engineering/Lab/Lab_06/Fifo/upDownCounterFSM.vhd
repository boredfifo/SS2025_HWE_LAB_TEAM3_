library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity upDownCounter is
port(CLK, EN, RST, PB: IN BIT; --pb is push button
	outputfor7seg: OUT BIT_VECTOR(2 downto 0)
);
end upDownCounter;

architecture behavioral of upDownCounter is
type state is (s0, s1, s2, s3, s4, s5, s6, s7);
signal current_state, next_state: state;

begin
next_state_logic : process(current_state, PB)
begin
	case(current_state) is 
	when s0 =>
		if PB = '1' then
		next_state <= s0;
		elsif PB = '0' then next_state <= s1;
		end if;
	when s1 =>
		if PB = '1' then
		next_state <= s0;
		elsif PB = '0' then next_state <= s2;
		end if;
	when s2 =>
		if PB = '1' then
		next_state <= s1;
		elsif PB = '0' then next_state <= s3;
		end if;
	when s3 =>
		if PB = '1' then
		next_state <= s2;
		elsif PB = '0' then next_state <= s4;
		end if;
	when s4 =>
		if PB = '1' then
		next_state <= s3;
		elsif PB = '0' then next_state <= s5;
		end if;
	when s5 =>
		if PB = '1' then
		next_state <= s4;
		elsif PB = '0' then next_state <= s6;
		end if;
	when s6 =>
		if PB = '1' then
		next_state <= s5;
		elsif PB = '0' then next_state <= s7;
		end if;
	when s7 =>
		if PB = '1' then
		next_state <= s6;
		elsif PB = '0' then next_state <= s6;
		end if;
	end case;
end process;

next_state_memory: process(CLK, RST)
 begin
		if (RST = '1') then 
			current_state <= s0;
		elsif(CLK'event and CLK = '1') then
			if (EN <= '1') then
				current_state <= next_state;
		        end if;
		end if;
end process;

output_logic: process(current_state)
begin
	case (current_state) is
		when s0 => 
			outputfor7seg <= "000";
		when s1 => 
			outputfor7seg <= "001";
		when s2 => 
			outputfor7seg <= "010";
		when s3 => 
			outputfor7seg <= "011";	
		when s4 => 
			outputfor7seg <= "100";
		when s5 => 
			outputfor7seg <= "101";
		when s6 => 
			outputfor7seg <= "110";
		when s7 => 
			outputfor7seg <= "111";
	end case;
end process;

end behavioral;
