entity bcd_to_7seg is
port(bcd: IN BIT_VECTOR (3 downto 0);
	segDisp: OUT BIT_VECTOR (6 downto 0));
end bcd_to_7seg;

architecture behavioral of bcd_to_7seg is
begin
with bcd select

    segDisp <= "1111110" when "0000",  -- 0
               "0110000" when "0001",  -- 1
               "1101101" when "0010",  -- 2
               "1111001" when "0011",  -- 3
               "0110011" when "0100",  -- 4
               "1011011" when "0101",  -- 5
               "1011111" when "0110",  -- 6
               "1110000" when "0111",  -- 7
               "1111111" when "1000",  -- 8
               "1111011" when "1001",-- 9
		"0000000" when others;

end behavioral;

