
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity fpga_system is
	port (
		SA			: in std_logic;
		SB			: in std_logic;
		c			: out std_logic;
		abcdefg		: out std_logic_vector(6 downto 0);
		DIR_synch	: out std_logic;
		EN_synch	: out std_logic;
		mclk		: in std_logic;
		reset		: in std_logic;
		gpio		: in std_logic_vector(7 downto 0);
		gpio2		: out std_logic_vector(7 downto 0)
	);
end fpga_system;

architecture beh of fpga_system is
	component pulse_width_modulator is
		port(
				duty_cycle : in std_logic_vector(7 downto 0);
				dir        : out std_logic;
				en         : out std_logic;
				mclk       : in std_logic;
				reset      : in std_logic
			);
	end component;

	component output_sync is
		port(
				dir          : in  std_logic;
				en           : in  std_logic;
				DIR_synch    : out std_logic;
				EN_synch     : out std_logic;
				mclk  	     : in  std_logic
			);
	end component;


	--- input to seg7ctrl section
	component input_sync is
		port(
				SA          : in std_logic;
				SB          : in std_logic;
				SA_synch    : out std_logic;
				SB_synch    : out std_logic;
				mclk		: in std_logic
			);
	end component;

	component quadrature_decoder is
		port(
				SA         : in std_logic;
				SB         : in std_logic;
				pos_inc    : out std_logic;
				pos_dec    : out std_logic;
				mclk       : in std_logic;
				reset      : in std_logic
			);
	end component;

	component velocity_reader is
		generic(
			RCOUNT_WIDTH : natural := 20; -- width of clock dividing down to 100Hz; -- 20 bit should be enough for 100MHz / 10^6 = 100Hz
			TEN_MS_COUNT : natural := 1000000 -- number of cycles until 10 ms is reached at 100MHz
		);
		port(
			mclk      : in std_logic;
			reset     : in std_logic;
			pos_inc   : in std_logic;
			pos_dec   : in std_logic;
			velocity  : out signed(7 downto 0) -- rpm value updated every 1/100 s
		);
	end component;

	component seg7ctrl is
		port(
				mclk    : in  std_logic;
				reset   : in  std_logic;
				d0      : in  std_logic_vector(3 downto 0);
				d1      : in  std_logic_vector(3 downto 0);
				abcdefg : out std_logic_vector(6 downto 0);
				c       : out std_logic
			);
	end component;

	signal duty_cycle	: std_logic_vector(7 downto 0);

	-- pwm => output sync
	signal dir			: std_logic;
	signal en			: std_logic;

	-- velocity_reader
	signal velocity		: signed(7 downto 0);

	-- quad => velocity_reader
	signal pos_dec		: std_logic;
	signal pos_inc		: std_logic;

	-- input_sync=>quad
	signal SA_synch		: std_logic;
	signal SB_synch		: std_logic;

begin

	UUT_PWM : entity work.pulse_width_modulator
		port map(
			duty_cycle	=> duty_cycle,
			dir			=> dir,
			en			=> en,
			mclk		=> mclk,
			reset		=> reset
		);

	UUT_OUT_SYNC: output_sync
		port map(
			dir			=> dir,
			en			=> en,
			DIR_synch	=> DIR_synch,
			EN_synch	=> EN_synch,
			mclk		=> mclk
		);

	UUT_IN_SYNC: input_sync
		port map(
			SA			=> SA,
			SB			=> SB,
			SA_synch	=> SA_synch,
			SB_synch	=> SB_synch,
			mclk		=> mclk
		);

	UUT_QUAD_DEC: quadrature_decoder
		port map(
			SA		=> SA_synch,
			SB		=> SB_synch,
			pos_inc	=> pos_inc,
			pos_dec	=> pos_dec,
			mclk	=> mclk,
			reset	=> reset
		);

	UUT_VEL_READ: velocity_reader
		port map(
			pos_inc		=> pos_inc,
			pos_dec		=> pos_dec,
			velocity	=> velocity,
			mclk		=> mclk,
			reset		=> reset
		);

	UUT_S7C: seg7ctrl
		port map(
			d0		=> std_logic_vector(unsigned(velocity(3 downto 0))),
			d1		=> std_logic_vector(unsigned(velocity(7 downto 4))),
			abcdefg	=> abcdefg,
			c		=> c,
			mclk	=> mclk,
			reset	=> reset
		);

	duty_cycle <= std_logic_vector(gpio);
	gpio2 <= std_logic_vector(velocity);

end architecture beh;


