library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;


entity quadrature_decoder is
	port(
			SA         : in std_logic;
			SB         : in std_logic;
			pos_inc    : out std_logic;
			pos_dec    : out std_logic;
			mclk       : in std_logic;
			reset      : in std_logic
		);
end entity quadrature_decoder;

architecture rtl of quadrature_decoder is
	type mealy_state_type is (S_reset, S_init, S_0, S_1, S_2, S_3);
	signal mealy_state_curr, mealy_state_next : mealy_state_type;
	signal err : std_logic := '0';
begin
	-- clocks the finite state machine
	CLK_FSM : process (mclk, reset) begin
		if reset = '1' then
			mealy_state_curr <= S_reset;
		elsif rising_edge(mclk) then
			mealy_state_curr <= mealy_state_next;
		end if;
	end process CLK_FSM;

	STATE_CLK: process(SA, SB, mealy_state_curr) begin
		case mealy_state_curr is
			when S_reset =>
				mealy_state_next <= S_init;
			when S_init => mealy_state_next <=
				S_0 when SA = '0' and SB = '0' else
				S_1 when SA = '0' and SB = '1' else
				S_2 when SA = '1' and SB = '1' else
				S_3 when SA = '1' and SB = '0';
			when S_0 => mealy_state_next <=
				S_0 when SA = '0' and SB = '0' else
				S_1 when SA = '0' and SB = '1' else
				S_reset when SA = '1' and SB = '1' else
				S_3 when SA = '1' and SB = '0';
			when S_1 => mealy_state_next <=
				S_0 when SA = '0' and SB = '0' else
				S_1 when SA = '0' and SB = '1' else
				S_2 when SA = '1' and SB = '1' else
				S_reset when SA = '1' and SB = '0';
			when S_2 => mealy_state_next <=
				S_reset when SA = '0' and SB = '0' else
				S_1 when SA = '0' and SB = '1' else
				S_2 when SA = '1' and SB = '1' else
				S_3 when SA = '1' and SB = '0';
			when S_3 => mealy_state_next <=
				S_0 when SA = '0' and SB = '0' else
				S_reset when SA = '0' and SB = '1' else
				S_2 when SA = '1' and SB = '1' else
				S_3 when SA = '1' and SB = '0';
		end case;
	end process STATE_CLK;

	OUT_CLK: process(all) begin
		case mealy_state_curr is
			when S_reset =>
				pos_inc  <= '0';
				pos_dec  <= '0';
				err      <= '0';
			when S_init =>
				pos_inc  <= '0';
				pos_dec  <= '0';
				err      <= '0';
			when S_0 =>
				pos_inc  <= '1' when mealy_state_next = S_1;
				pos_dec  <= '1' when mealy_state_next = S_3;
				err      <= '1' when mealy_state_next = S_reset;
			when S_1 =>
				pos_inc  <= '1' when mealy_state_next = S_2;
				pos_dec  <= '1' when mealy_state_next = S_0;
				err      <= '1' when mealy_state_next = S_reset;
			when S_2 =>
				pos_inc  <= '1' when mealy_state_next = S_3;
				pos_dec  <= '1' when mealy_state_next = S_1;
				err      <= '1' when mealy_state_next = S_reset;
			when S_3 =>
				pos_inc  <= '1' when mealy_state_next = S_0;
				pos_dec  <= '1' when mealy_state_next = S_2;
				err      <= '1' when mealy_state_next = S_reset;
			when others =>
				err		<= '0';
				pos_inc <= '0';
				pos_dec <= '0';
		end case;
	end process OUT_CLK;
end architecture rtl;

