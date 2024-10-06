library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package subprog_pck is
	function get_parity_one (
		input_data: std_logic_vector
	) return std_logic;

	function get_parity_two (
		input_data: unsigned
	) return std_logic;

	procedure increment_data_value (
		signal clk       	: in 	std_logic;
		signal data_value	: out	unsigned
	);

end package subprog_pck;

package body subprog_pck is

	--Method 1: parity toggle, using for, loop and variables.	 
	function get_parity_one(input_data:	std_logic_vector)
		return std_logic is variable toggle: std_logic;
	begin
		toggle := '0';
		for i in input_data'range loop
			if input_data(i) = '1' then
				toggle := not toggle;
			end if;
		end loop;
		return toggle;
	end get_parity_one;

	-- Method: 2 parity using xor function (VHDL 2008)
	function get_parity_two(input_data: unsigned)
		return std_logic is variable toggle: std_logic;
	begin
		toggle := xor(input_data);
		return toggle;
	end get_parity_two;

	procedure increment_data_value (
		signal clk       	: in 	std_logic;
		signal data_value	: out	unsigned
	) is
	begin
		for i in 0 to 255 loop
			data_value <= to_unsigned(i, data_value'length);
			wait for 50 ns;
		end loop;
	end procedure increment_data_value;

end package body subprog_pck;
