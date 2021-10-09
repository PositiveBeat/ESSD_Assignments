LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

entity SPI_master is
    Port ( en   : in STD_LOGIC;
           addr : in STD_LOGIC_VECTOR (7 downto 0);
           MISO : in STD_LOGIC;
           MOSI : out STD_LOGIC;
           SCLK : out STD_LOGIC;
           SS   : out STD_LOGIC;
           data : out STD_LOGIC_VECTOR (7 downto 0));
end SPI_master;

architecture fsm of SPI_master is
   -- Architecture Declarations
   signal count     :unsigned (2 downto 0);
   signal addr_reg  :unsigned (7 downto 0);
   signal data_reg  :std_logic_vector (7 downto 0);

   TYPE STATE_TYPE IS (
      s0,
      s1,
      s2,
      s3,
      s4,
      s5
   );

   -- State vector declaration
   ATTRIBUTE state_vector : string;
   ATTRIBUTE state_vector OF fsm : ARCHITECTURE IS "current_state" ;


   -- Declare current and next state signals
   SIGNAL current_state : STATE_TYPE ;
   SIGNAL next_state : STATE_TYPE ;
begin


end fsm;
