library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Accumulator is 
port(datafromALU, datafromDataUnit: IN STD_LOGIC_VECTOR (7 downto 0);
	CLK, RST, EN, MUX_SEL, DEMUX_SEL,carryBit,flagEnablerFromControlUnit: IN STD_LOGIC;
	datatoALU, datatoDataUnit: OUT STD_LOGIC_VECTOR (7 downto 0);
	negativeFlag         : OUT STD_LOGIC;
        ZeroFlag             : OUT STD_LOGIC;
        carryFlag            : OUT STD_LOGIC
);
end Accumulator;

architecture behavioral of Accumulator is
component accMUX
port(inALU, inDU: IN STD_LOGIC_VECTOR (7 downto 0);
	SEL: IN STD_LOGIC;
	DATA: OUT STD_LOGIC_VECTOR (7 downto 0)
);
end component;
component eightBIT_DFLIPFLOP
port(a: IN STD_LOGIC_VECTOR (7 downto 0);
    b: OUT STD_LOGIC_VECTOR (7 downto 0);
 clk, rst, en: IN STD_LOGIC);
end component;
component accDEMUX
port(accOUTPUT: IN STD_LOGIC_VECTOR (7 downto 0);
	SEL: IN STD_LOGIC;
	toALU, todataMEMORY: OUT STD_LOGIC_VECTOR (7 downto 0)
);
end component;
signal datatoRegister, registertoDEMUX, aluDataInternal: STD_LOGIC_VECTOR (7 downto 0);

begin
MUX: accMUX port map(inALU=>datafromALU, inDU=>datafromDataUnit, SEL=>MUX_SEL, DATA=>datatoRegister);
RGSTR: eightBIT_DFLIPFLOP port map (a=>datatoRegister, b=>registertoDEMUX, clk=>CLK, rst=>RST, en=>EN);
DEMUX: accDEMUX port map (accOUTPUT => registertoDEMUX, SEL=> DEMUX_SEL, toALU=>aluDataInternal, todataMEMORY=>datatoDataUnit);
datatoALU <= aluDataInternal;

process(CLK, RST)
begin
    if RST = '1' then
        ZeroFlag     <= '0';
        negativeFlag <= '0';
        carryFlag    <= '0';
    elsif rising_edge(CLK) then
        if flagEnablerFromControlUnit = '1' then
            if aluDataInternal = "00000000" then
                ZeroFlag <= '1';
            else
                ZeroFlag <= '0';
            end if;

            negativeFlag <= aluDataInternal(7);
            carryFlag    <= carryBit;
        else
            ZeroFlag     <= '0';
            negativeFlag <= '0';
            carryFlag    <= '0';
        end if;
    end if;
end process;


end behavioral;
