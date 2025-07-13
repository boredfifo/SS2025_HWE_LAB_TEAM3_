ENTITY ClockDivider_tb IS
END ENTITY ClockDivider_tb;

ARCHITECTURE Test OF ClockDivider_tb IS

    COMPONENT ClockDivider
        GENERIC (
            N : natural := 4
        );
        PORT (
            Clock    : IN  bit;
            RESET    : IN  bit;
            CLOCK_N  : OUT bit
        );
    END COMPONENT;
  
    SIGNAL Clock_tb    : bit := '0';
    SIGNAL Reset_tb    : bit := '1';
    SIGNAL Clock_N_tb  : bit;

    CONSTANT clk_period : time := 10 ns;

BEGIN
    DUT1000: ClockDivider
        GENERIC MAP (
            N => 4
        )
        PORT MAP (
            Clock    => Clock_tb,
            RESET    => Reset_tb,
            CLOCK_N  => Clock_N_tb
        );

    
    Clock_Process : PROCESS
    BEGIN
        WHILE NOW < 200 ns LOOP
            Clock_tb <= '0';
            WAIT FOR clk_period / 2;
            Clock_tb <= '1';
            WAIT FOR clk_period / 2;
        END LOOP;
        WAIT;
    END PROCESS;

   
    Stim_Process : PROCESS
    BEGIN
        WAIT FOR 20 ns;
        Reset_tb <= '0';  
        WAIT FOR 180 ns;
        WAIT;
    END PROCESS;

END ARCHITECTURE Test;
