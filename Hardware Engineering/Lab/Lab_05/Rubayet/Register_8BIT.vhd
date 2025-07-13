ENTITY eightBIT_Register IS 
PORT(dataIn: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
    dataOut: OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
 clock, reset, enabler: IN STD_LOGIC);
END eightBIT_Register;

ARCHITECTURE behavioral OF eightBIT_Register IS
COMPONENT D_FLIPFLOP is
port(data, clock, reset, enabler: IN BIT;
	output: OUT BIT);
END COMPONENT;
begin
DUT0: D_FLIPFLOP port map(data=> dataIn(0), clock=>clock, reset=>reset, enabler=>enabler, output=> dataOut(0));
DUT1: D_FLIPFLOP port map(data=> dataIn(1), clock=>clock, reset=>reset, enabler=>enabler, output=> dataOut(1));
DUT2: D_FLIPFLOP port map(data=> dataIn(2), clock=>clock, reset=>reset, enabler=>enabler, output=> dataOut(2));
DUT3: D_FLIPFLOP port map(data=> dataIn(3), clock=>clock, reset=>reset, enabler=>enabler, output=> dataOut(3));
DUT4: D_FLIPFLOP port map(data=> dataIn(4), clock=>clock, reset=>reset, enabler=>enabler, output=> dataOut(4));
DUT5: D_FLIPFLOP port map(data=> dataIn(5), clock=>clock, reset=>reset, enabler=>enabler, output=> dataOut(5));
DUT6: D_FLIPFLOP port map(data=> dataIn(6), clock=>clock, reset=>reset, enabler=>enabler, output=> dataOut(6));
DUT7: D_FLIPFLOP port map(data=> dataIn(7), clock=>clock, reset=>reset, enabler=>enabler, output=> dataOut(7));
end behavioral;
