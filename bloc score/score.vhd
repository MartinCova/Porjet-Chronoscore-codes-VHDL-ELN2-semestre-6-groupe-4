----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:29:58 03/04/2022 
-- Design Name: 
-- Module Name:    score - Behavioral 
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

entity score is
    Port ( CE_1ms : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           BPL : in  STD_LOGIC;
           BPreset : in  STD_LOGIC;
           BPV : in  STD_LOGIC;
           loc_unit : out  STD_LOGIC_VECTOR (3 downto 0);
           loc_dec : out  STD_LOGIC_VECTOR (3 downto 0);
           vis_unit : out  STD_LOGIC_VECTOR (3 downto 0);
           vis_dec : out  STD_LOGIC_VECTOR (3 downto 0));
end score;

architecture Behavioral of score is

begin


end Behavioral;

