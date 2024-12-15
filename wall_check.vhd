library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity wall_check is
  port(
    clk : in  std_logic;             
    valid : in  std_logic;                
    address_x : in  unsigned(9 downto 0);
    address_y : in  unsigned(9 downto 0); 
    wall : out std_logic      
  );
end wall_check;

architecture synth of wall_check is
--components
component rom is 
	port (
			clk : in std_logic;
			addr : in unsigned (3 downto 0); --15 rows
			data : out std_logic_vector (19 downto 0) --20 columns
		);
end component;
--signals
--signal tile : unsigned(8 downto 0);
signal row_addr : unsigned(3 downto 0);
signal col_addr : unsigned(4 downto 0);

signal column : unsigned(9 downto 0);
signal row : unsigned(9 downto 0);
signal display_colors : std_logic_vector (19 downto 0);

begin
border_rom: 
rom port map (
			  clk => clk, 
			  addr => row_addr, 
			  data => display_colors
			 );

column <= address_x;
row <= address_y;

process (clk) begin 
	if rising_edge(clk) then 

				if  ( 
				valid = '1' and 
				-- Draw the map
					(
					  ((column >= 0 and column < 32) and (display_colors(19) = '1'))
					  or 
					  ((column > 31 and column < 64) and (display_colors(18) = '1'))
					  or 
					  ((column > 63 and column < 96) and (display_colors(17) = '1'))
					  or 
					  ((column > 95 and column < 128) and (display_colors(16) = '1'))
					  or 
					  ((column > 127 and column < 160) and (display_colors(15) = '1'))
					  or 
					  ((column > 159 and column < 192) and (display_colors(14) = '1'))
					  or 
					  ((column > 191 and column < 224) and (display_colors(13) = '1'))
					  or 
					  ((column > 223 and column < 256) and (display_colors(12) = '1'))
					  or 
					  ((column > 255 and column < 288) and (display_colors(11) = '1'))
					  or 
					  ((column > 287 and column < 320) and (display_colors(10) = '1'))
					  or 
					  ((column > 319 and column < 352) and (display_colors(9) = '1'))
					  or 
					  ((column > 351 and column < 384) and (display_colors(8) = '1'))
					  or 
					  ((column > 383 and column < 416) and (display_colors(7) = '1'))
					  or 
					  ((column > 415 and column < 448) and (display_colors(6) = '1'))
					  or 
					  ((column > 447 and column < 480) and (display_colors(5) = '1'))
					  or 
					  ((column > 479 and column < 512) and (display_colors(4) = '1'))
					  or 
					  ((column > 511 and column < 544) and (display_colors(3) = '1'))
					  or 
					  ((column > 543 and column < 576) and (display_colors(2) = '1'))
					  or 
					  ((column > 575 and column < 608) and (display_colors(1) = '1'))
					  or 
					  ((column > 607 and column < 640) and (display_colors(0) = '1'))
					 )
				  )
				  	then wall <= '1'; -- blue
				  elsif(valid = '1') then wall <= '0'; -- set everything else to black
				  else wall <= '0'; 
				  end if;
	end if;
end process;
row_addr <= row(8 downto 5); 

end synth;

