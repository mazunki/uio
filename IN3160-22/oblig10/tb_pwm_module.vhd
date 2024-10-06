library IEEE;
  use IEEE.std_logic_1164.all; 
  use IEEE.numeric_std.all;
  
entity tb_pulse_width_modulator is
 -- Empty entity of the testbench
end entity tb_pulse_width_modulator;

architecture behavioral of tb_pulse_width_modulator is
  
  -- 100 Mhz clock frequency
  constant HALF_PERIOD : time := 5 ns;
  constant PERIOD : time := 2* HALF_PERIOD;
  
  -- shortest and longest PWM cycles
  constant LONG_PWM_CYCLE : time := 100 ms;  -- 10 Hz : 1/10 = 100m
  constant SHORT_PWM_CYCLE : time := 200 us;  -- 5 kHz : 1/5k = 200u   
  
  -- error messages
  constant FSM_REP : string := " Check state machine";
  constant RES_REP : string := " Check reset routine";
  
  --components used in TB
  component pulse_width_modulator is
    port(
      mclk      : in std_logic; 
      reset     : in std_logic; -- Asynchronous reset, active high
      duty_cycle: in std_logic_vector(7 downto 0);
      dir       : out std_logic;
      en        : out std_logic
    );
  end component;
  
  -- signals used in TB
  signal mclk       : std_logic := '0';
  signal reset      : std_logic := '0';
  signal dir, en    : std_logic;
  signal duty_cycle : signed(7 downto 0) := (others => '0');
  
  -- Set reset, and test dir and enable
  procedure reset_test(reset_category: string; signal reset: out std_logic) is 
    variable v_dir : std_logic;
  begin 
    v_dir := dir;
    reset <= '1';
    wait for PERIOD;
      assert (en = '0') report reset_category & ": EN has not been disabled within 1 clock cycle." & RES_REP severity failure;
    reset <= '0';
    report reset_category & ": done!";
  end procedure reset_test;
  
begin
  TEST_UNIT : pulse_width_modulator
    port map(
      mclk => mclk,
      reset => reset,
      duty_cycle =>  std_logic_vector(duty_cycle),
      dir => dir,
      en => en
    );
    
  -- clock generation
  mclk  <= not mclk after HALF_PERIOD; 
    
  -- check that EN always is low when DIR is changed   
  EN_DIR_CHECK: process is
  begin
    wait on dir;
    assert en = '0' report "DIR changed when en = '1'. DO NOT IMPLEMENT THIS MODULE!" severity failure;
  end process;
  
  -- test if direction changes according to duty cycle (2 cycles after)
  DUTY_CYCLE_CHANGE_TEST: process is
    variable v_duty_cycle : signed(duty_cycle'high downto duty_cycle'low);
  begin
    wait on duty_cycle;
    v_duty_cycle := duty_cycle;
    wait for PERIOD*2;
    if v_duty_cycle = duty_cycle then 
      if v_duty_cycle > 0 then 
        assert dir = '1' 
          report "DIR is not '1' 2 clock cycles after duty cycle became positive. " & FSM_REP severity error;
      elsif v_duty_cycle < 0 then 
        assert dir = '0' 
          report "DIR is not '0' 2 clock cycles after duty cycle became positive. " & FSM_REP severity error;
      end if;
    end if;
  end process;
  
  
  STIMULI : process is
    variable en_event_time : time;
  begin
    -- initial value(s)
    duty_cycle <= to_signed(100, duty_cycle'length);
    
    wait for PERIOD*2;
  
    -- initial reset, check for dir og en 
    reset_test("Initial reset", reset);
    
    -- check if direction is set correctly according to duty_cycle
    wait for PERIOD*2;
    duty_cycle <= to_signed(-95, duty_cycle'length);
    wait for PERIOD*15;
    duty_cycle <= to_signed(127, duty_cycle'length);
    wait for PERIOD*14;
    duty_cycle <= to_signed(-127, duty_cycle'length);
    wait for PERIOD*13;
    report "Direction tests done";
    reset_test("second_reset", reset);
    wait for PERIOD*12;
    --std.env.finish; -- vil be om å slutte av simulering helt (lukker  vsim på en dum måte)
    
    -- check that pwm cycle (EN going H-L or L-H) is not too long or too short
    report "Starting pulse width tests- this may take some time...";
    duty_cycle <= to_signed(64, duty_cycle'length); -- set 50% duty cycle
    wait for PERIOD*4;
    wait on en for LONG_PWM_CYCLE/2; -- 10 Hz Half cycle
    en_event_time := now;
    assert en'last_event < LONG_PWM_CYCLE/2 
      report "PWM is not happening, EN has not changed in " & to_string(LONG_PWM_CYCLE/2) severity error; 
    wait on en for LONG_PWM_CYCLE/2; -- 10 Hz Half cycle
    
    en_event_time := now- en_event_time;
    assert en_event_time < LONG_PWM_CYCLE/2 
      report "PWM is not happening, EN has not changed in " & to_string(LONG_PWM_CYCLE/2) severity error; 
    assert en_event_time > SHORT_PWM_CYCLE/2 
      report "PWM too fast! EN has changed in less than " & to_string(SHORT_PWM_CYCLE/2) severity error;
    report "Timing test done";
    report "All tests are done!";
    -- finish in a way that can be resumed
    std.env.stop; 
    --std.env.finish; -- finish in a way that cannot be resumed (closes all). 
  end process;
    
end architecture behavioral;