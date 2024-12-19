library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity nes is
port (
	  data_in : in std_logic;
	  latch : out std_logic;
	  clk : in std_logic;
	  controller_clk : out std_logic;
	  data_out : out std_logic_vector(7 downto 0)
);
end nes;

architecture arch of nes is

signal count : unsigned(20 downto 0) := (others => '0'); 
signal clk_nes : std_logic;
signal count_nes : unsigned(7 downto 0);
signal shift : std_logic_vector(7 downto 0);
signal data_o :  std_logic_vector(7 downto 0);
signal count_clk : unsigned(2 downto 0);

begin

process (clk) is
  begin
      if (rising_edge(clk)) then
          if(count = 1_199_999) then
              count <= (others => '0'); 
          else
              count <= count + 1;
          end if;
      end if;
end process;

clk_nes <= count(7); 
count_nes <= counter(15 downto 8); 
latch <= '1' when (count_nes = 8d"255") else '0';
controller_clk <= clk_nes when count_nes < 8d"8" else '0';
process (clk_nes) is
begin
   if rising_edge(clk_nes) then
       if (count_nes < "00001000") then
           shift(7) <= shift(6);
	   shift(6) <= shift(5);
	   shift(5) <= shift(4);
	   shift(4) <= shift(3);
	   shift(3) <= shift(2);
	   shift(2) <= shift(1);
	   shift(1) <= shift(0);
	   shift(0) <= data_in;
           if (count_clk < "111") then
               count_clk <= count_clk + 1;
           end if;
       end if;
   end if;
end process;
data_o <= shift when count_clk = "111";
data_out <= data_o;

end;


