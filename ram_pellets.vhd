-- Basic dual-ported RAM module
-- This infers one or more EBRs in Radiant, and you can simulate it as well
-- Tufts ES 4 (http://www.ece.tufts.edu/es/4/)

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity ram_pellets is
  generic (
    WORD_SIZE : natural := 20; -- Bits per word (read/write block size)
    N_WORDS : natural := 15; -- Number of words in the memory
    ADDR_WIDTH : natural := 4 -- This should be log2 of N_WORDS; see the Big Guide to Memory for a way to eliminate this manual calculation
   );
  port (
    clk : in std_logic;
    r_addr : in std_logic_vector(ADDR_WIDTH - 1 downto 0);
    r_data : out std_logic_vector(WORD_SIZE - 1 downto 0);
    w_addr : in std_logic_vector(ADDR_WIDTH - 1 downto 0);
    w_data : in std_logic_vector(WORD_SIZE - 1 downto 0);
    w_enable : in std_logic
  );
end;

architecture synth of ram_pellets is

type ramtype is array(N_WORDS - 1 downto 0) of
    std_logic_vector(WORD_SIZE - 1 downto 0);

function initialize return ramtype is
variable initialized : ramtype;
begin
	for i in ramtype'range loop
		initialized(i) := 20b"0";
	end loop;
	return initialized;
end function;	

signal mem : ramtype := initialize;

begin
  process (clk) begin
	if rising_edge(clk) then
    -- Write into the memory if write enabled
		if w_enable = '1' then
    		mem(to_integer(unsigned(w_addr))) <= w_data;
		else
		-- Always read from the memory
		r_data <= mem(to_integer(unsigned(r_addr)));
		end if;
	end if;
  end process;
end;

