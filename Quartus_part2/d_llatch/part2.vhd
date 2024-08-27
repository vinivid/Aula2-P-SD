library IEEE;
use IEEE.std_logic_1164.all;

entity part2 is
    port (
        Clk : in STD_LOGIC;
        D : in STD_LOGIC;
        Q : out STD_LOGIC
    );
end entity part2;

architecture rtl of part2 is
    signal S_g : STD_LOGIC;
    signal R_g : STD_LOGIC;
    signal Qnmrl : STD_LOGIC;
    signal Qcon : STD_LOGIC;
    attribute keep: boolean;
    attribute keep of S_g, R_g, Qnmrl, Qcon: signal is true;

begin
    S_g <= D nand Clk;
    R_g <= (not D) nand clk;
    Qnmrl <= S_g nand Qcon;
    Qcon <= R_g nand Qnmrl;

    Q <= Qnmrl;
    
end architecture rtl;