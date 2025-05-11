library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sevensegmentCounter is
    Port ( anodes : out  STD_LOGIC_VECTOR (7 downto 0);
     clk : in  STD_LOGIC;
           cathods : out  STD_LOGIC_VECTOR (7 downto 0));
end sevensegmentCounter;

architecture Behavioral of sevensegmentCounter is
 signal counter : natural range 0 to 10 := 0;
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
   when others => cathods <= "11111111";
  end case;
 end process;
 
 
 anodes <= "11111110";

end Behavioral;
