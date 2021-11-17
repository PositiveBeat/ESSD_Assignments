library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE ieee.std_logic_arith.all;


entity BRAM_WRITER is
    Port ( din          : in std_logic_vector (7 downto 0);
           data_ready   : in std_logic;
           imu_addr     : in std_logic_vector (7 downto 0);
           we           : out std_logic_vector (3 downto 0);
           addr         : out std_logic_vector (31 downto 0);
           BRAM_OUT     : out std_logic_vector (31 downto 0);
           led_out      : out std_logic);
end BRAM_WRITER;

architecture Behavioral of BRAM_WRITER is
    signal data_reg : std_logic_vector(31 downto 0);
    signal upper: std_logic_vector(7 downto 0);
    signal lower: std_logic_vector(7 downto 0);

begin
    process(data_ready, imu_addr)
        constant zeros_24 : std_logic_vector(23 downto 0) := (others=>'0');
        constant ones_24 : std_logic_vector(23 downto 0) := (others=>'1');
        constant ones_16 : std_logic_vector(15 downto 0) := (others=>'1');
    
    begin

        if (data_ready = '1') THEN

--            case zeros_24 & imu_addr is
            
--                when x"2D" =>   --ACCEL_XOUT_H
--                    addr <= X"40000000";
--                    upper <= din;
                    
--                when x"2E" =>   --ACCEL_XOUT_L
--                    addr <= X"40000000";
--                    lower <= din;
                
--                when x"2F" =>   --ACCEL_YOUT_H
--                    addr <= X"40000004";
--                    upper <= din;
                    
--                when x"30" =>   --ACCEL_YOUT_L
--                    addr <= X"40000004";
--                    lower <= din;
                    
--                when x"31" =>   --ACCEL_ZOUT_H
--                    addr <= X"40000008";
--                    upper <= din;
                    
--                when x"32" =>   --ACCEL_ZOUT_L
--                    addr <= X"40000008";
--                    lower <= din;

--                when x"33" =>   --GYRO_XOUT_H
--                    addr <= X"4000000C";
--                    upper <= din;
                    
--                when x"34" =>   --GYRO_XOUT_L
--                    addr <= X"4000000C";
--                    lower <= din;
--                    led_out <= '1';
                
--                when x"35" =>   --GYRO_YOUT_H
--                    addr <= X"40000010";
--                    upper <= din;
                    
--                when x"36" =>   --GYRO_YOUT_L
--                    addr <= X"40000010";
--                    lower <= din;
                    
--                when x"37" =>   --GYRO_ZOUT_H
--                    addr <= X"40000014";
--                    upper <= din;
                    
--                when x"38" =>   --GYRO_ZOUT_L
--                    addr <= X"40000014";
--                    lower <= din;
                    
--                when others => 
--                    NULL;

--            end case;

            addr <= X"40000000";
            upper <= din;
            lower <= din;

            data_reg <= "0000000000000000" & upper & lower;
        end if;
        
    end process;
    
    we <= "1111";
    BRAM_OUT <= data_reg;

end Behavioral;
