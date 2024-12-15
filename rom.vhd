library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;


entity rom is 
	port (
			clk : in std_logic;
			addr : in unsigned (3 downto 0); --15 rows (KD change to unsigned)
			data : out std_logic_vector (19 downto 0) --20 columns
		);
end rom;

architecture synth of rom is
begin

process(clk) is
begin
	if rising_edge(clk) then
		case addr is
			when "0000" => data <= "11111111111111111111"; 
			when "0001" => data <= "10000000011000000001"; 
			when "0010" => data <= "10110111011011101101";
			when "0011" => data <= "10000000000000000001";
			when "0100" => data <= "10110101111110101101";
			when "0101" => data <= "10000100111100100001";
			when "0110" => data <= "11110110000001101111";
			when "0111" => data <= "00000000111100000000";
			when "1000" => data <= "11011010000001011011";
			when "1001" => data <= "10001010111101010001";
			when "1010" => data <= "10100000000000000101";
			when "1011" => data <= "10110111011011101101";
			when "1100" => data <= "10110001000010001101";
			when "1101" => data <= "10000100011000100001";
			when "1110" => data <= "11111111111111111111";
			when others => data <= "11111111111111111111"; 
		end case; 
	end if;
end process;

end;
