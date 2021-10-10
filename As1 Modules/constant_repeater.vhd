LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;


entity constant_repeater is
    Port ( clk      : in std_logic;
           en       : in std_logic;
           data     : in std_logic_vector (7 downto 0));
           --data_out : out STD_LOGIC_VECTOR (7 downto 0);
           --intr     : out STD_LOGIC);
end constant_repeater;


architecture Behavioral of constant_repeater is
    signal const        :std_logic_vector(7 downto 0) := "00110100";    -- ASCII '4'
    signal send_flag    :std_logic := '0';
begin

    process(clk, en)
    begin

        if (rising_edge(clk)) then
        
            if (en = '1') then
                --intr <= '1';
            else
                --intr <= '0';
            end if;
            
        end if;
    
    end process;

--data_out <= data;

end Behavioral;
