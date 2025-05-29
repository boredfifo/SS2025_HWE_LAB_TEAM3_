library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

ENTITY TopLevelWith7SS_TB IS 
END TopLevelWith7SS_TB;


ARCHITECTURE simulation OF TopLevelWith7SS_TB IS

SIGNAL clk_tb, rst_tb: STD_LOGIC;
SIGNAL	anodes_tb : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	display_tb : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	binaryOutput_TB : STD_LOGIC_VECTOR(7 DOWNTO 0);
COMPONENT TopLevelWith7SS IS 
PORT(
	clk, rst : IN STD_LOGIC;
	anodes : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	display : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	binaryOutput: OUT STD_LOGIC_VECTOR(7 DOWNTO 0) );
END COMPONENT;
BEGIN
CPU11111111: TopLevelWith7SS PORT MAP(clk=>clk_tb, rst=>rst_tb, anodes=>anodes_tb, display=>display_tb,binaryOutput=>binaryOutput_TB );

PROCESS
    BEGIN
        WHILE NOW < 3000 NS LOOP
            clk_tb <= '0';
            WAIT FOR 5 NS;
            clk_tb <= '1';
            WAIT FOR 5 NS;
        END LOOP;
        WAIT;
END PROCESS;

rst_tb <= '0';

END simulation;