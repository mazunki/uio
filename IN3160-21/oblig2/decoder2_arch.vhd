architecture decoder2_arch of decoder2_entity is
	-- declarations
		-- none	
begin
	demux : process (all) -- should be sw and ld
	begin
		with sw select
			ld <= 	"1110" when "00",
					"1101" when "01",
					"1011" when "10",
					"0101" when "11", -- changed value deliberately
					"0000" when others;
	end process demux;
end decoder2_arch;

