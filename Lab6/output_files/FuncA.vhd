
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY FUnc_A IS
PORT (
A ,B : IN unsigned(7 DOWNTO 0);
OP: IN unsigned(15 downto 0);
neg, neg1: OUT STD_LOGIC;
R1: OUT unsigned(3 DOWNTO 0);--lower 4bits of 8bits Result
R2: OUT unsigned(3 DOWNTO 0));--higher 4bits of 8bits Result
END FUnc_A;

ARCHITECTURE Behavior OF FUnc_A IS
signal Result: unsigned(7 DOWNTO 0);

BEGIN
PROCESS (OP,A,B)
BEGIN
CASE (OP) IS

WHEN "0000000000000001" =>--Function 1 - Rotate A to right by 4 bits (ROR)
Result <= A + "0010" ;
if Result(7) = '1' then
neg <= '0';
elsif Result(3) = '1' then
neg1 <= '0';
else 
neg <= '0' ;
neg1 <= '0' ;
end if;



WHEN "0000000000000010" =>--Function 2 - Poduce the result of XORing A and B
neg <= '0';
neg1 <= '0';

Result <=  B srl 2 ;

WHEN "0000000000000100" =>--Function 3 - Invert the bit-significance order of A
neg <= '0';
neg1 <= '0';

Result(7) <= '1';  
Result(6) <= '1';  
Result(5) <= '1';  
Result(4) <= '1';  

Result(3) <= A(7); 
Result(2) <= A(6);  
Result(1) <= A(5);  
Result(0) <= A(4); 


WHEN "0000000000001000" => --Function 4 - Calculate the summation of A and B and decrease it by 2

neg <= '0';
neg1 <= '0';

if (A < B) then 
Result <= A;
else
Result <= B;
end if;


WHEN "0000000000010000" =>--Function 5 - Rotate B to left by 2 bits (ROL)
neg <= '0';
neg1 <= '0';

Result <=  A ror 2 ;


WHEN "0000000000100000" =>--Function 6 - invert the even bits of B 
neg <= '0';
neg1 <= '0';


Result(0) <= (B(7));  
Result(1) <= (B(6));  
Result(2) <= (B(5));  
Result(3) <= (B(4));  
Result(4) <= (B(3));  
Result(5) <= (B(2));  
Result(6) <= (B(1));  
Result(7) <= (B(0)); 

WHEN "0000000001000000"  => --Function 7 - Swap the lower 4 bits of B with lower 4 bits of A
neg <= '0';
neg1 <= '0';

Result <= (A XOR B);

WHEN "0000000010000000" =>--Function 8 - Shift B to right by 2 bits, input bit = 0 (SHR)
Result <= (A + B) - "0100" ;
if Result(7) = '1' then
neg <= '1';
elsif Result(3) = '1' then
neg1 <= '1';
else 
neg <= '0' ;
neg1 <= '0' ;
end if;

WHEN OTHERS => -- don't care
END CASE;
END PROCESS;
R1 <= Result(3 DOWNTO 0);
R2 <= Result(7 DOWNTO 4);

END Behavior;
