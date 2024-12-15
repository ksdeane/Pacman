library IEEE;
use IEEE.std_logic_1164.all; 
use IEEE.numeric_std.all;

entity apple_movement is
	port (
		clk : in std_logic;
		reset : in std_logic; -- delete later
		valid : in std_logic;
		controls : in std_logic_vector (7 downto 0);
		appleXcoord : out unsigned(9 downto 0);
		appleYcoord : out unsigned(9 downto 0);
		directionOut : out std_logic_vector(1 downto 0)
	);
end apple_movement;


architecture synth of apple_movement is
 
-- signals

	type State is (up, down, left, right);
	signal direction : State := right; 
	signal reset_button : std_logic;
	signal left_pressed : std_logic;
	signal right_pressed : std_logic;
	signal down_pressed : std_logic;
	signal up_pressed : std_logic;
	signal direction_out : std_logic_vector(1 downto 0) := "00";
	

	signal inter_applex : unsigned(9 downto 0);
	signal inter_appley : unsigned (9 downto 0);
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
		if (movecounter = "1110011010110110100") then
			if (reset_button = '0') then
				inter_applex <= 10d"577";
				inter_appley <= 10d"32";
				direction <= down;
			else
				if (inter_appley < 160 and direction = down) then 
						inter_applex <= inter_applex;
						inter_appley <= inter_appley + 1;
						direction_out <= "10";
					elsif (inter_appley = 32) then 
						direction <= down;
					else
						direction <= up;
						inter_applex <= inter_applex;
						inter_appley <= inter_appley - 1;
						direction_out <= "11";
					end if;
			end if;
			movecounter <= 19d"0";
		end if;
	end if;
	end process;
	
	appleXcoord <= inter_applex;
	appleYcoord <= inter_appley;
end;
