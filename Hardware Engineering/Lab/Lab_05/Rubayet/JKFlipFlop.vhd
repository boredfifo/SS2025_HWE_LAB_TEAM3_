ENTITY JK_FLIPFLOP IS
  PORT(
    J, K, clock, reset, enabler : IN BIT;
    output, notOutput : OUT BIT
  );
END JK_FLIPFLOP;

ARCHITECTURE behavioral OF JK_FLIPFLOP IS
  SIGNAL outputToInput : BIT := '0'; 
BEGIN

  PROCESS(clock, reset)
  BEGIN
    IF reset = '1' THEN
      outputToInput <= '0';
    ELSIF (clock'EVENT AND clock = '1') THEN
      IF enabler = '1' THEN
        CASE (J & K) IS
          WHEN "00" => 
            outputToInput <= outputToInput;  -- No change
          WHEN "01" => 
            outputToInput <= '0';            -- Reset
          WHEN "10" => 
            outputToInput <= '1';            -- Set
          WHEN "11" => 
            outputToInput <= NOT outputToInput;  -- Toggle
          WHEN OTHERS => 
            NULL;
        END CASE;
      END IF;
    END IF;
  END PROCESS;

  output    <= outputToInput;
  notOutput <= NOT outputToInput;

END behavioral;
