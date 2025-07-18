entity JK_FF is 
port(J, K, CLK: IN BIT;
Q, Q_N: OUT BIT);
end JK_FF;

architecture behavioral of JK_FF is
signal temp: BIT := '0';

begin
process(CLK)
begin

if CLK'event and CLK = '1' then
	if J = '0' and K = '0' then
		temp<=temp;
	elsif J = '0' and K = '1' then
		temp <= '0';
	elsif J = '1' and K = '0' then
		temp <= '1';
	elsif J = '1' and K = '1' then
		temp <= not temp;
	end if;

end if;

Q <= temp;
Q_n <= not temp;

end process;


end behavioral;

