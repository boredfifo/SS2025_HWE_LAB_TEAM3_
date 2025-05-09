ENTITY AddingSixOrZero IS
PORT(checkingBIT: IN BIT;
	SixOrZero: OUT BIT_VECTOR(3 downto 0));
END AddingSixOrZero;

ARCHITECTURE behavioural of AddingSixOrZero IS
BEGIN
with checkingBIT select
	SixOrZero <= "0000" when '0',
			"1111" when '1';
END behavioural;
