library IEEE;
use IEEE.std_logic_1164.all;

entity d_llatch is
    port (
        Clk : in STD_LOGIC;
        D : in STD_LOGIC;
        Q : out STD_LOGIC
    );
end entity d_llatch;

architecture Behaviour of d_llatch is
    signal S_g : STD_LOGIC;
    signal R_g : STD_LOGIC;
    signal Qnmrl : STD_LOGIC;
    signal Qcon : STD_LOGIC;

begin
    S_g <= D nand Clk;
    R_g <= (not D) nand Clk;
    Qnmrl <= S_g nand Qcon;
    Qcon <= R_g nand Qnmrl;

    Q <= Qnmrl;
    
end architecture Behaviour;

library IEEE;
use IEEE.std_logic_1164.all;

entity d_flip_flop is
    port (
        Clock : in STD_LOGIC;
        Entry : in STD_LOGIC;
        Res : out STD_LOGIC
    );
end entity d_flip_flop;

architecture Behaviour of d_flip_flop is
    
    component d_llatch is
        port (
            Clk : in STD_LOGIC;
            D : in STD_LOGIC;
            Q : out STD_LOGIC
        );
    end component;

    signal Qm : STD_LOGIC;
    signal Qs : STD_LOGIC;
    signal nclock : STD_LOGIC;
begin
    nclock <= not Clock;

    mstr : d_llatch port map(
        D => Entry,
        Clk => nclock,
        Q => Qm
    );

    slv : d_llatch port map(
        D => Qm,
        Clk => Clock,
        Q => Qs
    );
    
    Res <= Qs;
    
end architecture Behaviour;