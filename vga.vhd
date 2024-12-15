library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity vga is
  port(
		clk: in std_logic;
		r: out unsigned(9 downto 0);
		c: out unsigned(9 downto 0);
		HSYNC : out std_logic;
		VSYNC : out std_logic;
		Valid : out std_logic
  );
end vga;

architecture synth of vga is
signal row : unsigned(9 downto 0) := 10b"0";
signal column : unsigned(9 downto 0) := 10b"0";
begin
	process(clk) is begin
		if rising_edge(clk) then
			if column = 799 then
				row <= row + 1;
				column <= 10b"0";
			elsif row = 524 then
				row <= 10b"0";
				column <= 10b"0";
			else
				column <= column + 1;
			end if;
		end if;
		end process;
	r <= row;
	c <= column;
	HSYNC <= '0' when (column >= 655 and column < 751) else '1';
	VSYNC <= '0' when (row > 488 and row < 491) else '1';
	
	Valid <= '1' when (column < 640 and row < 480) else '0';
end;	
			

