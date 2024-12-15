library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;


entity coin_check is
generic (
   WORD_SIZE : natural := 20; -- Bits per word (read/write block size)
   N_WORDS : natural := 15; -- Number of words in the memory
   ADDR_WIDTH : natural := 4 -- This should be log2 of N_WORDS; see the Big Guide to Memory for a way to eliminate this manual calculation
);
 port(
   clk : in  std_logic;            
   valid : in  std_logic;               
   address_x : in  unsigned(9 downto 0);
   address_y : in  unsigned(9 downto 0);
   coin : out std_logic
 );
end coin_check;


architecture synth of coin_check is
--components



--signals
signal row_addr : std_logic_vector(3 downto 0);
signal col_addr : unsigned(4 downto 0);
signal display_colors : unsigned(19 downto 0);

signal column : unsigned(9 downto 0);
signal row : unsigned(9 downto 0);



begin
           
column <= address_x;
row <= address_y;


process (clk) begin
   if rising_edge(clk) then
	   if (valid = '1' and
	   (
		 ((column >= 14 and column < 17) and (display_colors(19) = '0'))
		 or
		 ((column > 45 and column < 49) and (display_colors(18) = '0'))
		 or
		 ((column > 77 and column < 81) and (display_colors(17) = '0'))
		 or
		 ((column > 109 and column < 113) and (display_colors(16) = '0'))
		 or
		 ((column > 141 and column < 145) and (display_colors(15) = '0'))
		 or
		 ((column > 173 and column < 177) and (display_colors(14) = '0'))
		 or
		 ((column > 205 and column < 209) and (display_colors(13) = '0'))
		 or
		 ((column > 237 and column < 241) and (display_colors(12) = '0'))
		 or
		 ((column > 269 and column < 273) and (display_colors(11) = '0'))
		 or
		 ((column > 301 and column < 305) and (display_colors(10) = '0'))
		 or
		 ((column > 333 and column < 337) and (display_colors(9) = '0'))
		 or
		 ((column > 365 and column < 369) and (display_colors(8) = '0'))
		 or
		 ((column > 397 and column < 401) and (display_colors(7) = '0'))
		 or
		 ((column > 429 and column < 433) and (display_colors(6) = '0'))
		 or
		 ((column > 461 and column < 465) and (display_colors(5) = '0'))
		 or
		 ((column > 493 and column < 497) and (display_colors(4) = '0'))
		 or
		 ((column > 525 and column < 529) and (display_colors(3) = '0'))
		 or
		 ((column > 557 and column < 561) and (display_colors(2) = '0'))
		 or
		 ((column > 589 and column < 593) and (display_colors(1) = '0'))
		 or
		 ((column > 621 and column < 625) and (display_colors(0) = '0'))
		 )
		 and
		 (                  
		 (row >= 14 and row < 17)
		 or
		 (row > 45 and row < 49)
		 or
		 (row > 77 and row < 81)
		 or
		 (row > 109 and row < 113)
		 or
		 (row > 141 and row < 145)
		 or
		 (row > 173 and row < 177)
		 or
		 (row> 205 and row < 209)
		 or
		 (row > 237 and row < 241)
		 or
		 (row > 269 and row < 273)
		 or
		 (row > 301 and row < 305)
		 or
		 (row > 333 and row < 337)
		 or
		 (row > 365 and row < 369)
		 or
		 (row > 397 and row < 401)
		 or
		 (row > 429 and row < 433)
		 ))
	   then coin <= '1'; ---- white
	 else coin <= '0';
	 end if;
   end if;
   end process;
row_addr <= std_logic_vector(row(8 downto 5));
end;



