entity bcd_adder is 
port(bcd_a, bcd_b: IN BIT_VECTOR (3 downto 0);
	sum_a, sum_b: OUT BIT_VECTOR (3 downto 0)
);
end bcd_adder;

architecture behavioral of bcd_adder is 

component four_bit_adder
port(a1, a2, a3, a4, b1, b2, b3, b4: IN BIT;
	s1, s2, s3, s4, c_o: OUT BIT);
end component;

component bin_to_bcd
port (bin : IN BIT_VECTOR (3 downto 0);
	bcd_1 : OUT BIT_VECTOR (3 downto 0);
	bcd_2: OUT BIT_VECTOR (3 downto 0));
end component;

signal m1, m2, m3, m4, m5, m6, m7, corr, six, zero: BIT_VECTOR (3 downto 0);
signal check_bit: BIT;
begin
UT1: bin_to_bcd port map (bin => bcd_a, bcd_1 => m1, bcd_2 => m2);
UT2: bin_to_bcd port map (bin => bcd_b, bcd_1 => m3, bcd_2 => m4);

UT3: four_bit_adder port map (a1 => m1(0), a2 => m1(1), a3 => m1(2), a4 => m1(3), b1=>m3(0), b2 => m3(1), b3=>m3(2),
b4=> m3(3), s1 => m5(0), s2 => m5(1), s3 => m5(2), s4=>m5(3), c_o => open);

UT4: four_bit_adder port map (a1 => m2(0), a2 => m2(1), a3 => m2(2), a4 => m2(3), b1=>m4(0), b2 => m4(1), b3=>m4(2),
b4=> m4(3), s1 => m6(0), s2 => m6(1), s3 => m6(2), s4=>m6(3), c_o => open);


with m6 select
check_bit <= '1' when "1010", 
	'1' when "1011",
 	'1' when "1100",
	'1' when "1101",
	'1' when "1110",
	'1' when "1111",
	'0' when others;

six <= "0110";
zero <= "0000";

with check_bit select
corr <= six when '1', 
	zero when others;

UT5: four_bit_adder port map (a1 => m6(0), a2 => m6(1), a3 => m6(2), a4 => m6(3), b1=>corr(0), b2 => corr(1), b3=>corr(2),
b4=> corr(3), s1 => sum_a(0), s2 => sum_a(1), s3 => sum_a(2), s4=>sum_a(3), c_o => m7(0));

UT6: four_bit_adder port map (a1 => m5(0), a2 => m5(1), a3 => m5(2), a4 => m5(3), b1=>m7(0), b2 => '0', b3=>'0',
b4=> '0', s1 => sum_b(0), s2 => sum_b(1), s3 => sum_b(2), s4=>sum_b(3), c_o => open);


end behavioral;
