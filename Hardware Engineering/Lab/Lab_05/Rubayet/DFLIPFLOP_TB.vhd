ENTITY D_FLIPFLOP_TB IS
END D_FLIPFLOP_TB;

ARCHITECTURE behavioral of D_FLIPFLOP_TB is
SIGNAL data_tb, clock_tb, reset_tb, output_tb, enabler_tb: BIT;

COMPONENT D_FLIPFLOP is
port(data, clock, reset, enabler: IN BIT;
	output: OUT BIT);
end COMPONENT;
  
BEGIN
DUT100: D_FLIPFLOP port map( data=>data_tb, clock=>clock_tb, reset=>reset_tb, output=>output_tb, enabler=>enabler_tb);
enabler_tb <= '0', '1' after 10 NS;  
clock_tb <= '0', '1' after 10 NS, '0' after 20 NS, '1' after 30 NS, '1' after 40 NS;  
data_tb <= '0', '0' after 10 NS, '1' after 20 NS, '1' after 30 NS, '1' after 40 NS;
reset_tb <= '0', '0' after 10 NS, '0' after 20 NS, '0' after 30 NS, '0' after 40 NS;
END behavioral;
