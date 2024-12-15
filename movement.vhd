library IEEE;
use IEEE.std_logic_1164.all; 
use IEEE.numeric_std.all;

entity movement is
	port (
		clk : in std_logic;
		reset : in std_logic; -- delete later
		controls : in std_logic_vector(7 downto 0);
		valid : in std_logic;
		pacXcoord : out unsigned(9 downto 0);
		pacYcoord : out unsigned(9 downto 0);
		directionOut : out std_logic_vector(1 downto 0)
	);
end movement;


architecture synth of movement is
-- components
component wall_check is
  port(
    clk : in  std_logic;             
    valid : in  std_logic;                
    address_x : in  unsigned(9 downto 0);
    address_y : in  unsigned(9 downto 0); 
    wall : out std_logic      
  );
end component;
 
-- signals

	signal reset_button : std_logic;
	signal select_button : std_logic;
	signal a_button : std_logic;
	signal b_button : std_logic;

	type State is (stop, up, down, left, right);
	signal direction : State := stop; 
	
	signal left_pressed : std_logic;
	signal right_pressed : std_logic;
	signal down_pressed : std_logic;
	signal up_pressed : std_logic;
	
	signal wall_address_x : unsigned(9 downto 0);
	signal wall_address_y : unsigned(9 downto 0);
	
	signal wall_right_up : std_logic;
	signal wall_right_down : std_logic;
	signal wall_left_up : std_logic;
	signal wall_left_down : std_logic;
	signal wall_down_left : std_logic;
	signal wall_down_right : std_logic;
	signal wall_up_left : std_logic;
	signal wall_up_right : std_logic;
	signal direction_out : std_logic_vector(1 downto 0) := "00";
	
	signal inter_pacx : unsigned(9 downto 0);
	signal inter_pacy : unsigned (9 downto 0);
	
	signal movecounter : unsigned(18 downto 0) := (others => '0');

begin
	wall_right1:
	wall_check port map(
					clk => clk,
					valid => valid,       
					address_x => inter_pacx + 27,
					address_y => inter_pacy + 1,
					wall => wall_right_up
					);
					
	wall_right2:
	wall_check port map(
					clk => clk,
					valid => valid,       
					address_x => inter_pacx + 27,
					address_y => inter_pacy + 30,
					wall => wall_right_down
					);
					
	wall_left1:
	wall_check port map(
					clk => clk,
					valid => valid,       
					address_x => inter_pacx - 5,
					address_y => inter_pacy + 1,
					wall => wall_left_up
					);
	wall_left2:
	wall_check port map(
					clk => clk,
					valid => valid,       
					address_x => inter_pacx - 5,
					address_y => inter_pacy + 30,
					wall => wall_left_down
					);
					
	wall_down1:
	wall_check port map(
					clk => clk,
					valid => valid,       
					address_x => inter_pacx + 1,
					address_y => inter_pacy + 32,
					wall => wall_down_left
					);
					
	wall_down2:
	wall_check port map(
					clk => clk,
					valid => valid,       
					address_x => inter_pacx + 19,
					address_y => inter_pacy + 32,
					wall => wall_down_right
					);
					
	wall_up1:
	wall_check port map(
					clk => clk,
					valid => valid,       
					address_x => inter_pacx,
					address_y => inter_pacy - 1,
					wall => wall_up_left
					);
	wall_up2:
	wall_check port map(
					clk => clk,
					valid => valid,       
					address_x => inter_pacx + 20,
					address_y => inter_pacy - 1,
					wall => wall_up_right
					);

	-- assigning signals to the respective buttons
	left_pressed <= controls(1);
	right_pressed <= controls(0);
	down_pressed <= controls(2);
	up_pressed <= controls(3);
	reset_button <= controls(4);
	select_button <= controls(7);
	a_button <= controls(6);
	b_button <= controls(5);
	
	-- NEED TO MAKE A STATE FOR WHEN HE GOES LEFT OR RIGHT OFF THE SCREEN TO MAKE HIM COME BACK FASTER
process(clk) is
begin
	if rising_edge(clk) then
	movecounter <= movecounter + 1;
        if (movecounter = "1110011010110110100") then
			if (reset_button = '0') then 
				inter_pacx <= 10d"32";
				inter_pacy <= 10d"224";
				direction <= stop;
			elsif (direction = right and inter_pacx = 620) then 
				inter_pacx <= 10d"1";
				inter_pacy <= inter_pacy;
				direction <= right;
			elsif (direction = left and inter_pacx = 0) then 
				inter_pacx <= 10d"636";
				inter_pacy <= inter_pacy;
				direction <= left;
			elsif (left_pressed = '0') then 
				if (wall_left_up = '0' and wall_left_down = '0') then 
					direction <= left;
					inter_pacx <= inter_pacx - 1;
					inter_pacy <= inter_pacy;
					direction_out <= "01";
				else 
					direction <= stop;
				end if;
			elsif (right_pressed = '0') then 
				if (wall_right_up = '0' and wall_right_down = '0') then 
					direction <= right;
					inter_pacx <= inter_pacx + 1;
					inter_pacy <= inter_pacy;
					direction_out <= "00";
				else 
					direction <= stop;
				end if;
			elsif (down_pressed = '0') then
				if (wall_down_left = '0' and wall_down_right = '0') then 
					direction <= down;
					inter_pacx <= inter_pacx;
					inter_pacy <= inter_pacy + 1;
					direction_out <= "10";
				else 
					direction <= stop;
				end if;
			elsif (up_pressed = '0') then
				if (wall_up_left = '0' and wall_up_right = '0') then 
					direction <= up;
					inter_pacx <= inter_pacx;
					inter_pacy <= inter_pacy - 1;
					direction_out <= "11";
				else
					direction <= stop;
				end if;
			elsif (direction = left) then 
				if (wall_left_up = '0' and wall_left_down = '0') then 
					inter_pacx <= inter_pacx - 1;
					inter_pacy <= inter_pacy;
					direction_out <= "01";
				else 
					direction <= stop;
				end if;
			elsif (direction = right) then 
				if (wall_right_up = '0' and wall_right_down = '0') then 
					inter_pacx <= inter_pacx + 1;
					inter_pacy <= inter_pacy;
					direction_out <= "00";
				else 
					direction <= stop;
				end if;
			elsif (direction = down) then 
				if (wall_down_left = '0' and wall_down_right = '0') then 
					inter_pacx <= inter_pacx;
					inter_pacy <= inter_pacy + 1;
					direction_out <= "10";
				else 
					direction <= stop;
				end if;
			elsif (direction = up) then
				if (wall_up_left = '0' and wall_up_right = '0') then 
					inter_pacx <= inter_pacx;
					inter_pacy <= inter_pacy - 1;
					direction_out <= "11";
				else
					direction <= stop;
				end if;
			else
				direction <= stop;
				inter_pacy <= inter_pacy;
				inter_pacx <= inter_pacx;
				direction_out <= direction_out;
			end if;
		movecounter <= "0000000000000000000";
	   end if;
	end if;
	end process;
	pacXcoord <= inter_pacx;
	pacYcoord <= inter_pacy;
	directionOut <= direction_out;
	directionOut <= direction_out;
end;


