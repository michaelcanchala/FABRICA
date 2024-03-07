library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity fabrica is
    port (
        a, b : in std_logic;
        c, d, e : out std_logic
    );
end fabrica;

architecture fabrica_arch of fabrica is 
    signal SA_lleno, SB_lleno , encender_c, encender_d, encender_e : STD_LOGIC;
    signal s_combinada : std_logic_vector(1 downto 0);
  
begin

    selectora : process (a) is
    begin 
        case a is
            when '1' =>
                SA_lleno <= '1';
            when others =>
                SA_lleno <= '0';
        end case;
    end process;

    selectorb : process (b) is
    begin
        case b is
            when '1' =>
                SB_lleno <= '1';
            when others =>
                SB_lleno <= '0';
        end case;
    end process;

    selector : process (SA_lleno, SB_lleno)  
    begin
        s_combinada <= SA_lleno & SB_lleno;
        case s_combinada is
            when "10" =>
                encender_c <= '1';
                encender_d <= '0';
                encender_e <= '0';
            when "01" =>
                encender_c <= '1';
                encender_d <= '0';
                encender_e <= '0';
            when "00" =>
                encender_c <= '0';
                encender_d <= '1';
                encender_e <= '1';
            when others =>
                encender_c <= '0';
                encender_d <= '0';
                encender_e <= '0';
        end case;
    end process;

    c <= encender_c;
    d <= encender_d;
    e <= encender_e;

end fabrica_arch;
