library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity ProgramCounter_TB is

end ProgramCounter_TB;

ARCHITECTURE simulation OF ProgramCounter_TB IS
SIGNAL operand_tb: STD_LOGIC_VECTOR (4 downto 0);
SIGNAL SELE_tb: STD_LOGIC_VECTOR (1 downto 0);
SIGNAL RESET_tb, CLK_tb, PC_LOAD_tb: STD_LOGIC;
SIGNAL finalpcAddr_tb: STD_LOGIC_VECTOR (7 downto 0);

COMPONENT ProgramCounter is
port(operand: IN STD_LOGIC_VECTOR (4 downto 0);
 SELE: IN STD_LOGIC_VECTOR (1 downto 0);
 RESET, CLK, PC_LOAD: IN STD_LOGIC;
 finalpcAddr: OUT STD_LOGIC_VECTOR (7 downto 0));
end COMPONENT;

BEGIN
DUT101: ProgramCounter PORT MAP(operand=>operand_tb,SELE=>SELE_tb,RESET=>RESET_tb,
    CLK=>CLK_tb,PC_LOAD=>PC_LOAD_tb,finalpcAddr=>finalpcAddr_tb);


PROCESS
    BEGIN
        WHILE NOW < 100 NS LOOP
            CLK_tb <= '0';
            WAIT FOR 5 NS;
            CLK_tb <= '1';
            WAIT FOR 5 NS;
        END LOOP;
        WAIT;
END PROCESS;
RESET_tb <= '1', '0' after 10 NS, '1' after 100 NS;
PC_LOAD_tb <= '0', '1' after 20 NS;
SELE_tb <= "00", "01" after 50 NS;
operand_tb <= "11111";
END simulation;
