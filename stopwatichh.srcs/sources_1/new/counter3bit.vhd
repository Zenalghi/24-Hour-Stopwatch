library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

entity counter3bit is
    Port ( 
            rst,clk : in std_logic;
            o: out std_logic_vector(0 to 2)
            );
    end counter3bit;

architecture Behavioral of counter3bit is

signal count : std_logic_vector(0 to 2);
begin
    process(rst,clk)
        begin
            if (rst = '1') then 
                count <= "000";
            elsif (clk'event and clk = '1') then count <= count + 1;
            end if;
    end process;
    o <= count;
end Behavioral;