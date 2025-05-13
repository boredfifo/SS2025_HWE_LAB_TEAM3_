library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity binaryToBcd9 is
    Port (
        binaryNumber : in STD_LOGIC_VECTOR(8 downto 0);  -- Now 9 bits
        BCD_2 : out STD_LOGIC_VECTOR(3 downto 0);
        BCD_1 : out STD_LOGIC_VECTOR(3 downto 0);
        BCD_0 : out STD_LOGIC_VECTOR(3 downto 0)
    );
end entity;

architecture Behavioral of binaryToBcd9 is
begin
    process(binaryNumber)
        variable bcd: STD_LOGIC_VECTOR(11 downto 0) := (others => '0');
        variable bin: STD_LOGIC_VECTOR(8 downto 0);
    begin
        bin := binaryNumber;
        bcd := (others => '0');

        -- Double Dabble: Shift 9 times for 9-bit input
        for i in 0 to 8 loop
            -- Step 1: Check each BCD digit and add 3 if >= 5
            for j in 0 to 2 loop
                if to_integer(unsigned(bcd(j*4+3 downto j*4))) >= 5 then
                    bcd(j*4+3 downto j*4) := std_logic_vector(unsigned(bcd(j*4+3 downto j*4)) + 3);
                end if;
            end loop;

            -- Step 2: Shift left and bring in next bit from binary input
            bcd := bcd(10 downto 0) & bin(8 - i);
        end loop;

        -- Assign final BCD outputs
        BCD_2 <= bcd(11 downto 8);
        BCD_1 <= bcd(7 downto 4);
        BCD_0 <= bcd(3 downto 0);
    end process;
end Behavioral;
