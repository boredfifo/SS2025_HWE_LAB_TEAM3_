set_property PACKAGE_PIN W5 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports clk]
create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports clk]


set_property PACKAGE_PIN J17 [get_ports {anodes[0]}] # G (middle)
set_property IOSTANDARD LVCMOS33 [get_ports {anodes[0]}]

set_property PACKAGE_PIN J18 [get_ports {anodes[1]}] # G (middle)
set_property IOSTANDARD LVCMOS33 [get_ports {anodes[1]}]

set_property PACKAGE_PIN T9 [get_ports {anodes[2]}] # G (middle)
set_property IOSTANDARD LVCMOS33 [get_ports {anodes[2]}]

set_property PACKAGE_PIN J14 [get_ports {anodes[3]}] # G (middle)
set_property IOSTANDARD LVCMOS33 [get_ports {anodes[3]}]

set_property PACKAGE_PIN P14 [get_ports {anodes[4]}] # G (middle)
set_property IOSTANDARD LVCMOS33 [get_ports {anodes[4]}]

set_property PACKAGE_PIN T14 [get_ports {anodes[5]}] # G (middle)
set_property IOSTANDARD LVCMOS33 [get_ports {anodes[5]}]

set_property PACKAGE_PIN K2 [get_ports {anodes[6]}] # G (middle)
set_property IOSTANDARD LVCMOS33 [get_ports {anodes[6]}]

set_property PACKAGE_PIN U13 [get_ports {anodes[7]}] # G (middle)
set_property IOSTANDARD LVCMOS33 [get_ports {anodes[7]}]

#cathodes
set_property PACKAGE_PIN T10 [get_ports {cathods[0]}] # G (middle)
set_property IOSTANDARD LVCMOS33 [get_ports {cathods[0]}]

set_property PACKAGE_PIN R10 [get_ports {cathods[1]}] # G (middle)
set_property IOSTANDARD LVCMOS33 [get_ports {cathods[1]}]

set_property PACKAGE_PIN K16 [get_ports {cathods[2]}] # G (middle)
set_property IOSTANDARD LVCMOS33 [get_ports {cathods[2]}]

set_property PACKAGE_PIN K13 [get_ports {cathods[3]}] # G (middle)
set_property IOSTANDARD LVCMOS33 [get_ports {cathods[3]}]

set_property PACKAGE_PIN P15 [get_ports {cathods[4]}] # G (middle)
set_property IOSTANDARD LVCMOS33 [get_ports {cathods[4]}]

set_property PACKAGE_PIN T11 [get_ports {cathods[5]}] # G (middle)
set_property IOSTANDARD LVCMOS33 [get_ports {cathods[5]}]

set_property PACKAGE_PIN L18 [get_ports {cathods[6]}] # G (middle)
set_property IOSTANDARD LVCMOS33 [get_ports {cathods[6]}]

set_property PACKAGE_PIN H15 [get_ports {cathods[7]}] # G (middle)
set_property IOSTANDARD LVCMOS33 [get_ports {cathods[7]}]


----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/10/2025 10:41:49 PM
-- Design Name: 
-- Module Name: sevensegment_ex01 - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity sevensegment_ex01 is
    Port ( anodes : out  STD_LOGIC_VECTOR (7 downto 0);
     clk : in  STD_LOGIC;
           cathods : out  STD_LOGIC_VECTOR (7 downto 0));
end sevensegment_ex01;

architecture Behavioral of sevensegment_ex01 is
 signal digit0 :   std_logic_vector (7 downto 0);
 signal counter : natural range 0 to 9 := 0;
 signal clk_counter : natural range 0 to 50000000 := 0;
 
 
begin

 process(clk)
 begin 
  if rising_edge(clk) then 
   clk_counter <= clk_counter + 1; 
   if clk_counter >= 50000000 then 
     clk_counter <= 0;
     if counter > 8 then 
         counter <= 0;
    else
     counter <= counter +1; 
     end if;
   end if; 
  end if; 
 end process;
 
 
 process(counter)
 begin 
  case counter is 
   when 0 => cathods <= "11000000"; --0
   when 1 => cathods <= "11111001"; --1
   when 2 => cathods <= "10100100"; --2
   when 3 => cathods <= "10110000"; --3
   when 4 => cathods <= "10011001"; --4
   when 5 => cathods <= "10010010"; --5
   when 6 => cathods <= "10000010"; --6
   when 7 => cathods <= "11111000"; --7
   when 8 => cathods <= "10000000"; --8
   when 9 => cathods <= "10010000"; --9
  end case;
 end process;
 
 
 anodes <= "11111110";
 --cathods  <=  digit0;

end Behavioral;

