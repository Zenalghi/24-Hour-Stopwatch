library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity clock is
    Port ( 
        clk_in, start : in std_logic;
        clk_out : out std_logic
    );
end clock;

architecture Behavioral of clock is
    signal count : integer := 0;
    signal temp : std_logic := '0';
    signal running : std_logic := '0';
begin
    process (clk_in)
    begin
        if rising_edge(clk_in) then
            if start = '1' then
                running <= '1'; -- Mulai stopwatch jika start '1'
            elsif start = '0' then
                running <= '0'; -- Hentikan stopwatch jika start '0'
            end if;

            if running = '1' then
                count <= count + 1;
                if count = 49999999 then
                    temp <= not temp;
                    count <= 0;
                end if;
            end if;
        end if;
    end process;

    clk_out <= temp;
end Behavioral;
