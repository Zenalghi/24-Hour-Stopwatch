library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity main is
Port ( 
    clk, start, reset: in std_logic;
    deco,seven : out std_logic_vector (7 downto 0);
    led : out std_logic
);
end main;

architecture Behavioral of main is

component clock is
    Port ( 
        clk_in, start : in std_logic;
        clk_out : out std_logic
    ); end component;
component clock60 is
    Port ( 
        clk_in, reset : in std_logic;
        clk_out : out std_logic
    ); end component;
component clock1000 is
    Port ( 
         clk_in : in std_logic;
         clk_out : out std_logic
    ); end component;
component counter60 is
    Port (  
        rst,clk : in std_logic;
        o: out std_logic_vector(0 to 7)
    ); end component;
component counter24 is
    Port (  
          rst,clk : in std_logic;
          o: out std_logic_vector(0 to 7)
    ); end component;
component counter3bit is
    Port (  
          rst,clk : in std_logic;
          o: out std_logic_vector(0 to 2)
    ); end component;
component bcd is
    generic(N: positive := 8);
    port(
        clk, reset: in std_logic;
        binary_in: in std_logic_vector(7 downto 0);
        bcd0, bcd1: out std_logic_vector(3 downto 0)
    ); end component;
component sevseg is
    Port (
        input : in std_logic_vector(3 downto 0);
        output : out std_logic_vector(7 downto 0)
    ); end component;
component decoder is
    Port (
        input : in std_logic_vector(2 downto 0);
        output : out std_logic_vector(7 downto 0)
     ); end component;
component multiplexer is
    Port (
        m1,m2,m3,m4,m5,m6: in std_logic_vector (3 downto 0);
        S: in std_logic_vector (0 to 2);
        Keluar : out std_logic_vector (3 downto 0)
    ); end component;

signal n1, n2, n3, n4, c1, c2, c3: std_logic;
signal s0,s1,s2 : std_logic_vector(7 downto 0);
signal b1, b2, b3, b4, b5, b6, o1 : std_logic_vector (3 downto 0);
signal o2, s3 : std_logic_vector (2 downto 0);

begin

clk_detik : clock port map(clk, start, n1);
clk_menit : clock60 port map(n1, reset, n2); 
clk_jam : clock60 port map(n2, reset, n3);
clok_bcd_mux : clock1000 port map(clk, n4);

cntr_detik : counter60 port map (reset, n1, s0);
cntr_menit : counter60 port map (reset, n2, s1);
cntr_jam : counter24 port map (reset, n3, s2);
cntr_3bit : counter3bit port map (reset, n4, s3);

bcd_detik: bcd port map (n4, reset, s0, b1, b2);
bcd_menit: bcd port map (n4, reset, s1, b3, b4);
bcd_jam: bcd port map (n4, reset, s2, b5, b6);

mux : multiplexer port map(b1,b2,b3,b4,b5,b6,s3,o1);
sevent_segment : sevseg port map(o1, seven);
decooder : decoder port map(s3, deco);

led<=start;
end Behavioral;
