LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

entity SPI_master is
    Port ( clk  : in std_logic;
           rst  : in std_logic;
           en   : in STD_LOGIC;
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
   signal addr_reg  :std_logic_vector (7 downto 0);
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

   ----------------------------------------------------------------------------
   clocked : PROCESS(
      clk,
      rst
   )
   ----------------------------------------------------------------------------
   BEGIN
      IF (rst = '1') THEN
         current_state <= s0;
         -- Reset Values
         count <= (others=>'0');
         SCLK <= '0';
         MOSI <= '0';
         SS <= '1';
      ELSIF (clk'EVENT AND clk = '1') THEN
         current_state <= next_state;

         -- Combined Actions for internal signals only
         CASE current_state IS
         WHEN s0 =>
            count <= (others=>'0');
         SCLK <= '0';
         MOSI <= '0';
         SS <= '1';

         WHEN s1 =>
            SS <= '0';
            addr_reg <= addr;
            
         WHEN s2 => --Transmit
            SCLK <= NOT(clk);
            MOSI <= addr_reg(7);
            SS <= '0';
            addr_reg <= addr_reg(6 downto 0) & '0'; -- Shift left logical 
            count <= count + 1;

         WHEN s3 => -- Delay
            SCLK <= '1';
            SS <= '0';
            count <= count + 1;

         WHEN s4 => -- Recieve
            SCLK <= NOT(clk);
            SS <= '0';
            data_reg <= data_reg(6 downto 0) & MISO;    -- Shift left logical
            count <= count + 1;
         
         WHEN s5 => -- Done
            SCLK <= '1';
            SS <= '1';
            data <= data_reg;

         WHEN OTHERS =>
            NULL;
         END CASE;

      END IF;

   END PROCESS clocked;

   ----------------------------------------------------------------------------
   nextstate : PROCESS (
      count,
      current_state
   )
   ----------------------------------------------------------------------------
   BEGIN
      CASE current_state IS
      WHEN s0 =>
         IF (en = '1') THEN
            next_state <= s1;
         ELSE
            next_state <= s0;
         END IF;

      WHEN s1 =>
        next_state <= s2;

      WHEN s2 =>
         IF (count = 7) THEN
            next_state <= s3;
         ELSE
            next_state <= s2;
         END IF;  
               
      WHEN s3 =>
         IF (count = 7) THEN
            next_state <= s4;
         ELSE
            next_state <= s3;
         END IF;
                  
      WHEN s4 =>
         IF (count = 7) THEN
            next_state <= s5;
         ELSE
            next_state <= s4;
         END IF;
      
      WHEN s5 =>
         next_state <= s0;
         
      WHEN OTHERS =>
         next_state <= s0;
      END CASE;

   END PROCESS nextstate;

end fsm;
