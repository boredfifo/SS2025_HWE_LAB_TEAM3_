library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

ENTITY TopLevelWith7SS IS 
PORT(
	clk, rst : IN STD_LOGIC;
	anodes : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	LedTest: OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	display : OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
END TopLevelWith7SS;

ARCHITECTURE structural of TopLevelWith7SS IS
SIGNAL bcd_0, bcd_1, bcd_2: STD_LOGIC_VECTOR(3 downto 0);
SIGNAL seg_0, seg_1, seg_2:STD_LOGIC_VECTOR(6 downto 0);
SIGNAL outBits: STD_LOGIC_VECTOR(7 downto 0);
SIGNAL carryBit : STD_LOGIC;

COMPONENT TopLevelCPU IS
PORT(globalCLK, RESET : IN STD_LOGIC;
    outputFor7seg: OUT STD_LOGIC_VECTOR(7 downto 0);
        carry : OUT std_logic
    );
END COMPONENT;


COMPONENT binaryToBcd9 is
    Port (
        binaryNumber : in STD_LOGIC_VECTOR(8 downto 0);
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



BEGIN

U107: TopLevelCPU PORT MAP(globalCLK=>clk,RESET=>rst,outputFor7seg=> outBits,carry=> carryBit );
LedTest <= outBits;
U108: binaryToBcd9 PORT MAP(binaryNumber(8)=>carryBit,binaryNumber(7 downto 0)=> outBits, BCD_0=>bcd_0, BCD_1=>bcd_1, BCD_2=>bcd_2);
U109: bcdTOSevensegment PORT MAP(BCD_input=>bcd_0, SEVEN_SEGMENT_OUTPUT=> seg_0);
U110: bcdTOSevensegment PORT MAP(BCD_input=>bcd_1, SEVEN_SEGMENT_OUTPUT=> seg_1);
U111: bcdTOSevensegment PORT MAP(BCD_input=>bcd_2, SEVEN_SEGMENT_OUTPUT=> seg_2);
U112: SevenSegmentController_8bit PORT MAP(clk=>clk, cathodeController_0=>seg_0,cathodeController_1=>seg_1,cathodeController_2=>seg_2,anodes=> anodes, display=>display);

END structural;
