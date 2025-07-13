entity D_FLIPFLOP is
port(data, clock, reset, enabler: IN BIT;
	output: OUT BIT);
end D_FLIPFLOP;

ARCHITECTURE behavioral OF D_FLIPFLOP IS
BEGIN
  
PROCESS(clock, reset)
BEGIN
IF reset = '1' THEN
output <= '0';
ELSIF (clock`event AND clock = '1') THEN 
IF enabler = '1' THEN
output <= data;
END IF;
END IF;
END PROCESS;
END behavioral;
