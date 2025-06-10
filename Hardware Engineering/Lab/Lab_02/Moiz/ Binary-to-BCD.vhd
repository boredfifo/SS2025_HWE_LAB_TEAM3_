entity bin_to_bcd is 
port (bin : IN BIT_VECTOR (3 downto 0);
	bcd1: out bit_vector (3 downto 0);
	bcd2: out bit_vector (3 downto 0));

end bin_to_bcd;

architecture behavioral of bin_to_bcd is
begin 
with bin select 

 bcd1 <= "0000" when "0000",
	"0000" when "0001",
	"0000" when "0010",
	"0000" when "0011",
	"0000" when "0100",
	"0000" when "0101",
	"0000" when "0110",
	"0000" when "0111",
	"0000" when "1000",
	"0000" when "1001",
	"0001" when "1010",
	"0001" when "1011",
	"0001" when "1100",
	"0001" when "1101",
	"0001" when "1110",
	"0001" when "1111";

with bin select

 bcd2 <= "0000" when "0000",
	"0001" when "0001",
	"0010" when "0010",
	"0011" when "0011",
	"0100" when "0100",
	"0101" when "0101",
	"0110" when "0110",
	"0111" when "0111",
	"1000" when "1000",
	"1001" when "1001",
	"0000" when "1010",
	"0001" when "1011",
	"0010" when "1100",
	"0011" when "1101",
	"0100" when "1110",
	"0101" when "1111";
	
end behavioral;