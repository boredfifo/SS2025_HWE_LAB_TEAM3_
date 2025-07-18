ENTITY 3BIT_UP_COUNTER IS
    PORT(
        clock : IN BIT;
        OutBits : OUT BIT_VECTOR(2 DOWNTO 0)
    );
END 3BIT_UP_COUNTER;

ARCHITECTURE BEHAVIOURAL OF 3BIT_UP_COUNTER IS

    COMPONENT JK_FLIPFLOP IS
        PORT(
            J, K, clock, reset, enabler : IN BIT;
            output, notOutput : OUT BIT
        );
    END COMPONENT;

    SIGNAL q0, q1, q2 : BIT;
    SIGNAL j0, k0, j1, k1, j2, k2 : BIT;
    SIGNAL reset, enabler : BIT := '1';

BEGIN


    j0 <= '1';
    k0 <= '1';

    j1 <= q0;
    k1 <= q0;

    j2 <= q0 AND q1;
    k2 <= q0 AND q1;

    DUT1: JK_FLIPFLOP PORT MAP(
        J => j0, K => k0,
        clock => clock,
        reset => reset,
        enabler => enabler,
        output => q0,
        notOutput => OPEN
    );

    DUT2: JK_FLIPFLOP PORT MAP(
        J => j1, K => k1,
        clock => clock,
        reset => reset,
        enabler => enabler,
        output => q1,
        notOutput => OPEN
    );

    DUT3: JK_FLIPFLOP PORT MAP(
        J => j2, K => k2,
        clock => clock,
        reset => reset,
        enabler => enabler,
        output => q2,
        notOutput => OPEN
    );

    OutBits <= q2 & q1 & q0;

END BEHAVIOURAL;
