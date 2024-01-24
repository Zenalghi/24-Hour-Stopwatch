library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity decoder is
Port (
    input : in std_logic_vector(2 downto 0);
    output : out std_logic_vector(7 downto 0)
 );
end decoder;

architecture Behavioral of decoder is

begin
    process (input)
        begin
            case input is
                when "000" => output <= "11111110";
                when "001" => output <= "11111101";
                when "010" => output <= "11111011";
                when "011" => output <= "11110111";
                when "100" => output <= "11101111";
                when "101" => output <= "11011111";
                when others => output <="11111111";
            end case;
        end process;
end Behavioral;
