ENTITY bit_to_7seg IS
    PORT(
        bit_input : IN BIT;
        seg : OUT BIT_VECTOR(6 DOWNTO 0)
    );
END bit_to_7seg;

ARCHITECTURE behavioral OF bit_to_7seg IS
BEGIN
	WITH bit_input SELECT
                seg <=  "1000000" when '0',
                	"1111001" when '1',
                	"1111111" when OTHERS;
END behavioral;

