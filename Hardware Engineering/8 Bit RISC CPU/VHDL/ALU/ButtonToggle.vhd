library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ButtonMemory is
    Port (
        clk : in STD_LOGIC;
        rst : in STD_LOGIC;
        button_input : in STD_LOGIC;
        remembered_presses : out STD_LOGIC
    );
end ButtonMemory;

architecture Behavioral of ButtonMemory is
    signal debounced : STD_LOGIC := '0';
    signal debounced_prev : STD_LOGIC := '0';
    signal counter : unsigned(15 downto 0) := (others => '0');
    signal press_toggle : STD_LOGIC := '0';
    constant debounce_limit : unsigned(15 downto 0) := to_unsigned(50000, 16);
begin

process(clk)
begin
    if rising_edge(clk) then
        if rst = '1' then
            counter <= (others => '0');
            debounced <= '0';
            debounced_prev <= '0';
            press_toggle <= '0';
        else
            -- Debounce logic
            if button_input = debounced then
                counter <= (others => '0'); -- No change
            else
                counter <= counter + 1;
                if counter >= debounce_limit then
                    debounced <= button_input;  -- Accept new stable input
                    counter <= (others => '0');
                end if;
            end if;

            -- Rising edge detection on debounced signal
            if debounced = '1' and debounced_prev = '0' then
                press_toggle <= not press_toggle;  -- Toggle output
            end if;

            -- Update previous debounced state
            debounced_prev <= debounced;
        end if;
    end if;
end process;

remembered_presses <= press_toggle;

end Behavioral;
