
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY ALU2_FunctionB IS
PORT (
A ,B : IN unsigned(7 DOWNTO 0);
OP: IN unsigned(15 downto 0);
neg, neg1: OUT STD_LOGIC;
R1: OUT unsigned(3 DOWNTO 0);--lower 4bits of 8bits Result
R2: OUT unsigned(3 DOWNTO 0));--higher 4bits of 8bits Result
END ALU2_FunctionB;

ARCHITECTURE Behavior OF ALU2_FunctionB IS
signal Result: unsigned(7 DOWNTO 0);

BEGIN
PROCESS (OP,A,B)
BEGIN
CASE (OP) IS

WHEN "0000000000000001"  => --Function 1 - swap the lower and upper 4 bits of A
neg <= '0';
neg1 <= '0';

Result(0) <= A(4);
Result(1) <= A(5);
Result(2) <= A(6);
Result(3) <= A(7);
Result(4) <= A(0);
Result(5) <= A(1);
Result(6) <= A(2);
Result(7) <= A(3);

WHEN "0000000000000010" =>--Function 2 - Produce the result of ORing A and B
neg <= '0';
neg1 <= '0';

Result <= (A OR B);

WHEN "0000000000000100" => --Function 3 - decrement B by 5

Result <= B - "0101" ;
if Result(7) = '1' then
neg <= '1';
elsif Result(3) = '1' then
neg1 <= '1';
else 
neg <= '0' ;
neg1 <= '0' ;
end if;

WHEN "0000000000001000" =>--Function 4 - Invert all bits of A
neg <= '0';
neg1 <= '0';

Result(0) <= not(A(0));
Result(1) <= not(A(1));
Result(2) <= not(A(2));
Result(3) <= not(A(3));
Result(4) <= not(A(4));
Result(5) <= not(A(5));
Result(6) <= not(A(6));
Result(7) <= not(A(7));

WHEN "0000000000010000" =>--Function 5 - Invert the bit-significance order of A
neg <= '0';
neg1 <= '0';

Result(0) <= (A(7));  -- A(7) becomes Result(0)
Result(1) <= (A(6));  -- A(6) becomes Result(1)
Result(2) <= (A(5));  -- A(5) becomes Result(2)
Result(3) <= (A(4));  -- A(4) becomes Result(3)
Result(4) <= (A(3));  -- A(3) becomes Result(4)
Result(5) <= (A(2));  -- A(2) becomes Result(5)
Result(6) <= (A(1));  -- A(1) becomes Result(6)
Result(7) <= (A(0));  -- A(0) becomes Result(7)

WHEN "0000000000100000" =>--Function 6 - Find the greater value of A and B and produce the results ( Max(A,B) )
neg <= '0';
neg1 <= '0';

if (A > B) then 
Result <= A;
else
Result <= B;
end if;

WHEN "0000000001000000" =>--Function 7 - Produce the difference between A and B


if (A < B) then
Result <= B - A;
neg <= '1';
elsif (B < A) then
Result <= A - B;
neg <= '0';
end if;

WHEN "0000000010000000" =>--Function 8 - Poduce the result of XNORing A and B
neg <= '0';
neg1 <= '0';

Result <= (A XNOR B);


WHEN OTHERS => -- don't care
END CASE;
END PROCESS;
R1 <= Result(3 DOWNTO 0);
R2 <= Result(7 DOWNTO 4);

END Behavior;
