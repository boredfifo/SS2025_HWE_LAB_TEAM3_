ENTITY ShiftRegister_8BIT IS
  PORT(
    clock, reset, enabler, data_in: IN BIT;
    data_out : OUT BIT_VECTOR(7 DOWNTO 0)
  );
END ShiftRegister_8BIT;

ARCHITECTURE structural OF ShiftRegister_8BIT IS

COMPONENT D_FLIPFLOP
    PORT(
      data, clock, reset, enabler : IN BIT;
      output  : OUT BIT
    );
END COMPONENT;

SIGNAL FlipToFlipBus : BIT_VECTOR(7 DOWNTO 0);

BEGIN

  DUT200: D_FLIPFLOP PORT MAP(data_in, clock, reset, enabler, FlipToFlipBus(0));
  DUT201: D_FLIPFLOP PORT MAP(FlipToFlipBus(0), clock, reset, enabler, FlipToFlipBus(1));
  DUT202: D_FLIPFLOP PORT MAP(FlipToFlipBus(1), clock, reset, enabler, FlipToFlipBus(2));
  DUT203: D_FLIPFLOP PORT MAP(FlipToFlipBus(2), clock, reset, enabler, FlipToFlipBus(3));
  DUT204: D_FLIPFLOP PORT MAP(FlipToFlipBus(3), clock, reset, enabler, FlipToFlipBus(4));
  DUT205: D_FLIPFLOP PORT MAP(FlipToFlipBus(4), clock, reset, enabler, FlipToFlipBus(5));
  DUT206: D_FLIPFLOP PORT MAP(FlipToFlipBus(5), clock, reset, enabler, FlipToFlipBus(6));
  DUT207: D_FLIPFLOP PORT MAP(FlipToFlipBus(6), clock, reset, enabler, FlipToFlipBus(7));

  data_out <= FlipToFlipBus;

END structural;
