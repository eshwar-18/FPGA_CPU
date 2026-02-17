LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY ALU3_Imran IS
    PORT (
        A        : IN unsigned(7 DOWNTO 0);
        B        : IN unsigned(7 DOWNTO 0);
        OP       : IN unsigned(15 DOWNTO 0);
		  student_id3 : IN unsigned(3 DOWNTO 0);
        neg      : OUT STD_LOGIC;
        Result   : OUT unsigned(3 DOWNTO 0);
		  
        twentyone  : OUT unsigned(7 DOWNTO 4)
    );
END ALU3_Imran;

ARCHITECTURE Behavior OF ALU3_Imran IS
BEGIN
    PROCESS (OP, A, B, student_id3)
    BEGIN
        
        neg <= '0';  
        twentyone <= "0000"; 
		  --- case b - imran student number

        CASE (OP) IS
            WHEN "0000000000000001" =>  -- case h
                
                IF student_id3(0) = '0' THEN
                    Result <= "0000";
                ELSE
                    Result <= "0001";
                END IF;

            WHEN "0000000000000010" => -- case 2
               
                IF student_id3(0) = '0' THEN
                    Result <= "0000";
                ELSE
                    Result <= "0001";
                END IF;

            WHEN "0000000000000100" => -- case 4
               
                IF student_id3(0) = '0' THEN
                    Result <= "0000";
                ELSE
                    Result <= "0001";
                END IF;

            WHEN "0000000000001000" => -- case 8
                
                IF student_id3(0) = '0' THEN
                    Result <= "0000";
                ELSE
                    Result <= "0001";
                END IF;

            WHEN "0000000000010000" => -- case 16
               
                IF student_id3(0) = '1' THEN
                    Result <= "0000";
                ELSE
                    Result <= "0001";
                END IF;

            WHEN "0000000000100000" => -- case 32
                
                IF student_id3(0) = '0' THEN
                    Result <= "0000";
                ELSE
                    Result <= "0001";
                END IF;

            WHEN "0000000001000000" => -- case 64
               
                IF student_id3(0) = '0' THEN
                    Result <= "0000";
                ELSE
                    Result <= "0001";
                END IF;

            WHEN "0000000010000000" => -- case 128
               
                IF student_id3(0) = '0' THEN
                    Result <= "0000";
                ELSE
                    Result <= "0001";
                END IF;

            WHEN OTHERS => 
               
                NULL;
        END CASE;
    END PROCESS;
END Behavior;


