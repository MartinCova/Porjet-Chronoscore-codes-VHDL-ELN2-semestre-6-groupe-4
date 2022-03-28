--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:22:37 03/04/2022
-- Design Name:   
-- Module Name:   C:/CPE_USERS/TPELEC_3ETI/GR_B/ELN2/SCORING/EQUIPE_4/chronoscore_phase2/chrnometer_tb.vhd
-- Project Name:  chronoscore_phase2
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: chronometer
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY chrnometer_tb IS
END chrnometer_tb;
 
ARCHITECTURE behavior OF chrnometer_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT chronometer
    PORT(
         START : IN  std_logic;
         clk : IN  std_logic;
         RESET : IN  std_logic;
         CE_1s : IN  std_logic;
         WAIT_t : IN  std_logic;
         sec_unit : OUT  std_logic_vector(3 downto 0);
         sec_dec : OUT  std_logic_vector(3 downto 0);
         min_unit : OUT  std_logic_vector(3 downto 0);
         min_dec : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal START : std_logic := '0';
   signal clk : std_logic := '0';
   signal RESET : std_logic := '0';
   signal CE_1s : std_logic := '0';
   signal WAIT_t : std_logic := '0';

 	--Outputs
   signal sec_unit : std_logic_vector(3 downto 0);
   signal sec_dec : std_logic_vector(3 downto 0);
   signal min_unit : std_logic_vector(3 downto 0);
   signal min_dec : std_logic_vector(3 downto 0);

   -- Clock period definitions
	constant clk_period : time := 10 ns;
	constant CE_1s_period : time := 1000 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: chronometer PORT MAP (
          START => START,
          clk => clk,
          RESET => RESET,
          CE_1s => CE_1s,
          WAIT_t => WAIT_t,
          sec_unit => sec_unit,
          sec_dec => sec_dec,
          min_unit => min_unit,
          min_dec => min_dec
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
	
	CE_1s_process :process
		begin
		CE_1s <= '0';
		wait for 990 ns;
		CE_1s <= '1';
		wait for 10 ns;
	end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		wait for 100 ns;
		START <= '0';
		RESET <= '1';
      wait for 20 ns;
		RESET <= '0';
		START <= '1';
      wait for 20 ns;
		START <= '0';
      wait for 20 ns;
		START <= '1';
      wait;
   end process;

END;
