library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Top is
	port(
		clk 	: in std_logic;
		leds 	: out std_logic_vector(7 downto 0);
		rst 	: in std_logic
	);
end Top;

architecture Behavioral of Top is
	
	component Clock
		port (
			CLK_IN1           : in     std_logic;
			CLK_OUT1          : out    std_logic;
			CLK_OUT2          : out    std_logic;
			CLK_OUT3          : out    std_logic;
			CLK_OUT4          : out    std_logic;
			RESET             : in     std_logic;
			LOCKED            : out    std_logic
		 );
	end component;
		
	component Counter30
	  port (
		 clk 	: in std_logic;
		 q 	: out std_logic_vector(29 downto 0)
	  );
	end component;
	
	component Rom
		port (
		 clka 	: in std_logic;
		 addra 	: in std_logic_vector(9 DOWNTO 0);
		 douta 	: out std_logic_vector(7 DOWNTO 0)
		);
	end component;
	
	signal count : std_logic_vector(29 downto 0);
	signal clk25 : std_logic;
begin

	clock_divider : Clock
	port map (
		CLK_IN1 	=> clk,
		CLK_OUT3 => clk25,
		RESET => rst
	);

	counter : Counter30
	port map (
		clk	=> clk25,
		q 		=> count
	);
	
	memory : Rom
	port map (
		clka 	=> clk25,
		addra => count(29 downto 20),
		douta => leds
	);

end Behavioral;

