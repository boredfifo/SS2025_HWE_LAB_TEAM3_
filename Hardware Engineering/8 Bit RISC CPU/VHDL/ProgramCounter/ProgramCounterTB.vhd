library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ProgramCounterTB is 
end ProgramCounterTB;

architecture structural of ProgramCounterTB is
component ProgramCounter is
port(operand: IN STD_LOGIC_VECTOR (4 downto 0);
	SELE: IN STD_LOGIC_VECTOR (1 downto 0);
	RESET, CLK, PC_LOAD: IN STD_LOGIC;
 finalpcAddr: OUT STD_LOGIC_VECTOR (7 downto 0));
end component;

signal final_tb: STD_LOGIC_VECTOR (7 downto 0);
signal jump_tb: STD_LOGIC_VECTOR (4 downto 0);
signal sel_tb: STD_LOGIC_VECTOR (1 downto 0);
signal res_tb, clk_tb, en_tb: STD_LOGIC;

begin
DUT4: ProgramCounter port map (operand=>jump_tb, SELE=>sel_tb, RESET=>res_tb, CLK=>clk_tb, finalpcAddr=>final_tb, PC_LOAD => en_tb);


     -- Clock Generation: 20 ns period
    clk_proc: process
    begin
        while true loop
            clk_tb <= '0';
            wait for 10 ns;
            clk_tb <= '1';
            wait for 10 ns;
        end loop;
    end process;

    -- Stimulus Process
    stim_proc: process
    begin
        ------------------------------------------------------------
        -- Phase 1: Reset active ? PC should go to 0
        ------------------------------------------------------------
        res_tb   <= '1';
        sel_tb   <= "00";                -- Default: PC+1
        en_tb    <= '1';                 -- Allow PC to update
        jump_tb  <= (others => '0');
        wait for 30 ns;

        ------------------------------------------------------------
        -- Phase 2: Release reset ? PC starts incrementing
        ------------------------------------------------------------
        res_tb <= '0';
        wait for 60 ns;                  -- Should increment 3 times

        ------------------------------------------------------------
        -- Phase 3: PC_LOAD disabled ? PC should hold current value
        ------------------------------------------------------------
        en_tb <= '0';
        wait for 40 ns;                  -- PC should stay constant

        ------------------------------------------------------------
        -- Phase 4: Re-enable PC_LOAD ? PC resumes incrementing
        ------------------------------------------------------------
        en_tb <= '1';
        wait for 40 ns;

        ------------------------------------------------------------
        -- Phase 5: Jump to address 0x20
        ------------------------------------------------------------
        sel_tb <= "01";
        jump_tb <= "00100";
        wait for 20 ns;

        ------------------------------------------------------------
        -- Phase 6: Resume incrementing from 0x20
        ------------------------------------------------------------
        sel_tb <= "00";
        wait for 40 ns;

        ------------------------------------------------------------
        -- Phase 7: Jump to address 0x55
        ------------------------------------------------------------
        sel_tb <= "01";
        jump_tb <= "01010";
        wait for 20 ns;

        ------------------------------------------------------------
        -- Phase 8: Reset again ? PC returns to 0
        ------------------------------------------------------------
        res_tb <= '1';
        wait for 20 ns;

        ------------------------------------------------------------
        -- Phase 9: Resume incrementing
        ------------------------------------------------------------
        res_tb <= '0';
        sel_tb <= "00";
        wait for 60 ns;

        wait; -- stop simulation
    end process;


end structural;
