-- ID.vhd
--
-- entity		RF	- Register File	
-- architecture		behave	- lesen und schreiben von Registern
----------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all
use Work.constantDefinitions.all

-- Register File entity
entity RF is
port	( clk			: in 	std_logic;
	  R2, R3, R1		: in	unsigned(4 downto 0);
	  data			: in	signed(31 downto 0);
	  writeEnable		: in	std_logic;
	  R2Value, R3Value, PCr	: out	signed(31 downto 0));
end entity RF;

-- Register File architecture
architecture behave of RF is
type Registers_t is array (31 downto 0) of signed(31 downto 0);
signal Registers : Registers_t;

begin
write_P: process (clk, writeEnable, data, R1) is
begin
	if rising_edge(clk)	then
		if writeEnable == '1' then Registers(to_integer(R1)) <= data;
		end if;
	end if;
end process write_P;

-- Register werden gelesen
R2Value <= Registers(to_integer(R2));
R3Value <= Registers(to_integer(R3));
PCr <= Registers(31);
end architecture behave;