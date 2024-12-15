library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity apple_rom is
  Port (
      applerow_address : in STD_LOGIC_VECTOR(4 downto 0);
      applerow_data : out STD_LOGIC_VECTOR(20 downto 0)
  );
end apple_rom;


architecture Behavioral of apple_rom is
begin
  process(applerow_address)
  begin
  -- make height and widtrh same, not as small as 21 but not as big as 32
      case applerow_address is
          when "00000" => applerow_data <= "000000000000000000000";
          when "00001" => applerow_data <= "000000000000000000000";
          when "00010" => applerow_data <= "000000000000000000000";
          when "00011" => applerow_data <= "000000000000000000000";
          when "00100" => applerow_data <= "000000000000000000000";
          when "00101" => applerow_data <= "000000000000000000000";
          when "00110" => applerow_data <= "000000000000110000000";
          when "00111" => applerow_data <= "000000000001100000000";
          when "01000" => applerow_data <= "000000000011000000000";
          when "01001" => applerow_data <= "000000000010000000000";
          when "01010" => applerow_data <= "000011110010011110000";
          when "01011" => applerow_data <= "000111111010111111000";
          when "01100" => applerow_data <= "001111111111111111100";
          when "01101" => applerow_data <= "001111111111111111100";
          when "01110" => applerow_data <= "011111111111111111110";
          when "01111" => applerow_data <= "011111111111111111110";
          when "10000" => applerow_data <= "011111111111111111110";
          when "10001" => applerow_data <= "011111111111111111110";
          when "10010" => applerow_data <= "011111111111111111110";
          when "10011" => applerow_data <= "011111111111111111110";
          when "10100" => applerow_data <= "011111111111111111110";
          when "10101" => applerow_data <= "011111111111111111110";
          when "10110" => applerow_data <= "001111111111111111100";
          when "10111" => applerow_data <= "000111111111111111000";
          when "11000" => applerow_data <= "000011111111111110000";
          when "11001" => applerow_data <= "000001111111111100000";
          when "11010" => applerow_data <= "000000011111110000000";
          when "11011" => applerow_data <= "000000000000000000000";
          when "11100" => applerow_data <= "000000000000000000000";
          when "11101" => applerow_data <= "000000000000000000000";
          when "11110" => applerow_data <= "000000000000000000000";
          when "11111" => applerow_data <= "000000000000000000000";
          when others => applerow_data <= "000000000000000000000";
      end case;
  end process;
end Behavioral;


