LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;


entity constant_repeater is
    Port ( clk      : in std_logic;
           en       : in std_logic;
           data_out : out STD_LOGIC_VECTOR (7 downto 0);
           intr     : out STD_LOGIC);
end constant_repeater;


architecture Behavioral of constant_repeater is
    signal const        :std_logic_vector(7 downto 0) := "01000001";    -- ASCII 'A'
    signal counter      :unsigned(3 downto 0) := (others => '0');
    signal send_flag    :std_logic := '0';
    signal send    :std_logic := '0';
begin

    process(clk, en)
    begin
    
        if (en = '1' AND send_flag = '0') then
            send_flag <= '1';
--            counter <= (others => '0');
        end if;
    
        if (rising_edge(clk) AND send_flag = '1' AND en = '0') then
--            counter <= counter + 1;
            
--            if (counter = 15) then
--                send <= '1';
--            else
--                send <= '0';
--            end if;

            intr <= send_flag;

            send_flag <= '0';
        end if;
    
    end process;

--intr <= send;
data_out <= const;

end Behavioral;
