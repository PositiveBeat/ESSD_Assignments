LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;


entity constant_repeater is
    Port ( clk      : in std_logic;
           data_out : out STD_LOGIC_VECTOR (7 downto 0);
           intr     : out STD_LOGIC);
end constant_repeater;


architecture Behavioral of constant_repeater is
    signal const    :std_logic_vector(7 downto 0) := "01000001";    -- ASCII 'A'
    signal counter  :unsigned(7 downto 0) := (others => '0');
    signal en       :std_logic := '1';
begin

    process(clk)
    begin
    
        if (rising_edge(clk)) then
            counter <= counter + 1;
            
            if (counter = 15) then
                en <= '1';
            else
                en <= '0';
            end if;
            
        end if;
    
    end process;

intr <= en;
data_out <= const;

end Behavioral;
