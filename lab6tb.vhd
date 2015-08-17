--------------------------------------------------------------------------------
-- Company: 
-- Engineer: Audyn Curless, Joon Cho
--
-- Create Date:   14:36:17 08/12/2015
-- Design Name:   
-- Module Name:   O:/ENGS31/lab6final/lab6tb.vhd
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
 
ENTITY lab6tb IS
END lab6tb;
 
ARCHITECTURE behavior OF lab6tb IS 
 
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
    

   signal USELESSSIGNAL : std_logic := '0';

   --Inputs
   signal mclk : std_logic := '0';
   signal RsRx : std_logic := '1';
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
	
	-- constants for the RX
	constant bit_time : time := 8.68us;		-- 115,200 baud	
	type TxData_array_type is array (0 to 9) of std_logic_vector(7 downto 0);
	constant TxData_array : TxData_array_type := ("01101001", "01010101", "11010101", "11101010", "11111010", "00010101", "01000101", "10111101", "10011010", "00011010");
 
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
 


   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for mclk_period*10;

		for numloop in 0 to 1 loop
			for index in TxData_array' range loop
				RsRx <= '0';		-- Start bit
				wait for bit_time;
				
				for bitcount in 0 to 7 loop
					RsRx <= TxData_array(index)(bitcount);
					wait for bit_time;
				end loop;
				
				RsRx <= '1';		-- Stop bit
				
				
				wait for 200 us;
			end loop;
		end loop;
		
		
		PlaybackSwitch <= '1';
		
		-- check that the tx does not output anything when buffering besides what is being flushed
		RsRx <= '0';
		wait for bit_time;
		for bitcount in 0 to 7 loop
			RsRx <= TxData_array(0)(bitcount);
			wait for bit_time;
		end loop;
		RsRx <= '1';
		
		wait for 200 us;
		PlaybackSwitch <= '0';
		
		wait for 200 us;
		
		for numloop in 0 to 3 loop
			for index in TxData_array' range loop
				RsRx <= '0';		-- Start bit
				wait for bit_time;
				
				for bitcount in 0 to 7 loop
					RsRx <= TxData_array(index)(bitcount);
					wait for bit_time;
				end loop;
				
				RsRx <= '1';		-- Stop bit
				
				
				wait for 200 us;
			end loop;
		end loop;
		
		wait for 200 us;
		PlaybackSwitch <= '1';
		wait for 200 us;
		PlaybackSwitch <= '0';

      wait;
   end process;

END;
