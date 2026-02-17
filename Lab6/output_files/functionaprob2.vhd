
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY ALU2_FunctionA2 IS
PORT (
A ,B : IN unsigned(7 DOWNTO 0);
OP: IN unsigned(15 downto 0);
neg, neg1: OUT STD_LOGIC;
R1: OUT unsigned(3 DOWNTO 0);--lower 4bits of 8bits Result
R2: OUT unsigned(3 DOWNTO 0));--higher 4bits of 8bits Result
END ALU2_FunctionA2;

ARCHITECTURE Behavior OF ALU2_FunctionA2 IS
signal Result: unsigned(7 DOWNTO 0);

BEGIN
PROCESS (OP,A,B)
BEGIN
CASE (OP) IS

WHEN "0000000000000001"  => --Function 1 - swap the lower and upper 4 bits of A
neg <= '0';
neg1 <= '0';

Result <= (A+2);

WHEN "0000000000000010" =>--Function 2 - Produce the result of ORing A and B
neg <= '0';
neg1 <= '0';

Result(7) <= ('0');
Result(6) <= ('0');
Result(5) <= (B(7));
Result(4) <= (B(6));
Result(3) <= (B(5));
Result(2) <= (B(4));
Result(1) <= (B(3));
Result(0) <= (B(2));

WHEN "0000000000000100" => --Function 3 - decrement B by 5

Result(7) <= ('1');
Result(6) <= ('1');
Result(5) <= ('1');
Result(4) <= ('1');
Result(3) <= (A(7));
Result(2) <= (A(6));
Result(1) <= (A(5));
Result(0) <= (A(4));

WHEN "0000000000001000" =>--Function 4 - Invert all bits of A
neg <= '0';
neg1 <= '0';

neg <= '0';
neg1 <= '0';

if (A > B) then 
Result <= B;
else
Result <= A;
end if;

WHEN "0000000000010000" =>--Function 5 - Invert the bit-significance order of A
neg <= '0';
neg1 <= '0';

Result(7) <= (A(1));  -- A(7) becomes Result(0)
Result(6) <= (A(0));  -- A(6) becomes Result(1)
Result(5) <= (A(7));  -- A(5) becomes Result(2)
Result(4) <= (A(6));  -- A(4) becomes Result(3)
Result(3) <= (A(5));  -- A(3) becomes Result(4)
Result(2) <= (A(4));  -- A(2) becomes Result(5)
Result(1) <= (A(3));  -- A(1) becomes Result(6)
Result(0) <= (A(2));  -- A(0) becomes Result(7)

WHEN "0000000000100000" =>--Function 6 - Find the greater value of A and B and produce the results ( Max(A,B) )
Result(0) <= (B(7));  -- A(7) becomes Result(0)
Result(1) <= (B(6));  -- A(6) becomes Result(1)
Result(2) <= (B(5));  -- A(5) becomes Result(2)
Result(3) <= (B(4));  -- A(4) becomes Result(3)
Result(4) <= (B(3));  -- A(3) becomes Result(4)
Result(5) <= (B(2));  -- A(2) becomes Result(5)
Result(6) <= (B(1));  -- A(1) becomes Result(6)
Result(7) <= (B(0));  -- A(0) becomes Result(7)

WHEN "0000000001000000" =>--Function 7 - Produce the difference between A and B


Result <= (A XOR B);

WHEN "0000000010000000" =>--Function 8 - Poduce the result of XNORing A and B
neg <= '0';
neg1 <= '0';

Result <= ((A + B)-4);


WHEN OTHERS => -- don't care
END CASE;
END PROCESS;
R1 <= Result(3 DOWNTO 0);
R2 <= Result(7 DOWNTO 4);

END Behavior;
