library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity data_memoryUnit is
port(dataAddress: IN STD_LOGIC_VECTOR (4 downto 0);
	dataIN: IN STD_LOGIC_VECTOR(7 downto 0);
	outputToAccumulator, outputToALU: OUT STD_LOGIC_VECTOR (7 downto 0);
	CLK, MEM_WRITE, MEM_READ, OutputSelector: IN STD_LOGIC);
end data_memoryUnit;

architecture behavioral of data_memoryUnit is
SIGNAL dataOUT: STD_LOGIC_VECTOR(7 downto 0);
type ram_array is array(0 to 31) of STD_LOGIC_VECTOR(7 downto 0);
signal data_memory : ram_array := (
  0  => "00000000",  -- address 0
  1  => "00000001",  -- address 1
  2  => "00000010",  -- address 2
  3  => "00000011",  -- address 3
  4  => "00000100",  -- address 4
  5  => "00000101",  -- address 5
  6  => "00000110",  -- address 6
  7  => "00000111",  -- address 7
  8  => "00001000",  -- address 8
  9  => "00001001",  -- address 9
  10 => "00001010",  -- address 10
  11 => "00001011",  -- address 11
  12 => "00001100",  -- address 12
  13 => "00001101",  -- address 13
  14 => "00001110",  -- address 14
  15 => "00001111",  -- address 15
  16 => "00010000",  -- address 16
  17 => "00010001",  -- address 17
  18 => "00010010",  -- address 18
  19 => "00010011",  -- address 19
  20 => "00010100",  -- address 20
  21 => "00010101",  -- address 21
  22 => "00010110",  -- address 22
  23 => "00010111",  -- address 23
  24 => "00011000",  -- address 24
  25 => "00011001",  -- address 25
  26 => "00011010",  -- address 26
  27 => "00011011",  -- address 27
  28 => "00011100",  -- address 28
  29 => "00011101",  -- address 29
  30 => "11111010",  -- address 30
  31 => "11111111"   -- address 31
);

COMPONENT dataDemux is
port(dataOutput: IN STD_LOGIC_VECTOR (7 downto 0);
	SEL: IN STD_LOGIC;
	toAccu, toALU: OUT STD_LOGIC_VECTOR (7 downto 0)
);
end COMPONENT;

BEGIN
process(CLK)
begin
if CLK'event and CLK = '1' then
	if MEM_WRITE = '1' then
 		data_memory(to_integer(unsigned(dataAddress))) <= dataIN;
	end if;
	if MEM_READ = '1'  then
 		dataOUT <= data_memory(to_integer(unsigned(dataAddress)));
	end if;
end if;
end process;


mydataDemux: dataDemux port map (dataOutput => dataOUT, SEL=> OutputSelector, toAccu=>outputToAccumulator, toALU=>outputToALU);

end behavioral;

