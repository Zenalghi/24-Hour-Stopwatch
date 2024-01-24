library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity multiplexer is
Port (
    m1,m2,m3,m4,m5,m6: in std_logic_vector (3 downto 0);
    S: in std_logic_vector (0 to 2);
    Keluar : out std_logic_vector (3 downto 0)
);
end multiplexer;
architecture Behavioral of multiplexer is
begin
    process (m1,m2,m3,m4,m5,m6,S)
        begin
        case S is
            when "000" => Keluar <= m1;
            when "001" => Keluar <= m2;
            when "010" => Keluar <= m3;
            when "011" => Keluar <= m4;
            when "100" => Keluar <= m5;
            when "101" => Keluar <= m6;
            when others => keluar <= (others => '0');
        end case ;
    end process ;
end Behavioral;