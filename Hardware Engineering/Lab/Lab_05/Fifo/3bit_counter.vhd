entity syncCounter is
port(
        CLK: IN BIT;
        output: OUT BIT_VECTOR(2 downto 0)
    );
end syncCounter;

architecture behavioral of syncCounter is
    component JK_FF
        port(J, K, CLK: IN BIT;
	 Q, Q_N: OUT BIT);
    end component;
signal q0, q1, q2: BIT;
signal j0, k0, j1, k1, j2: BIT;

begin
j0 <= not q0;
k0 <= q0;

 
j1 <= q0 and not q1;
k1 <= q0 and q1;

j2 <= q0 and q1;  

    
digit0: JK_FF port map(J => j0, K => k0, CLK => CLK, Q => q0, Q_N => open);
digit1: JK_FF port map(J => j1, K => k1, CLK => CLK, Q => q1, Q_N => open);
digit2: JK_FF port map(J => j2, K => j2, CLK => CLK, Q => q2, Q_N => open);

   
output <= q2 & q1 & q0;

end behavioral;


