library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity ghost_rom3 is
   port (
       row_address3 : in std_logic_vector(4 downto 0);
       row_data3 : out std_logic_vector(20 downto 0)
   );
end ghost_rom3;


architecture Behavioral of ghost_rom3 is
begin
   process(row_address3)
   begin
       case row_address3 is
           when "00000" => row_data3 <= "000000000000000000000";
           when "00001" => row_data3 <= "000000000000000000000";
           when "00010" => row_data3 <= "000000000000000000000";
           when "00011" => row_data3 <= "000000001111100000000";
           when "00100" => row_data3 <= "000000111111111000000";
           when "00101" => row_data3 <= "000001111111111100000";
           when "00110" => row_data3 <= "000011111111111110000";
           when "00111" => row_data3 <= "000111111111111111000";
           when "01000" => row_data3 <= "000111111111111111000";
           when "01001" => row_data3 <= "001111111111111111100";
           when "01010" => row_data3 <= "001111111111111111100";
           when "01011" => row_data3 <= "011111111111111111110";
           when "01100" => row_data3 <= "011111111111111111110";
           when "01101" => row_data3 <= "111111111111111111111";
           when "01110" => row_data3 <= "111111111111111111111";
           when "01111" => row_data3 <= "111111111111111111111";
           when "10000" => row_data3 <= "111111111111111111111";
           when "10001" => row_data3 <= "111111111111111111111";
           when "10010" => row_data3 <= "111111111111111111111";
           when "10011" => row_data3 <= "111111111111111111111";
           when "10100" => row_data3 <= "111111111111111111111";
           when "10101" => row_data3 <= "111111111111111111111";
           when "10110" => row_data3 <= "111111111111111111111";
           when "10111" => row_data3 <= "111111111111111111111";
           when "11000" => row_data3 <= "111111111111111111111";
           when "11001" => row_data3 <= "111011111000111110111";
           when "11010" => row_data3 <= "110001111000111100011";
           when "11011" => row_data3 <= "100000111000111000001";
           when "11100" => row_data3 <= "000000000000000000000";
           when "11101" => row_data3 <= "000000000000000000000";
           when "11110" => row_data3 <= "000000000000000000000";
           when "11111" => row_data3 <= "000000000000000000000";
           when others => row_data3 <= "000000000000000000000";
       end case;
   end process;
end Behavioral;
