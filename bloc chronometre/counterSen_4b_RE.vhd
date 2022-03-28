----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:29:35 03/04/2022 
-- Design Name: 
-- Module Name:    counterSen_4b_RE - Behavioral 
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

entity counterSen_4b_RE is
    Port ( R : in  STD_LOGIC;
           CE : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           Q : out  STD_LOGIC_VECTOR (3 downto 0);
			  TC : out STD_LOGIC);

end counterSen_4b_RE;

architecture Behavioral of counterSen_4b_RE is

signal Q_int: unsigned(3 downto 0):= "0000";
signal TC_int: STD_LOGIC := '0';

begin
CPT_4b_R : process (clk,R)
	begin
		if (R = '1') then 
			Q_int <= "0000";
			TC_int <= '0';
		else 
		if (rising_edge(clk)) then
			if (CE ='1') then 
				if (Q_int = "0101") then 
					Q_int <="0000";
					TC_int <= '1';
				else
					Q_int <= Q_int + 1;
					TC_int <= '0';
				end if;
			else TC_int <= '0';
			end if; 
		end if; 
	end if;
end process;

Q <= STD_LOGIC_VECTOR(Q_int);
TC <= TC_int;

end Behavioral;

