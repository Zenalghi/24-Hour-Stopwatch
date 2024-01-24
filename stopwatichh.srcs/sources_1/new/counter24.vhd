library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

entity counter24 is
    Port ( 
            rst, clk : in std_logic;
            o: out std_logic_vector(0 to 7)
   );
end counter24;

architecture Behavioral of counter24 is
    signal count : std_logic_vector(0 to 7);
begin
    process(rst, clk)
    begin
        if rst = '1' then 
            count <= "00000000";
        elsif rising_edge(clk) then
            if count = "00010111" then  -- Nilai maksimum untuk menghitung hingga 23
                count <= "00000000";
            else
                count <= count + 1;
            end if;
        end if;
    end process;

    o <= count;

end Behavioral;