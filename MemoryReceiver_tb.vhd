--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:21:30 08/12/2015
-- Design Name:   
-- Module Name:   O:/ENGS31/lab6final/MemoryReceiver_tb.vhd
-- Project Name:  lab6
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: MemoryReceiver
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
 
ENTITY MemoryReceiver_tb IS
END MemoryReceiver_tb;
 
ARCHITECTURE behavior OF MemoryReceiver_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT MemoryReceiver
    PORT(
         rx_done_tick : IN  std_logic;
         clk : IN  std_logic;
         data_in : IN  std_logic_vector(7 downto 0);
         data_out : OUT  std_logic_vector(7 downto 0);
         EmptyLED : OUT  std_logic;
         FullLED : OUT  std_logic;
         PlaybackSwitch : IN  std_logic;
         tx_done_tick : IN  std_logic;
         tx_start_tick : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal rx_done_tick : std_logic := '0';
   signal clk : std_logic := '0';
   signal data_in : std_logic_vector(7 downto 0) := (others => '0');
   signal PlaybackSwitch : std_logic := '0';
   signal tx_done_tick : std_logic := '0';

 	--Outputs
   signal data_out : std_logic_vector(7 downto 0);
   signal EmptyLED : std_logic;
   signal FullLED : std_logic;
   signal tx_start_tick : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: MemoryReceiver PORT MAP (
          rx_done_tick => rx_done_tick,
          clk => clk,
          data_in => data_in,
          data_out => data_out,
          EmptyLED => EmptyLED,
          FullLED => FullLED,
          PlaybackSwitch => PlaybackSwitch,
          tx_done_tick => tx_done_tick,
          tx_start_tick => tx_start_tick
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for clk_period*4;

      -- insert stimulus here 
		
		

      wait;
   end process;

END;
