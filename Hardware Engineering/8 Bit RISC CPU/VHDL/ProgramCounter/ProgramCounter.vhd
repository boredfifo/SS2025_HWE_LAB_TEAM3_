library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ProgramCounter is
port(operand: IN STD_LOGIC_VECTOR (4 downto 0);
	SELE: IN STD_LOGIC_VECTOR (1 downto 0);
	RESET, CLK, PC_LOAD: IN STD_LOGIC;
 finalpcAddr: OUT STD_LOGIC_VECTOR (7 downto 0));
end ProgramCounter;

architecture behavioral of ProgramCounter is
component eightBit_FullAdder is
port(a,b : IN STD_LOGIC_VECTOR (7 downto 0);
	s: OUT STD_LOGIC_VECTOR (7 downto 0);
	c_in: IN STD_LOGIC;
	c_out: OUT STD_LOGIC);
end component;
component PC_MUX is
port(currPC: IN STD_LOGIC_VECTOR (7 downto 0);
	jumpADDR: IN STD_LOGIC_VECTOR (7 downto 0);
	sel: IN STD_LOGIC_VECTOR (1 downto 0);
	final_PC: OUT STD_LOGIC_VECTOR (7 downto 0));
end component;
component eightBIT_DFLIPFLOP is 
port(a: IN STD_LOGIC_VECTOR (7 downto 0);
    b: OUT STD_LOGIC_VECTOR (7 downto 0);
 clk, rst, en: IN STD_LOGIC);
end component;

signal pcPlusOne, currPCAddress, nextPCAddress, jumpAddress: STD_LOGIC_VECTOR (7 downto 0);

begin
jumpAddress <= "000" & operand;
UT20: eightBit_FullAdder port map (a=>currPCAddress, b=> "00000001", s=>pcPlusOne, c_in=>'0', c_out=>open);
UT21: PC_MUX port map (currPC=>pcPlusOne, jumpADDR=>jumpAddress, sel=>SELE, final_PC=>nextPCAddress);
UT22: eightBIT_DFLIPFLOP port map(a=>nextPCAddress, b=>currPCAddress, clk=>CLK, rst=>RESET, en=>PC_LOAD);

finalpcAddr <= currPCAddress;


end behavioral;
