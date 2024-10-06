library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- declaration
package subprog_pck is
	constant DEFAULT_WIDTH : integer := 16;

	function method_one ( input_data : std_logic_vector )
		return std_logic;

	function method_two ( input_data : unsigned )
		return std_logic;

	procedure IncrementDataValue (
		signal clk 			: in std_logic;
		signal data_value 	: out unsigned
	);

end package subprog_pck;

-- body
package body subprog_pck is 

--Method 1: parity toggle, using for, loop and variables.
	function method_one ( input_data : std_logic_vector )
    	return std_logic is variable toggle : std_logic;
    begin
    	toggle := '0';
    	for i in input_data'range loop
        	if input_data(i) = '1' then
        		toggle := not toggle;
        	end if;
    	end loop;
  		return toggle;
	end method_one;

-- Method: 2 parity using xor function (VHDL 2008)
	function method_two ( input_data : unsigned )
    	return std_logic is variable toggle : std_logic;
    begin
    	toggle := xor(input_data);  -- Cascaded XORs
    	return toggle;
 	end method_two;


-- incremente by one
	procedure IncrementDataValue (	signal clk 			: in std_logic; 
									signal data_value 	: out unsigned ) is 
	begin
		for i in 0 to 255 loop
		 	data_value <= to_unsigned(i, data_value'length);
		  	wait for 50 ns;
	  	end loop;
  	end procedure IncrementDataValue;

end package body subprog_pck;