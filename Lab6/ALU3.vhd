LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY ALU3 IS
    PORT (
        A        : IN unsigned(7 DOWNTO 0);
        B        : IN unsigned(7 DOWNTO 0);
        OP       : IN unsigned(15 DOWNTO 0);
        student_id : IN unsigned(3 DOWNTO 0);
		  student_id2 : IN unsigned(3 DOWNTO 0);
		  student_id3 : IN unsigned(3 DOWNTO 0);
        neg      : OUT STD_LOGIC;
        Result   : OUT unsigned(3 DOWNTO 0);
		  Result_imran   : OUT unsigned(3 DOWNTO 0);
        twentyone  : OUT unsigned(7 DOWNTO 4)
    );
END ALU3;

ARCHITECTURE Behavior OF ALU3 IS
BEGIN
    PROCESS (OP, A, B, student_id, student_id2, student_id3)
    BEGIN
        -- Default assignments
        neg <= '0';  -- Always set neg to '0' (common to all cases)
        twentyone <= "0000"; -- Default value for twentyone
		  Result <= "0000";
		  Result_imran <= "0000";
		  

        CASE (OP) IS
            WHEN "0000000000000001" =>  -- case h
                IF ((B(7 DOWNTO 4) < student_id) OR (B(3 DOWNTO 0) < student_id)) THEN
											  twentyone <= "0000"; --y
										 ELSE
											  twentyone <= "0001"; --n
										 END IF;

                -- case a
                IF student_id2(0) = '1' THEN
                    Result <= "0000";
                ELSE
                    Result <= "0001";
                END IF;
					 
					 -- case b
					 IF student_id3(0) = '0' THEN
                    Result_imran  <= "0000";
                ELSE
                    Result_imran  <= "0001";
                END IF;

            WHEN "0000000000000010" => -- case 2
                IF ((B(7 DOWNTO 4) < student_id) OR (B(3 DOWNTO 0) < student_id)) THEN
                    twentyone <= "0000";
                ELSE
                    twentyone <= "0001";
                END IF;

                -- case a
                IF student_id2(0) = '1' THEN
                    Result <= "0000";
                ELSE
                    Result <= "0001";
                END IF;
					 
					  -- case b
					 IF student_id3(0) = '0' THEN
                    Result_imran  <= "0000";
                ELSE
                    Result_imran  <= "0001";
                END IF;

            WHEN "0000000000000100" => -- case 4
                IF ((B(7 DOWNTO 4) < student_id) OR (B(3 DOWNTO 0) < student_id)) THEN
                    twentyone <= "0000";
                ELSE
                    twentyone <= "0001";
                END IF;

                -- case a
                IF student_id2(0) = '1' THEN
                    Result <= "0000";
                ELSE
                    Result <= "0001";
                END IF;

					  -- case b
					 IF student_id3(0) = '0' THEN
                    Result_imran  <= "0000";
                ELSE
                    Result_imran  <= "0001";
                END IF;
            WHEN "0000000000001000" => -- case 8
                IF ((B(7 DOWNTO 4) < student_id) OR (B(3 DOWNTO 0) < student_id)) THEN
                    twentyone <= "0000";
                ELSE
                    twentyone <= "0001";
                END IF;

                -- case a
                IF student_id2(0) = '1' THEN
                    Result <= "0000";
                ELSE
                    Result <= "0001";
                END IF;

					  -- case b
					 IF student_id3(0) = '0' THEN
                    Result_imran  <= "0000";
                ELSE
                    Result_imran  <= "0001";
                END IF;
            WHEN "0000000000010000" => -- case 16
                IF ((B(7 DOWNTO 4) < student_id) OR (B(3 DOWNTO 0) < student_id)) THEN
                    twentyone <= "0000";
                ELSE
                    twentyone <= "0001";
                END IF;
                -- case a
                IF student_id2(0) = '1' THEN
                    Result <= "0000";
                ELSE
                    Result <= "0001";
                END IF;

					  -- case b
					 IF student_id3(0) = '0' THEN
                    Result_imran  <= "0000";
                ELSE
                    Result_imran  <= "0001";
                END IF;
            WHEN "0000000000100000" => -- case 32
                IF ((B(7 DOWNTO 4) < student_id) OR (B(3 DOWNTO 0) < student_id)) THEN
                    twentyone <= "0000";
                ELSE
                    twentyone <= "0001";
                END IF;

                -- case a
                IF student_id2(0) = '1' THEN
                    Result <= "0000";
                ELSE
                    Result <= "0001";
                END IF;

					  -- case b
					 IF student_id3(0) = '0' THEN
                    Result_imran  <= "0000";
                ELSE
                    Result_imran  <= "0001";
                END IF;
            WHEN "0000000001000000" => -- case 64
                IF ((B(7 DOWNTO 4) < student_id) OR (B(3 DOWNTO 0) < student_id)) THEN
                    twentyone <= "0000";
                ELSE
                    twentyone <= "0001";
                END IF;
					 -- case a
                IF student_id2(0) = '1' THEN
                    Result <= "0000";
                ELSE
                    Result <= "0001";
                END IF;

					  -- case b
					 IF student_id3(0) = '0' THEN
                    Result_imran  <= "0000";
                ELSE
                    Result_imran  <= "0001";
                END IF;
            WHEN "0000000010000000" => -- case 128
                IF ((B(7 DOWNTO 4) < student_id) OR (B(3 DOWNTO 0) < student_id)) THEN
                    twentyone <= "0000";
                ELSE
                    twentyone <= "0001";
                END IF;

                -- case a
                IF student_id2(0) = '1' THEN
                    Result <= "0000";
                ELSE
                    Result <= "0001";
                END IF;

					  -- case b
					 IF student_id3(0) = '0' THEN
                    Result_imran  <= "0000";
                ELSE
                    Result_imran  <= "0001";
                END IF;
            WHEN OTHERS => -- don't care
                -- You can leave this empty or handle unexpected cases
                NULL;
        END CASE;
    END PROCESS;
END Behavior;
