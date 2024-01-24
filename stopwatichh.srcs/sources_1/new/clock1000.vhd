library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity clock1000 is
Port ( 
    clk_in : in std_logic;
    clk_out : out std_logic
);
end clock1000;

architecture Behavioral of clock1000 is
signal count : integer := 0;
signal temp : std_logic := '0';
begin
    process (clk_in)
        begin
            if (rising_edge (clk_in)) then count <= count + 1;
            if (count = 999) then
                temp <= not temp;
                count <= 0;
            end if;
            end if;
            clk_out <= temp;
    end process;
end Behavioral;
