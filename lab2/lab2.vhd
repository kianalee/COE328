LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

ENTITY lab2 IS
PORT (
a, b, c, d : IN STD_LOGIC ;
f : OUT STD_LOGIC );
end lab2;

ARCHITECTURE Behavior OF lab2 IS
BEGIN
f <= ((NOT a) AND b AND d) OR (a AND b AND (NOT d)) OR ((NOT a) AND (NOT b) AND (NOT c) AND (NOT d)) OR (a AND (NOT b) AND c AND d); 
END Behavior;