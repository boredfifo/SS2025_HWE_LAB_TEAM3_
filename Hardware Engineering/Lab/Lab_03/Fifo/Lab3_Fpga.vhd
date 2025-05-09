entity Lab3 is
port(a, b: IN BIT_VECTOR (3 downto 0);
	DISP: OUT BIT_VECTOR (6 downto 0);
	S_FPGA: OUT BIT_VECTOR (3 downto 0);
	k_FPGA: IN BIT);
end Lab3;

architecture structural of Lab3 is
component bcd_to_7seg
port(bcd: IN BIT_VECTOR (3 downto 0);
	segDisp: OUT BIT_VECTOR (6 downto 0));
end component;
component four_bit_adder_subtractor is
	port(a: IN BIT_VECTOR (3 downto 0);
	  b: IN BIT_VECTOR (3 downto 0);
	S: OUT BIT_VECTOR (3 downto 0);
	K: IN BIT;
	C_OUT: OUT BIT);
end component;
signal sum_signal : BIT_VECTOR (3 downto 0);
begin
UT25: four_bit_adder_subtractor port map (a => a,
					b => b,
					K => k_FPGA,
					S => sum_signal,
					C_OUT => open);


UT26: bcd_to_7seg port map (bcd => sum_signal,
			segDisp => DISP);

end structural;