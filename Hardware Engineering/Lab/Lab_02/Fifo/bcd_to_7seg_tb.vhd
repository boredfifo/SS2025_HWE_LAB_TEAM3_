entity bcd_to_7seg_tb is
end bcd_to_7seg_tb;

architecture behavioral of bcd_to_7seg_tb is 
component bcd_to_7seg
port(bcd: IN BIT_VECTOR (3 downto 0);
	segDisp: OUT BIT_VECTOR (6 downto 0));
end component;
signal bcd_tb: BIT_VECTOR (3 downto 0);
signal segDisp_tb: BIT_VECTOR (6 downto 0);
begin
DUT1: bcd_to_7seg port map (bcd=> bcd_tb,
				segDisp=> segDisp_tb);

bcd_tb <= "0000" after 10 ns, "0001" after 20 ns, "0011" after 30 ns, "1111" after 40 ns;
end behavioral;
