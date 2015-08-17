--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:26:15 08/12/2015
-- Design Name:   
-- Module Name:   O:/ENGS31/lab6final/LAB6_TB.vhd
-- Project Name:  lab6
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: lab5top
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
 
ENTITY LAB6_TB IS
END LAB6_TB;
 
ARCHITECTURE behavior OF LAB6_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT lab5top
    PORT(
         mclk : IN  std_logic;
         RsRx : IN  std_logic;
         RsTx : OUT  std_logic;
         clk10_p : OUT  std_logic;
         RsRx_p : OUT  std_logic;
         rx_shift_p : OUT  std_logic;
         rx_done_tick_p : OUT  std_logic;
         PlaybackSwitch : IN  std_logic;
         EmptyLED : OUT  std_logic;
         FullLed : OUT  std_logic;
         segments : OUT  std_logic_vector(0 to 6);
         anodes : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal mclk : std_logic := '0';
   signal RsRx : std_logic := '0';
   signal PlaybackSwitch : std_logic := '0';

 	--Outputs
   signal RsTx : std_logic;
   signal clk10_p : std_logic;
   signal RsRx_p : std_logic;
   signal rx_shift_p : std_logic;
   signal rx_done_tick_p : std_logic;
   signal EmptyLED : std_logic;
   signal FullLed : std_logic;
   signal segments : std_logic_vector(0 to 6);
   signal anodes : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant mclk_period : time := 10 ns;
   constant clk10_p_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: lab5top PORT MAP (
          mclk => mclk,
          RsRx => RsRx,
          RsTx => RsTx,
          clk10_p => clk10_p,
          RsRx_p => RsRx_p,
          rx_shift_p => rx_shift_p,
          rx_done_tick_p => rx_done_tick_p,
          PlaybackSwitch => PlaybackSwitch,
          EmptyLED => EmptyLED,
          FullLed => FullLed,
          segments => segments,
          anodes => anodes
        );

   -- Clock process definitions
   mclk_process :process
   begin
		mclk <= '0';
		wait for mclk_period/2;
		mclk <= '1';
		wait for mclk_period/2;
   end process;
 
   clk10_p_process :process
   begin
		clk10_p <= '0';
		wait for clk10_p_period/2;
		clk10_p <= '1';
		wait for clk10_p_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for mclk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
