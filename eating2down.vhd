library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity eating2down is
   Port (
       row_address : in std_logic_vector(4 downto 0);
       row_data : out std_logic_vector(20 downto 0)
   );
end eating2down;


architecture Behavioral of eating2down is
begin
   process(row_address)
   begin
   -- make height and widtrh same, not as small as 21 but not as big as 32
       case row_address is
           when "11111" => row_data <= "000000000000000000000";
           when "11110" => row_data <= "000000000000000000000";
           when "11101" => row_data <= "000000000000000000000";
           when "11100" => row_data <= "000000000000000000000";
           when "11011" => row_data <= "000000000000000000000";
           when "11010" => row_data <= "000000000000000000000";
           when "11001" => row_data <= "000000000000000000000";
           when "11000" => row_data <= "000000000000000000000";
           when "10111" => row_data <= "000011000000000110000";
           when "10110" => row_data <= "000111000000000111000";
           when "10101" => row_data <= "001111000000000111100";
           when "10100" => row_data <= "011111100000001111110";
           when "10011" => row_data <= "011111100000001111110";
           when "10010" => row_data <= "111111110000011111111";
           when "10001" => row_data <= "111111110000011111111";
           when "10000" => row_data <= "111111111000111111111";
           when "01111" => row_data <= "111111111000111111111";
           when "01110" => row_data <= "111111111101111111111";
           when "01101" => row_data <= "111111111101111111111";
           when "01100" => row_data <= "111111111111111111111";
           when "01011" => row_data <= "011111111111111111110";
           when "01010" => row_data <= "011111111111111111110";
           when "01001" => row_data <= "001111111111111111100";
           when "01000" => row_data <= "000111111111111111000";
           when "00111" => row_data <= "000011111111111110000";
           when "00110" => row_data <= "000000111111111000000";
           when "00101" => row_data <= "000000001111100000000";
           when "00100" => row_data <= "000000000000000000000";
           when "00011" => row_data <= "000000000000000000000";
           when "00010" => row_data <= "000000000000000000000";
           when "00001" => row_data <= "000000000000000000000";
           when "00000" => row_data <= "000000000000000000000";
           when others => row_data <= "000000000000000000000";
       end case;
   end process;
end Behavioral;