library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

ENTITY binaryToBcd8 is
    Port (
        binaryNumber : in STD_LOGIC_VECTOR(7 downto 0);
        BCD_2 : out STD_LOGIC_VECTOR(3 downto 0);
        BCD_1 : out STD_LOGIC_VECTOR(3 downto 0);
        BCD_0 : out STD_LOGIC_VECTOR(3 downto 0)
    );
end ENTITY;

architecture Behavioral of binaryToBcd8 is
begin
    process(binaryNumber)
        variable bcd: STD_LOGIC_VECTOR(11 downto 0) := (others => '0');  -- Initializes to 12'b0
        variable bin: integer;
    begin
        -- Convert the binary number to an integer for processing
        bin := to_integer(unsigned(binaryNumber));

        -- Double dabble algorithm loop: Iterate over each bit of the input
        for i in 0 to 7 loop
            bcd := bcd(10 downto 0) & binaryNumber(7-i);  -- Shift left (append next binary bit)

            -- Check for any 4-bit group within 'bcd' that is >= 5, before adding the next bit
            for j in 0 to 2 loop
                if to_integer(unsigned(bcd(j*4+3 downto j*4))) >= 5 then
                    bcd(j*4+3 downto j*4) := std_logic_vector(unsigned(bcd(j*4+3 downto j*4)) + 3);
                end if;
            end loop;
        end loop;

        -- Assign computed BCD values to outputs
        BCD_2 <= bcd(11 downto 8);
        BCD_1 <= bcd(7 downto 4);
        BCD_0 <= bcd(3 downto 0);
    end process;
end Behavioral;
