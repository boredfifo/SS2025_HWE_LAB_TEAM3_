library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

ENTITY Accumulator IS
    PORT( 
        datafromALU          : IN STD_LOGIC_VECTOR(7 downto 0);
        dataFromDataUnit     : IN STD_LOGIC_VECTOR(7 downto 0);
        clock, load, reset   : IN STD_LOGIC;
        sourceSelector       : IN STD_LOGIC_VECTOR(1 downto 0);
        carryBit             : IN STD_LOGIC;
        outputSelector       : IN STD_LOGIC;
        
        dataintoALU          : OUT STD_LOGIC_VECTOR(7 downto 0);
        dataintoDataUnit     : OUT STD_LOGIC_VECTOR(7 downto 0);
        --myOutputSignal       : OUT STD_LOGIC_VECTOR(7 downto 0);
        flagEnablerFromControlUnit : IN STD_LOGIC;
        
        negativeFlag         : OUT STD_LOGIC;
        ZeroFlag             : OUT STD_LOGIC;
        carryFlag            : OUT STD_LOGIC
    );
END Accumulator;

ARCHITECTURE BEHAVIOURAL OF Accumulator IS
    SIGNAL accumulatorDecode : STD_LOGIC_VECTOR(7 downto 0);

component accDEMUX
port(accOUTPUT: IN STD_LOGIC_VECTOR (7 downto 0);
	SEL: IN STD_LOGIC;
	toALU, todataMEMORY: OUT STD_LOGIC_VECTOR (7 downto 0)
);
end component;
	
BEGIN

    PROCESS(clock, reset)
    BEGIN
        IF reset = '1' THEN
            -- accumulatorDecode <= (OTHERS => '0');
        ELSIF rising_edge(clock) THEN
            IF load = '1' THEN
                CASE sourceSelector IS
                    WHEN "00"   => accumulatorDecode <= datafromALU; --after ADD SUB
                    WHEN "01"   => accumulatorDecode <= dataFromDataUnit; --LOAD
                    WHEN OTHERS => NULL; -- Retain current value
                END CASE;
            END IF;
        END IF;
    END PROCESS;


	DEMUX: accDEMUX port map (accOUTPUT=>accumulatorDecode, SEL=>outputSelector, toALU=>dataintoALU, 
		todataMEMORY=>dataintoDataUnit);
    --dataintoALU      <= accumulatorDecode WHEN outputSelector = "00" ELSE (OTHERS=>'0') ; --ADDSUB
    --dataintoDataUnit <= accumulatorDecode WHEN outputSelector = "01"  ELSE (OTHERS=>'0')  ; --STORE
    --myOutputSignal   <= accumulatorDecode;

    PROCESS(accumulatorDecode, carryBit, flagEnablerFromControlUnit)
    BEGIN
        IF flagEnablerFromControlUnit = '1' THEN
            IF accumulatorDecode = "00000000" THEN
                ZeroFlag <= '1';
            ELSE
                ZeroFlag <= '0';
            END IF;

            negativeFlag <= accumulatorDecode(7);
            carryFlag    <= carryBit;
        ELSE
            ZeroFlag     <= '0';
            negativeFlag <= '0';
            carryFlag    <= '0';
        END IF;
    END PROCESS;

END BEHAVIOURAL;
