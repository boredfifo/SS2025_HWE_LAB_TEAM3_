entity bcd_to_7seg_tb is 
end bcd_to_7seg_tb;

architecture behavioral of bcd_to_7seg_tb is
component bcd_to_7seg 
port (bcd: in bit_vector (3 downto 0);
	sevseg: out bit_vector (6 downto 0));
end component;

signal bcd_tb : bit_vector (3 downto 0);
signal sevseg_tb : bit_vector (6 downto 0);
begin 

DUT2: bcd_to_7seg port map (bcd => bcd_tb, sevseg => sevseg_tb);

bcd_tb <= "0001", "0011" after 10 ns, "0010" after 20 ns;

end behavioral;
 


