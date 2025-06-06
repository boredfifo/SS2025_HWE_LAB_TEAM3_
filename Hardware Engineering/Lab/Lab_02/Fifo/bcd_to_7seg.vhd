entity bcd_to_7seg is
port(bcd: IN BIT_VECTOR (3 downto 0);
	segDisp: OUT BIT_VECTOR (6 downto 0));
end bcd_to_7seg;

architecture behavioral of bcd_to_7seg is
begin
with bcd select

    segDisp <= 
	"1000000" when "0000",  -- 0 
 	"1001111" when "0001",  -- 1
	"0100100" when "0010",  -- 2 
	"0110000" when "0011",  -- 3 
	"0011001" when "0100",  -- 4 
	"0010010" when "0101",  -- 5 
	"0000010" when "0110",  -- 6 
	"1111000" when "0111",  -- 7 
	"0000000" when "1000",  -- 8 
	"0010000" when "1001",  -- 9 
	"1111111" when others;  -- 

end behavioral;

