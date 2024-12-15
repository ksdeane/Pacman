library IEEE;
use IEEE.std_logic_1164.all; 
use IEEE.numeric_std.all;

entity collision_check is
	port (
		clk : in std_logic;
		pacy : out unsigned(9 downto 0);
		pacx : out unsigned(9 downto 0);
		ghosty : out unsigned(9 downto 0);
		ghostx : out unsigned(9 downto 0);
		collision : out std_logic
	);
end collision_check;


architecture synth of collision_check is
begin
process (clk) begin 
	if rising_edge(clk) then 
	 collision <= '1' when (
							 ((pacy <= ghosty + 32 and pacy >= ghosty)
							 or 
							 (pacy + 32 >= ghosty and pacy + 32 <= ghosty + 32)
							 ) and (
							 (pacx <= ghostx + 34 and pacx >= ghostx - 2)
							 or
							 (pacx + 30 >= ghostx and pacx + 32 <= ghostx + 32) )
							 ) else '0';
	end if;
end process;
end;