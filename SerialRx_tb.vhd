--------------------------------------------------------------------------------
-- Company: 		Engs 31 15X
-- Engineer:		E.W. Hansen
--
-- Create Date:     17:11:39 07/25/2009
-- Design Name:   
-- Module Name:     SerialRx_tb.vhd
-- Project Name:    Lab5
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: SerialRx

--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.all;
 
ENTITY SerialRx_tb IS
END SerialRx_tb;
 
ARCHITECTURE behavior OF SerialRx_tb IS 
 
COMPONENT SerialRx
	PORT(
		Clk : IN std_logic;
		RsRx : IN std_logic;   
		rx_shift : out std_logic;		-- for testing      
		rx_data :  out std_logic_vector(7 downto 0);
		rx_done_tick : out std_logic  );
	END COMPONENT;
   
   --Inputs
   signal clk : std_logic := '0';
   signal RsRx : std_logic := '1';

 	--Outputs
   signal rx_shift : std_logic;
   signal rx_data : std_logic_vector(7 downto 0);
   signal rx_done_tick : std_logic;

   -- Clock period definitions
   constant clk_period : time := 100ns;		-- 10 MHz clock
	
	-- Data definitions
--	constant bit_time : time := 104us;		-- 9600 baud
	constant bit_time : time := 8.68us;		-- 115,200 baud
	constant TxData : std_logic_vector(7 downto 0) := "01101001";
	constant TxData1 : std_logic_vector(7 downto 0) := "01010101";
	constant TxData2 : std_logic_vector(7 downto 0) := "11010101";
	constant TxData3 : std_logic_vector(7 downto 0) := "11101010";
	constant TxData4 : std_logic_vector(7 downto 0) := "11111010";
	constant TxData5 : std_logic_vector(7 downto 0) := "00010101";
	constant TxData6 : std_logic_vector(7 downto 0) := "01000101";
	constant TxData7 : std_logic_vector(7 downto 0) := "10111101";
	constant TxData8 : std_logic_vector(7 downto 0) := "11111111";
	constant TxData9 : std_logic_vector(7 downto 0) := "00000000";
	constant TxData10 : std_logic_vector(7 downto 0) := "00011011";
	constant TxData11 : std_logic_vector(7 downto 0) := "11111110";
	
BEGIN 
	-- Instantiate the Unit Under Test (UUT)
   uut: SerialRx PORT MAP (
          clk => clk,
          RsRx => RsRx,
          rx_shift => rx_shift,
          rx_data => rx_data,
          rx_done_tick => rx_done_tick
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
		wait for 100 us;
		wait for 10.25*clk_period;		
		
		RsRx <= '0';		-- Start bit
		wait for bit_time;
		
		for bitcount in 0 to 7 loop
			RsRx <= TxData(bitcount);
			wait for bit_time;
		end loop;
		
		RsRx <= '1';		-- Stop bit
		wait for 200 us;
		
		RsRx <= '0';		-- Start bit
		wait for bit_time;
		
		for bitcount in 0 to 7 loop
			RsRx <= not( TxData(bitcount) );
			wait for bit_time;
		end loop;
		
		RsRx <= '1';		-- Stop bit
		
		wait for 200 uys;
		
		wait;
   end process;
END;
