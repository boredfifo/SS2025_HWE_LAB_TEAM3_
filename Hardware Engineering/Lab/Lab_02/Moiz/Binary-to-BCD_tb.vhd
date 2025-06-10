entity bin_to_bcd_tb is
end bin_to_bcd_tb;

architecture behavioral of bin_to_bcd_tb is
component bin_to_bcd
port (bin : in bit_vector (3 downto 0);
	bcd1 : out bit_vector (3 downto 0);
	bcd2 : out bit_vector (3 downto 0));
end component; 

signal bin_tb : bit_vector  (3 downto 0);
signal bcd1_tb : bit_vector (3 downto 0);
signal bcd2_tb : bit_vector (3 downto 0);
begin
DUT1: bin_to_bcd port map (bin => bin_tb, bcd1 => bcd1_tb, bcd2 => bcd2_tb);
bin_tb <= "0001", "0101" after 10 ns, "1110" after 20 ns, "1111" after 30 ns;

end behavioral;

