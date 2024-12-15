library IEEE;
use IEEE.std_logic_1164.all; 
use IEEE.numeric_std.all;

entity ghost_movement3 is
	port (
		clk : in std_logic;
		reset : in std_logic; -- delete later
		valid : in std_logic;
		controls : in std_logic_vector (7 downto 0);
		ghostXcoord3 : out unsigned(9 downto 0);
		ghostYcoord3 : out unsigned(9 downto 0);
		directionOut : out std_logic_vector(1 downto 0)
	);
end ghost_movement3;


architecture synth of ghost_movement3 is
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

	type State is (up, down, left, right);
	signal direction : State := right; 
	signal reset_button : std_logic;
	signal left_pressed : std_logic;
	signal right_pressed : std_logic;
	signal down_pressed : std_logic;
	signal up_pressed : std_logic;
	signal direction_out : std_logic_vector(1 downto 0) := "00";
	

	signal inter_ghostx : unsigned(9 downto 0);
	signal inter_ghosty : unsigned (9 downto 0);
	signal movecounter : unsigned(18 downto 0) := (others => '0');

begin
	left_pressed <= controls(1);
	right_pressed <= controls(0);
	down_pressed <= controls(2);
	up_pressed <= controls(3);
	reset_button <= controls(4);
	

process(clk) is
begin
	if rising_edge(clk) then
		movecounter <= movecounter + 1;
		if (movecounter = "0111011010110110100") then
			if (reset_button = '0') then
				inter_ghostx <= 10d"485";
				inter_ghosty <= 10d"32";
				direction <= down;
			else
				-- bottom left corner
				if (inter_ghosty < 224 and direction = down) then 
						inter_ghostx <= inter_ghostx;
						inter_ghosty <= inter_ghosty + 1;
						direction_out <= "10";
					elsif (inter_ghosty = 32) then 
						direction <= down;
					else
						direction <= up;
						inter_ghostx <= inter_ghostx;
						inter_ghosty <= inter_ghosty - 1;
						direction_out <= "11";
					end if;
			end if;
			movecounter <= 19d"0";
		end if;
	end if;
	end process;
	
	ghostXcoord3 <= inter_ghostx;
	ghostYcoord3 <= inter_ghosty;
end;
