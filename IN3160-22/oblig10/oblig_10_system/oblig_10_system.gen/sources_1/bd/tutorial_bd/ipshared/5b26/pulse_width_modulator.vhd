library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity pulse_width_modulator is
    port(
      mclk      : in std_logic; 
      reset     : in std_logic; -- Asynchronous reset, active high
      duty_cycle: in std_logic_vector(7 downto 0);
      dir       : out std_logic;  -- direction of motor
      en        : out std_logic   -- enable motor
    );
end entity pulse_width_modulator;

architecture rtl of pulse_width_modulator is
  
  type moore_state_type is (forward_idle, forward, reverse_idle, reverse);  -- states
  signal moore_state_curr, moore_state_next : moore_state_type;
  signal pwm : std_logic := '0';

  -- Changed to signal 
  signal pwm_counter : unsigned(19 downto 0) := (others => '0');

begin
	-- Looks good :) 
	-- clocks the finite state machine
	CLK_FSM : process (mclk, reset) begin
		if reset = '1' then
			moore_state_curr <= forward_idle;
		elsif rising_edge(mclk) then
			moore_state_curr <= moore_state_next;
		end if;
	end process CLK_FSM;

	-- Looks good :)
	-- the moore state assigns the values to outputs, and goes down into a mealy condition
	OUT_CLK : process (all) begin
		case moore_state_curr is
			when forward_idle =>
				en <= '0';
				dir <= '1';
			when forward =>
				en <= pwm;
				dir <= '1';
			when reverse_idle =>
				en <= '0';
				dir <= '0';
			when reverse =>
				en <= pwm;
				dir <= '0';
			when others =>
				en <= '0';
				dir <= '0';
		end case;
	end process OUT_CLK;

	-- Changed process to all, sometimes fixes error
	-- Otherwise this looks good, but i would try to minimize using if else
	STATE_CLK : process (all) begin
		case moore_state_curr is
			when forward_idle =>
				if signed(duty_cycle) > 0 then
					moore_state_next <= forward;
				else
					moore_state_next <= reverse_idle;
				end if;
			when forward =>
				if signed(duty_cycle) > 0 then
					moore_state_next <= forward;
				else
					moore_state_next <= forward_idle;
				end if;
			when reverse_idle =>
				if signed(duty_cycle) < 0 then
					moore_state_next <= reverse;
				else
					moore_state_next <= forward_idle;
				end if;
			when reverse =>
				if signed(duty_cycle) < 0 then
					moore_state_next <= reverse;
				else
					moore_state_next <= reverse_idle;
				end if;
		end case;
	end process STATE_cLK;



	CLK_PWM : process (all) 
		-- Removed the variable changed to signal
		--variable pwm_counter : unsigned(19 downto 0) := (others => '0');
	begin
		if reset = '1' then
			pwm_counter <= (others => '0');
		elsif rising_edge(mclk) then
			pwm_counter <= pwm_counter+1;
		end if;
		-- Comparing pwm data to pwm data does not make sense. 
		-- I would change this to compare pwm_counter(19 downto 12) to duty_cycle, ref figure 4 in the oblig
		pwm <= '1' when unsigned(pwm_counter(19 downto 12)) < unsigned(duty_cycle) else '0';
	end process CLK_PWM;

end architecture rtl;
