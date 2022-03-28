----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:29:00 03/04/2022 
-- Design Name: 
-- Module Name:    chronometer - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity chronometer is
    Port ( START : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           RESET : in  STD_LOGIC;
           CE_1s : in  STD_LOGIC;
           WAIT_t : in  STD_LOGIC;
           sec_unit : out  STD_LOGIC_VECTOR (3 downto 0);
           sec_dec : out  STD_LOGIC_VECTOR (3 downto 0);
           min_unit : out  STD_LOGIC_VECTOR (3 downto 0);
           min_dec : out  STD_LOGIC_VECTOR (3 downto 0));
end chronometer;

architecture Behavioral of chronometer is

    COMPONENT counterSen_4b_RE
    PORT(
         R : IN  std_logic;
         CE : IN  std_logic;
         clk : IN  std_logic;
         Q : OUT  std_logic_vector(3 downto 0);
         TC : OUT  std_logic
        );
    END COMPONENT;
	 
    COMPONENT equ45min
    PORT(
         min_dec : IN  std_logic_vector(3 downto 0);
         min_unit : IN  std_logic_vector(3 downto 0);
         equ : OUT  std_logic
        );
    END COMPONENT;
	 
	 COMPONENT register_1b_R
    PORT(
         D : IN  std_logic;
         clk : IN  std_logic;
         R : IN  std_logic;
         Q : OUT  std_logic
        );
    END COMPONENT;
	 
	 
    COMPONENT counterDec_4b_RE
    PORT(
         R : IN  std_logic;
         CE : IN  std_logic;
         clk : IN  std_logic;
         Q : OUT  std_logic_vector(3 downto 0);
         TC : OUT  std_logic
        );
    END COMPONENT;
	 
signal or_out : std_logic;
signal start_reg : std_logic; 
signal equ45 : std_logic;
signal CE_time45min : std_logic;
signal CE_secDec : std_logic;
signal CE_minUni : std_logic;
signal min_unit_int : std_logic_vector(3 downto 0);
signal min_dec_int : std_logic_vector(3 downto 0);
signal CE_minDec : std_logic;

begin

or_out <= start_reg or START;
CE_time45min <= start_reg and CE_1s and not(equ45) and not(WAIT_t);

U1: register_1b_R PORT MAP (
			 D => or_out,
			 clk => clk,
			 R => RESET,
			 Q => start_reg
		  );
		  
		  

U4: counterSen_4b_RE PORT MAP (
          R => RESET,
          CE => CE_secDec,
          clk => clk,
          Q => sec_dec,
          TC => CE_minUni
        );
		  
U6: counterSen_4b_RE PORT MAP (
          R => RESET,
          CE => CE_minDec,
          clk => clk,
          Q => min_dec_int,
          TC => open
        );

U3: counterDec_4b_RE PORT MAP (
			 R => RESET,
			 CE => CE_time45min,
			 clk => clk,
			 Q => sec_unit,
			 TC => CE_secDec
		  );
	  
U5: counterDec_4b_RE PORT MAP (
			 R => RESET,
			 CE => CE_minUni,
			 clk => clk,
			 Q => min_unit_int,
			 TC => CE_minDec
			);

U7: equ45min PORT MAP (
			 min_dec => min_dec_int,
			 min_unit => min_unit_int,
			 equ => equ45
		  );
		  
min_dec <= min_dec_int;
min_unit <= min_unit_int;

end Behavioral;

