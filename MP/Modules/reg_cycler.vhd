----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/15/2021 09:45:22 PM
-- Design Name: 
-- Module Name: reg_cycler - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity reg_cycler is
    Port ( clk : in STD_LOGIC;
           next_reg : inout STD_LOGIC);
end reg_cycler;

architecture Behavioral of reg_cycler is

begin

    process(clk)
    begin
        if (rising_edge(clk)) then
--            next_reg <= not next_reg;
            next_reg <= next_reg;   

        end if;
    end process;

end Behavioral;
