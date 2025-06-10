entity bcd_to_7seg is

port (bcd : in bit_vector (3 downto 0);
	sevseg : out bit_vector (6 downto 0));

end bcd_to_7seg;

architecture behavioral of bcd_to_7seg is 

begin 

with bcd select

sevseg <= "0000000" when "0000", -- 0
	"0000001" when "0001",
	"0000010" when "0010",
	"0000011" when "0011",
	"0000100" when "0100",
	"0000101" when "0101",
	"0000110" when "0110",
	"0000111" when "0111",
	"0001000" when "1000",
	"0001001" when "1001", -- 9
	"1111111" when others;

end behavioral;

