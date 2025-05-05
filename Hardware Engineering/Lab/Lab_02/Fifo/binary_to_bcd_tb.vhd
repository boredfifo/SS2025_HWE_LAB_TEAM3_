entity bin_to_bcd_tb is
end bin_to_bcd_tb;

architecture behavioral of bin_to_bcd_tb is
component bin_to_bcd
port (bin : IN BIT_VECTOR (3 downto 0);
	bcd_1 : OUT BIT_VECTOR (3 downto 0);
	bcd_2: OUT BIT_VECTOR (3 downto 0));
end component;

signal bin_tb : BIT_VECTOR (3 downto 0);
signal bcd1_tb: BIT_VECTOR (3 downto 0);
signal bcd2_tb: BIT_VECTOR (3 downto 0);
begin
DUT1: bin_to_bcd port map (bin => bin_tb, bcd_1 => bcd1_tb, bcd_2 => bcd2_tb);
bin_tb <= "0000", "0010" after 10 ns, "1101" after 20 ns, "1111" after 30 ns;

end behavioral;