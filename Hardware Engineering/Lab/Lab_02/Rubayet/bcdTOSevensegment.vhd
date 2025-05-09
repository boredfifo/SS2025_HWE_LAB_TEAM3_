ENTITY bcdTOSevensegment IS
PORT(BCD_input:IN BIT_VECTOR(3 downto 0);
	SEVEN_SEGMENT_OUTPUT: OUT BIT_VECTOR(6 downto 0));
END bcdTOSevensegment;
ARCHITECTURE behavioural OF bcdTOSevensegment IS
BEGIN
WITH BCD_input SELECT
SEVEN_SEGMENT_OUTPUT(0) <= 	'0' when "0000", 
				'0' when "0001",
				'1' when "0010", 		
				'1' when "0011", 	
				'1' when "0100", 	
				'1' when "0101", 	
				'1' when "0110", 	
				'1' when "0111", 
				'1' when "1000", 	
				'1' when "1001",
				'1' when OTHERS;
WITH BCD_input SELECT
SEVEN_SEGMENT_OUTPUT(1) <= 	'1' when "0000", 
				'1' when "0001",
				'1' when "0010", 		
				'1' when "0011", 	
				'1' when "0100", 	
				'0' when "0101", 	
				'0' when "0110", 	
				'1' when "0111", 
				'1' when "1000", 	
				'1' when "1001",
				'1' when OTHERS;
WITH BCD_input SELECT
SEVEN_SEGMENT_OUTPUT(2)<= 	'1' when "0000", 
				'1' when "0001",
				'1' when "0010", 		
				'1' when "0011", 	
				'0' when "0100", 	
				'1' when "0101", 	
				'1' when "0110", 	
				'1' when "0111", 
				'1' when "1000", 	
				'1' when "1001",
				'1' when OTHERS;
WITH BCD_input SELECT
SEVEN_SEGMENT_OUTPUT(3) <= 	'1' when "0000", 
				'0' when "0001",
				'0' when "0010", 		
				'0' when "0011", 	
				'1' when "0100", 	
				'1' when "0101", 	
				'1' when "0110", 	
				'0' when "0111", 
				'1' when "1000", 	
				'1' when "1001",
				'1' when OTHERS;
WITH BCD_input SELECT
SEVEN_SEGMENT_OUTPUT(4) <= 	'1' when "0000", 
				'1' when "0001",
				'1' when "0010", 		
				'1' when "0011", 	
				'1' when "0100", 	
				'0' when "0101", 	
				'0' when "0110", 	
				'1' when "0111", 
				'1' when "1000", 	
				'1' when "1001",
				'0' when OTHERS;
WITH BCD_input SELECT
SEVEN_SEGMENT_OUTPUT(5) <= 	'1' when "0000", 
				'1' when "0001",
				'1' when "0010", 		
				'1' when "0011", 	
				'0' when "0100", 	
				'1' when "0101", 	
				'1' when "0110", 	
				'0' when "0111", 
				'1' when "1000", 	
				'0' when "1001",
				'1' when OTHERS;
WITH BCD_input SELECT
SEVEN_SEGMENT_OUTPUT(6) <= 	'1' when "0000", 
				'1' when "0001",
				'0' when "0010", 		
				'1' when "0011", 	
				'1' when "0100", 	
				'1' when "0101", 	
				'1' when "0110", 	
				'1' when "0111", 
				'1' when "1000", 	
				'1' when "1001",
				'1' when OTHERS;
END behavioural;    
