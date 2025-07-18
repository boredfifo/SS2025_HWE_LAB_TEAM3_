

entity upDownCounter_tb is
end upDownCounter_tb;

architecture tb of upDownCounter_tb is
    component upDownCounter
        port(
            CLK, EN, RST, PB: in BIT;
            outputfor7seg: out BIT_VECTOR(2 downto 0)
        );
    end component;

    -- Testbench signals
    signal CLK_tb   : BIT;
    signal EN_tb    : BIT ;
    signal RST_tb   : BIT ;
    signal PB_tb    : BIT ;
    signal output_tb: BIT_VECTOR(2 downto 0);

begin

    -- Instantiate DUT
    DUT: upDownCounter
        port map (
            CLK  => CLK_tb,
            EN   => EN_tb,
            RST  => RST_tb,
            PB   => PB_tb,
            outputfor7seg => output_tb
        );

    -- Clock generation: 20 ns period
    CLK_process: process
    begin
        while now < 400 ns loop
            CLK_tb <= '0';
            wait for 10 ns;
            CLK_tb <= '1';
            wait for 10 ns;
        end loop;
        wait;
    end process;

    -- Stimulus process
    stim_proc: process
    begin
        -- Reset the counter
        RST_tb <= '1';
        wait for 20 ns;
        RST_tb <= '0';

        -- Count up from s0 to s7
        PB_tb <= '0';  -- count up
        wait for 160 ns;  -- 8 cycles up

        -- Count down from s7 to s0
        PB_tb <= '1';  -- count down
        wait for 160 ns;  -- 8 cycles down

        -- Disable counting
        EN_tb <= '0';
        wait for 40 ns;

        -- Re-enable and count up again
        EN_tb <= '1';
        PB_tb <= '0';
        wait for 80 ns;

	wait;

       end process;
end tb;

