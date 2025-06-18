LIBRARY ieee;
USE ieee.std_logic_1164.all;
ENTITY machine IS

PORT (reset, d_in, Clk : IN STD_LOGIC; 
		student_id: out std_logic_vector(3 downto 0);
		current_state : OUT STD_LOGIC_VECTOR (3 downto 0));
END machine;

ARCHITECTURE fsm OF machine IS
	type state_type is (s0,s1,s2,s3,s4,s5,s6,s7,s8);
	signal yfsm: state_type;
BEGIN
PROCESS (clk, reset)
	BEGIN
		IF reset = '1' THEN yfsm <= s0;--when reset is set to 1, yfsm is set to state 0
		ELSIF (clk'EVENT AND clk = '1') THEN --whenever the clock is on a rising edge and there is an event
			CASE yfsm is-- change w fsm type 
				when s0 =>	--when the data in is 1 shift the state to the next in the cycle
					IF (d_in='1') THEN yfsm<=s8;--example, when data in is 1 then we shift state 0 to the next state in the cycle which is state 8
					ELSE yfsm<=s0;
					END IF;
				when s8 =>
					IF (d_in='1') THEN yfsm<=s7;
					ELSE yfsm<=s8;
					END IF;
				when s7 => 
					IF (d_in='1') THEN yfsm<=s6;
					ELSE yfsm<=s7;
					END IF;
				when s6 => 
					IF (d_in='1') THEN yfsm<=s5;
					ELSE yfsm<=s6;
					END IF;
				when s5 => 
					IF (d_in='1') THEN yfsm<=s4;
					ELSE yfsm<=s5;
					END IF;
				when s4 => 
					IF (d_in='1') THEN yfsm<=s3;
					ELSE yfsm<=s4;
					END IF;
				when s3 => 
					IF (d_in='1') THEN yfsm<=s2;
					ELSE yfsm<=s3;
					END IF;
				when s2 => 
					IF (d_in='1') THEN yfsm<=s1;
					ELSE yfsm<=s2;
					END IF;
				when s1 => 
					IF (d_in='1') THEN yfsm<=s0;
					ELSE yfsm<=s1;
					END IF;
			END CASE;
		END IF;
	END PROCESS;

	-- moore
PROCESS (yfsm, d_in)--this is a moore cus the output is determined by the only current state yfsm, a mealy would depend on both input and current state
	BEGIN
		CASE yfsm is --change w fsm type 
						 --setting student id and current state binary for each state
				when s0 => student_id <= "0101";--5
						current_state <= "0000";--0
				when s8 => student_id <= "0000";--0
						current_state <= "1000";--8
				when s7 => student_id <= "0001";--1
						current_state <= "0111";--7
				when s6 => student_id <= "0001";--1
						current_state <= "0110";--6
				when s5 => student_id <= "0000";--0
						current_state <= "0101";--5
				when s4 => student_id <= "0101";--5
						current_state <= "0100";--4
				when s3 => student_id <= "0000";--0
						current_state <= "0011";--3
				when s2 => student_id <= "0111";--7
						current_state <= "0010";--2
				when s1 => student_id <= "0000";--0
						current_state <= "0001";--1
			END CASE;
	END PROCESS;
END fsm;
