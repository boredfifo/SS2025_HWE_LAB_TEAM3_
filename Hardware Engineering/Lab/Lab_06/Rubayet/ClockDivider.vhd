ENTITY ClockDivider IS
    generic (
        N : natural := 4  -- Divide factor (must be ≥ 2)
    );
    port (
        Clock    : in  bit;
        RESET    : in  bit;
        CLOCK_N  : out bit
    );
END ENTITY ClockDivider;

ARCHITECTURE Behavioral OF ClockDivider IS
    SIGNAL count : natural := 0;
    SIGNAL temporary_Clock : bit := '0';
BEGIN
    PROCESS (Clock, RESET)
    BEGIN
        IF RESET = '1' THEN
            count <= 0;
            temporary_Clock <= '0';
        ELSIF Clock = '1' and Clock'event THEN 
            IF count = (N / 2) - 1 THEN
                temporary_Clock <= not temporary_Clock;
                count <= 0;
            else
                count <= count + 1;
            END IF;
        END IF;
    END PROCESS;

    CLOCK_N <= temporary_Clock;
END ARCHITECTURE Behavioral;
