library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity data_memoryUnit is
port(dataAddress: IN STD_LOGIC_VECTOR (4 downto 0);
	dataIN: IN STD_LOGIC_VECTOR(7 downto 0);
	dataOUT: OUT STD_LOGIC_VECTOR (7 downto 0);
	CLK, MEM_WRITE, MEM_READ: STD_LOGIC);
end data_memoryUnit;

architecture behavioral of data_memoryUnit is
type ram_array is array(0 to 31) of STD_LOGIC_VECTOR(7 downto 0);
signal data_memory : ram_array := (
  0 => "00000100",  -- address 0
  1 => "00000011",  -- address 1
  2 => "00000010",  -- address 2
  3 => "00000000",  -- address 3
  4 => "00000001",  -- address 4
  5 => "11111111", -- address 5
  others => (others => '0')
);
begin
process(CLK)
begin
if CLK'event and CLK = '1' then
	if MEM_WRITE = '1' then
 		data_memory(to_integer(unsigned(dataAddress))) <= dataIN;
	end if;
end if;
end process;

process(CLK)
begin
if CLK'event and CLK = '1' then
	if MEM_READ = '1' then
 		dataOUT <= data_memory(to_integer(unsigned(dataAddress)));
	end if;
end if;
end process;

end behavioral;

