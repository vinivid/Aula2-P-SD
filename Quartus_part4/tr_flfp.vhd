library IEEE;
use IEEE.std_logic_1164.all;

entity d_llatch is
    port (
        D : in std_logic;
        Clk : in std_logic;
        Q : out std_logic;
        Qcon : out std_logic
    );
end entity d_llatch;

architecture Behaviour of d_llatch is
begin
    process (D, Clk)
    begin
        if Clk = '1' then
            Q <= D;
            Qcon <= not D;
        end if;
    end process;
end architecture Behaviour;

library IEEE;
use IEEE.std_logic_1164.all;

entity pos_edge_flfp is
    port (
        D : in std_logic;
        Clk : in std_logic;
        Qa_1 : out std_logic;
        Qcon_1 : out std_logic
    );
end entity pos_edge_flfp;

architecture Behaviour of pos_edge_flfp is
begin
    process (Clk)
    begin
        if (rising_edge(Clk)) then
            Qa_1 <= D;
            Qcon_1 <= not D; 
        end if;
    end process;
end architecture Behaviour;

library IEEE;
use IEEE.std_logic_1164.all;

entity neg_edge_flfp is
    port (
        D : in std_logic;
        Clk : in std_logic;
        Qa_2 : out std_logic;
        Qcon_2 : out std_logic
    );
end entity neg_edge_flfp;

architecture Behaviour of neg_edge_flfp is
begin
    process (Clk)
    begin
        if (falling_edge(Clk)) then 
            Qa_2 <= D; 
            Qcon_2 <= not D;
	end if;
    end process;
end architecture Behaviour;

library IEEE;
use IEEE.std_logic_1164.all;

entity tr_flfp is
    port (
        Entry : in std_logic;
        Clock : in std_logic;
        Qs : out std_logic;
        Qscon : out std_logic;
        Qs_1 : out std_logic;
        Qscon_1 : out std_logic;
        Qs_2 : out std_logic;
        Qscon_2 : out std_logic
    );
end entity tr_flfp;

architecture Behaviour of tr_flfp is
    
    component d_llatch is 
        port (
            D : in std_logic;
            Clk : in std_logic;
            Q : out std_logic;
            Qcon : out std_logic
        ); 
    end component;

    component pos_edge_flfp is 
        port (
            D : in std_logic;
            Clk : in std_logic;
            Qa_1 : out std_logic;
            Qcon_1 : out std_logic
        );
    end component;

    component neg_edge_flfp is 
        port (
            D : in std_logic;
            Clk : in std_logic;
            Qa_2 : out std_logic;
            Qcon_2 : out std_logic
        );
    end component;
begin
    
    nmrl_dlatch : d_llatch port map(
        D => Entry,
        Clk => Clock,
        Q => Qs,
        Qcon => Qscon
    );

    nmrl_pos_edge : pos_edge_flfp port map (
        D => Entry,
        Clk => Clock,
        Qa_1 => Qs_1,
        Qcon_1 => Qscon_1
    );

    nmrl_neg_edge : neg_edge_flfp port map (
        D => Entry,
        Clk => Clock,
        Qa_2 => Qs_2,
        Qcon_2 => Qscon_2
    );
end architecture Behaviour;