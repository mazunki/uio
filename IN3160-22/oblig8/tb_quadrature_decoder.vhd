library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.numeric_std.all;

entity tb_quadrature_decoder is
	--
end entity;

architecture arch of tb_quadrature_decoder is
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

	signal tb_mclk    : std_logic;
	signal tb_reset   : std_logic;
	signal tb_SA, tb_SB, tb_pos_dec, tb_pos_inc : std_logic;

begin
	UUT: quadrature_decoder
		port map(
			mclk    => tb_mclk,
			reset   => tb_reset,
			SA      => tb_SA,
			SB      => tb_SB,
			pos_inc => tb_pos_inc,
			pos_dec => tb_pos_dec
		);

	CLK_0: process
	begin
		tb_mclk <= '0';
		wait for 5 ns;
		tb_mclk <= '1';
		wait for 5 ns;
	end process CLK_0;

	tb_reset <= '0',
				'1' after 50 ns,
				'0' after 150 ns;

	tb_SA <= '0',
			 '1' after 50 ns,
			 '0' after 200 ns,
			 '0' after 250 ns,
			 '0' after 300 ns,
			 '1' after 350 ns,
			 '1' after 400 ns,
			 '0' after 450 ns,
			 '1' after 500 ns,
			 '0' after 550 ns;

	tb_SB <= '0',
			 '1' after 50 ns,
			 '0' after 200 ns,
			 '0' after 250 ns,
			 '1' after 300 ns,
			 '0' after 350 ns,
			 '1' after 400 ns,
			 '0' after 450 ns,
			 '1' after 500 ns,
			 '0' after 550 ns;

end architecture;
