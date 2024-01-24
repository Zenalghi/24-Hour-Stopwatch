library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity clock60 is
    Port (
        clk_in, reset : in std_logic;
        clk_out : out std_logic
    );
end clock60;

architecture Behavioral of clock60 is
    signal count : integer := 0;
    signal temp : std_logic := '0';
begin
    process(clk_in, reset)
    begin
        if reset = '1' then
            count <= 0;
            temp <= '0';
        elsif rising_edge(clk_in) then
            count <= count + 1;
            if count = 59 then 
                temp <= '1';
                count <= 0;
            else
                temp <= '0';
            end if;
        end if;
    end process;

    clk_out <= temp;
end Behavioral;
