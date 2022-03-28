----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:07:28 02/18/2022 
-- Design Name: 
-- Module Name:    counter_3b_E - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity counter_3b_E is
    Port ( CE  : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           Q : out  STD_LOGIC_VECTOR (2 downto 0));
end counter_3b_E;

architecture Behavioral of counter_3b_E is
signal Q_Int : UNSIGNED(2 downto 0) :="000";


begin
	process (clk, CE)
	begin
		if (Rising_edge(clk) and CE = '1')then
			if (Q_Int = "111") then 
			Q_Int <= "000";
			else Q_Int <= Q_Int + 1;
			end if;
		end if;
			
	end process;
Q <= STD_LOGIC_VECTOR(Q_Int);
end Behavioral;

