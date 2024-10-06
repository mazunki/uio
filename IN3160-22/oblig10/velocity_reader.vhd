library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
--  use work.seg7_pkg.all; 

entity velocity_reader is
	generic(
			   -- these are made generics for the purpose of testing with a lower clock frequency:
			   RCOUNT_WIDTH : natural := 20; -- width of clock dividing down to 100Hz; -- 20 bit should be enough for 100MHz / 10^6 = 100Hz
			   TEN_MS_COUNT : natural := 1_000_000 -- number of cycles until 10 ms is reached at 100MHz
		   );
	port(
			mclk      : in std_logic; 
			reset     : in std_logic; 
			pos_inc   : in std_logic;
			pos_dec   : in std_logic;
			velocity  : out signed(7 downto 0) -- rpm value updated every 1/100 s 
		);
end entity velocity_reader;

architecture rtl of velocity_reader is
	-- counts up 1 when count_now is active and resets to 0 when reaching target
	function n_count(current : unsigned; count_now : boolean; target : natural := 9) 
		return unsigned is
	begin
		if count_now then 
			if current >= target then 
				return resize("0", current'length); -- pads with '0's
			else 
				return resize(current + 1, current'length); -- adds one and truncates overflow
			end if;
		else 
			return current; 
		end if;
	end function n_count;

	constant WIDTH : natural := 8;
	constant COUNT_WIDTH : natural := 7; -- width of position counting between -128 and + 127

	type shiftreg_type is array( natural range<>) of signed(COUNT_WIDTH downto 0);
	signal pos_shift : shiftreg_type(9 downto 0);  -- 10 shifted values + pos_count - oldest value = 10 count values 
	signal pos_count : signed(COUNT_WIDTH downto 0); 
	signal pos_count_next : signed(pos_count'range); -- defined same size as pos_count

	signal rcount : unsigned(RCOUNT_WIDTH-1 downto 0);
	signal rcount_next : unsigned(rcount'range);

	-- signals for detecting errors due to too long counting 
	signal max_pos_count : std_logic;  
	signal min_pos_count : std_logic;

	signal ten_ms_pulse  : std_logic;
	signal pos_count_reset : std_logic;

	-- moving sum for calculating average velocity / rpms
	signal moving_sum      : signed(COUNT_WIDTH+4 downto 0); -- 9 values + pos_count = 10 values in 100 ms. 
	signal moving_sum_next : signed(moving_sum'range);    

--
-- 200 pulses per round, 4 pos per pulse => 800 positions per round (ppr)
-- 800 ppr* 150 rpm = 120 000 positions per min 
-- 120 000 / 60 = 2 000 positions per second
-- 200 pos per 1/10s or 20 pos per 1/100s (or 160 pos per 80ms)
-- +-20 pos count : 6 bit signed
-- +- 200 pos count : 9 bit signed (use 10 bit for 10 iterations)
-- 

begin
	REGISTER_STORAGE: process (mclk, reset) is
	begin
		if reset = '1' then 
			pos_count       <= (others => '0');
			rcount          <= (others => '0');
			moving_sum      <= (others => '0');          
			for i in pos_shift'range loop
				pos_shift(i)  <= (others => '0');  -- initialise shiftregister
			end loop;
		elsif rising_edge(mclk) then 
			pos_count <= pos_count_next;  -- set next position count
			rcount    <= rcount_next;     -- set next 10 ms counter value
			if ten_ms_pulse = '1' then 
				moving_sum    <= moving_sum_next;     -- set moving sum
				pos_shift(0)  <= pos_count;           -- set first shiftregister
				for i in pos_shift'left -1 downto pos_shift'right loop
					pos_shift(i+1) <= pos_shift(i);     -- shift all shiftregisters
				end loop;
			end if;        
		end if;  
	end process;

	POSITION_COUNTER: process (all) is
	begin
		if pos_count_reset then 
			pos_count_next <= to_signed(0, pos_count'length) + pos_inc - pos_dec; 
		else 
			pos_count_next <= pos_count + pos_inc - pos_dec;
		end if;
	end process;

	CALC_VELOCITY: process (all)
	begin  
		if (abs(moving_sum) > 800-1) then 
			velocity <= to_signed(-127, velocity'length); -- a signal that we are out of bounds
		else 
			-- RPM: (moving_sum * 60sec per min/(0,10sec* 800pos per round) = moving_sum *3/4 rounds per min) 
			-- velocity <= resize( (moving_sum*3)/4, velocity'length ) ;

			-- rp10s: (moving_sum * 100 / 800) "Rounds per 10 second" -- does work with 8 bit
			velocity <= resize(moving_sum/8, velocity'length); 
		end if;
	end process;

	-- max and min pos should never occur, but can be useful during testing 
	max_pos_count <= '1' when ( pos_count = ((pos_count'left-1)**2 - 1) ) else '0'; -- when we have maximum value 2^size -1 
	min_pos_count <= '1' when ( pos_count = -((pos_count'left-1)**2) ) else '0'; -- when we have maximum value -2^size   -- should never occur

	-- counter for refreshing velocity calculation
	rcount_next <= n_count( rcount, true, TEN_MS_COUNT-1); -- count ten ms, then reset
	ten_ms_pulse <= '1' when (rcount = 0) else '0'; -- one clock period high every 10 ms
	pos_count_reset <= max_pos_count or min_pos_count or ten_ms_pulse; -- reset position counter every 10ms and at wraparound

	-- calculate moving sum (for generating average velocity)                        
	moving_sum_next <= moving_sum + pos_count - pos_shift(pos_shift'left); -- = accumulated position count + last count - oldest count
end architecture rtl; 
