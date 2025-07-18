entity syncCounterTb is
end syncCounterTb;

architecture behavioral of syncCounterTb is
component syncCounter
port(
        CLK: IN BIT;
        output: OUT BIT_VECTOR(2 downto 0)
    );
end component;

signal CLK_TB: BIT;
signal output_TB: BIT_VECTOR (2 downto 0);

begin
DUT4: syncCounter port map (CLK => CLK_TB, output => output_TB);
--clock generation
DUT3: process
begin

while now < 160 ns loop
            CLK_TB <= '0';
            wait for 10 ns;
            CLK_TB <= '1';
            wait for 10 ns;
        end loop;
        wait;

end process;


end behavioral;


