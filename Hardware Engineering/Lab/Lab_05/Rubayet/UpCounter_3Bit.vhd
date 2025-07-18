ENTITY 3BIT_UP_COUNTER is
PORT(
        clock: IN BIT;
        OutBits: OUT BIT_VECTOR(2 downto 0)
    );
END 3BIT_UP_COUNTER;

ARCHITECTURE BEHAVIOURAL of 3BIT_UP_COUNTER is

COMPONENT JK_FLIPFLOP IS
  PORT(
    J, K, clock, reset, enabler : IN BIT;
    output, notOutput : OUT BIT
  );
END COMPONENT;

signal LSB, MiddleBIT, MSB, j0, k0, j1, k1, j2: BIT;

BEGIN
j0 <= not q0;
k0 <= q0;

 
j1 <= q0 and not q1;
k1 <= q0 and q1;

j2 <= q0 and q1;  

    
DUT1: JK_FLIPFLOP port map(J => j0, K => k0, CLK => CLK, Q => q0, Q_N => open);
DUT2: JK_FLIPFLOP port map(J => j1, K => k1, CLK => CLK, Q => q1, Q_N => open);
DUT3: JK_FLIPFLOP port map(J => j2, K => j2, CLK => CLK, Q => q2, Q_N => open);

   
output <= q2 & q1 & q0;

END BEHAVIOURAL;

