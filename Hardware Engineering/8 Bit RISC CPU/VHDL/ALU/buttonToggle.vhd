library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ButtonMemory is
    Port (
        clk : in STD_LOGIC;              -- System clock
        rst : in STD_LOGIC;              -- Reset input
        button_input : in STD_LOGIC;     -- Physical button input
        remembered_presses : out STD_LOGIC  -- Button press history (now 1-bit)
     );
end ButtonMemory;

architecture Behavioral of ButtonMemory is
signal button_state, button_state_prev : STD_LOGIC := '0';
signal debounce_counter : unsigned(15 downto 0) := (others => '0'); -- 16-bit counter for debouncing
signal press_detected : STD_LOGIC := '0'; -- Signal to indicate a press was detected
constant debounce_limit : unsigned(15 downto 0) := to_unsigned(50000, 16); -- Debounce threshold value, adjust as needed

begin

process(clk, rst)
begin
    if rst = '1' then
        debounce_counter <= (others => '0');
        button_state <= '0';
        button_state_prev <= '0';
        press_detected <= '0';  -- Reset the press_detected flag on reset
    elsif rising_edge(clk) then
        -- Button Debouncing
        if button_input = button_state then
            if debounce_counter < debounce_limit then
                debounce_counter <= debounce_counter + 1;
            else
                -- Button state is stable; check for rising edge
                if button_state = '1' and button_state /= button_state_prev then
                    -- Button press detected; set press_detected to '1'
                    press_detected <= '1';
                end if;
            end if;
        else
            debounce_counter <= (others => '0');
            button_state_prev <= button_state;
            button_state <= button_input;
        end if;
    end if;
end process;

-- Output assignment
remembered_presses <= press_detected;  -- Output is simply the press_detected signal

end Behavioral;
