----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:52:00 02/18/2022 
-- Design Name: 
-- Module Name:    Tregister_1b - Behavioral 
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


entity Tregister_1b is
    Port ( T : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           Q : out  STD_LOGIC);
end Tregister_1b;

architecture Behavioral of Tregister_1b is
signal Q_Int : STD_LOGIC :='0';

begin

reg_T : process(clk,T)
		  begin
					if (rising_edge(clk)) then
						if (T ='1') then
							Q_Int <= not(Q_Int); 
						end if;
					end if;
			end process;
Q <= Q_Int;


end Behavioral;





