library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sevseg is
Port (
    input : in std_logic_vector(3 downto 0);
    output : out std_logic_vector(7 downto 0)
 );
end sevseg;

architecture Behavioral of sevseg is

begin
    process (input)
        begin
            case input is
                when "0000" => output <= "11000000"; --0
                when "0001" => output <= "11111001"; --1
                when "0010" => output <= "10100100"; --2
                when "0011" => output <= "10110000"; --3
                when "0100" => output <= "10011001"; --4
                when "0101" => output <= "10010010"; --5
                when "0110" => output <= "10000010"; --6
                when "0111" => output <= "11111000"; --7
                when "1000" => output <= "10000000"; --8
                when "1001" => output <= "10010000"; --9
                when others => output <="11111111";
            end case;
        end process;
end Behavioral;
