library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

ENTITY SevenSegmentController_8bit IS
PORT (
    clk : IN STD_LOGIC;
    cathodeController_0, cathodeController_1, cathodeController_2 : IN BIT_VECTOR(6 DOWNTO 0); 
    anodes : OUT BIT_VECTOR(7 DOWNTO 0);
    display : OUT BIT_VECTOR(7 DOWNTO 0) 
);
END SevenSegmentController_8bit;

ARCHITECTURE behavioural OF SevenSegmentController_8bit IS
    SIGNAL clk_counter : NATURAL := 0;
    SIGNAL refresh_counter : NATURAL RANGE 0 TO 7 := 0;
BEGIN

    PROCESS(clk)
    BEGIN
        IF rising_edge(clk) THEN
            clk_counter <= clk_counter + 1;

            IF clk_counter = 200000 THEN  
                clk_counter <= 0;
                IF refresh_counter = 7 THEN
                    refresh_counter <= 0;
                ELSE
                    refresh_counter <= refresh_counter + 1;
                END IF;
            END IF;
        END IF;
    END PROCESS;

    PROCESS(refresh_counter, cathodeController_0, cathodeController_1, cathodeController_2)
    BEGIN
        CASE refresh_counter IS
            WHEN 0 =>
                display(6 DOWNTO 0) <=  Not cathodeController_0;
                display(7) <= '1';  -- dot off
            WHEN 1 =>
                display(6 DOWNTO 0) <=  Not cathodeController_1;
                display(7) <= '1';  -- dot off
            WHEN 2 =>
                display(6 DOWNTO 0) <=  Not cathodeController_2;
                display(7) <= '1';  -- dot off
            WHEN OTHERS =>
                display <= (OTHERS => '1');  -- fallback
        END CASE;
    END PROCESS;

    PROCESS(refresh_counter)
    VARIABLE temporary_Anodes : BIT_VECTOR(7 DOWNTO 0);
    BEGIN
        temporary_Anodes := (OTHERS => '1');
        temporary_Anodes(refresh_counter) := '0';
        anodes <= temporary_Anodes;
    END PROCESS;

END behavioural;

