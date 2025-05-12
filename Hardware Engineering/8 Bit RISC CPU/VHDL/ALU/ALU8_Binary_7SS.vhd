library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

ENTITY ALU_8bit_7SS IS 
PORT(F0, F1,EN_B, EN_A, CarryIn, INV_A: IN STD_LOGIC;
	B, A: IN STD_LOGIC_VECTOR(7 downto 0);
	clk, rst : IN STD_LOGIC;
	anodes : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	display : OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
END ALU_8bit_7SS;

ARCHITECTURE structural of ALU_8bit_7SS IS
SIGNAL outBits: STD_LOGIC_VECTOR(7 downto 0);
SIGNAL carry, F0Line, F1Line,ENALine,ENBLine, InvLine, CarryLine: STD_LOGIC;
SIGNAL bcd_0, bcd_1, bcd_2: STD_LOGIC_VECTOR(3 downto 0);
SIGNAL seg_0, seg_1, seg_2:STD_LOGIC_VECTOR(6 downto 0);
SIGNAL rst_internal : STD_LOGIC := '1';
SIGNAL reset_counter : integer range 0 to 15 := 0;


COMPONENT ALU_8bit IS
PORT(F0, F1, CarryIn,EN_B, EN_A, INV_A: IN STD_LOGIC;
	B, A: IN STD_LOGIC_VECTOR(7 downto 0);
	Output : OUT STD_LOGIC_VECTOR(7 downto 0);
	CarryOut: OUT STD_LOGIC);
END COMPONENT;

COMPONENT binaryToBcd8 is
    Port (
        binaryNumber : in STD_LOGIC_VECTOR(7 downto 0);
        BCD_2 : out STD_LOGIC_VECTOR(3 downto 0);
        BCD_1 : out STD_LOGIC_VECTOR(3 downto 0);
        BCD_0 : out STD_LOGIC_VECTOR(3 downto 0)
    );
end COMPONENT;

COMPONENT SevenSegmentController_8bit IS
PORT (
    clk : IN STD_LOGIC;
    cathodeController_0, cathodeController_1, cathodeController_2 : IN STD_LOGIC_VECTOR(6 DOWNTO 0); 
    anodes : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    display : OUT STD_LOGIC_VECTOR(7 DOWNTO 0) 
);
END COMPONENT;

COMPONENT bcdTOSevensegment IS
PORT(BCD_input:IN STD_LOGIC_VECTOR(3 downto 0);
	SEVEN_SEGMENT_OUTPUT: OUT STD_LOGIC_VECTOR(6 downto 0));
END COMPONENT;

COMPONENT ButtonMemory is
    Port (
        clk : in STD_LOGIC;              -- System clock
        rst : in STD_LOGIC;              -- Reset input
        button_input : in STD_LOGIC;     -- Physical button input
        remembered_presses : out STD_LOGIC  -- Button press history
     );
end COMPONENT;

BEGIN

process(clk)
begin
    if rising_edge(clk) then
        if reset_counter < 15 then
            reset_counter <= reset_counter + 1;
            rst_internal <= '1';
        else
            rst_internal <= '0';
        end if;
    end if;
end process;


U166: ButtonMemory PORT MAP(clk=>clk, rst=>rst_internal, button_input=>F0, remembered_presses=>F0Line); 
U167: ButtonMemory PORT MAP(clk=>clk, rst=>rst_internal, button_input=>F1, remembered_presses=>F1Line); 
U168: ButtonMemory PORT MAP(clk=>clk, rst=>rst_internal, button_input=>EN_A, remembered_presses=>ENALine); 
U169: ButtonMemory PORT MAP(clk=>clk, rst=>rst_internal, button_input=>EN_B, remembered_presses=>ENBLine); 
U170: ButtonMemory PORT MAP(clk=>clk, rst=>rst_internal, button_input=>INV_A, remembered_presses=>InvLine); 
U171: ButtonMemory PORT MAP(clk=>clk, rst=>rst_internal, button_input=>CarryIn, remembered_presses=>CarryLine); 

U160: ALU_8bit PORT MAP(F0=>F0Line,F1=>F1Line,CarryIn=>CarryLine,EN_B=>ENBLine,EN_A=>ENALine,INV_A=>InvLine,B=>B,A=>A,Output => outBits,CarryOut=>carry );
U161: binaryToBcd8 PORT MAP(binaryNumber=> outBits, BCD_0=>bcd_0, BCD_1=>bcd_1, BCD_2=>bcd_2);
U162: bcdTOSevensegment PORT MAP(BCD_input=>bcd_0, SEVEN_SEGMENT_OUTPUT=> seg_0);
U163: bcdTOSevensegment PORT MAP(BCD_input=>bcd_1, SEVEN_SEGMENT_OUTPUT=> seg_1);
U164: bcdTOSevensegment PORT MAP(BCD_input=>bcd_2, SEVEN_SEGMENT_OUTPUT=> seg_2);
U165: SevenSegmentController_8bit PORT MAP(clk=>clk, cathodeController_0=>seg_0,cathodeController_1=>seg_1,cathodeController_2=>seg_2,anodes=> anodes, display=>display);

END structural;
