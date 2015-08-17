----------------------------------------------------------------------------------
-- Company: 		 Engs 31 15X
-- Engineer: 		 E.W. Hansen, Audyn Curless, Joon Cho
-- 
-- Create Date:      15:44:25 07/25/2009 
-- Design Name: 
-- Module Name:      lab5top - Behavioral 
-- Project Name:	   Lab 6 
-- Target Devices:   Spartan 3E or Spartan 6
-- Tool versions:    ISE 14.7
-- Description:      Top level shell for Lab 5 (RS-232 serial link)
--
-- Dependencies:     SerialRx.vhd, SerialTx.vhd, mux7seg.vhd
--
-- Revision: 
-- Revision 0.01 - File Created
--		Revised (EWH) 7.19.2014 for Nexys3 board and updated lab flow
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

library UNISIM;					-- needed for the BUFG component
use UNISIM.Vcomponents.ALL;

entity lab5top is
    Port ( mclk      : in  STD_LOGIC;				-- Master clock
           RsRx      : in  STD_LOGIC;				-- Rx input
		     RsTx      : out  STD_LOGIC;				-- Tx output

           -- Testing ports
           clk10_p   : out std_logic;				-- 10 MHz clock

           RsRx_p    : out std_logic;				-- serial data stream
		     rx_shift_p     : out std_logic;			-- Rx register shift           
		     rx_done_tick_p : OUT  std_logic;	-- data ready
			
		     PlaybackSwitch : in std_logic;	-- buffer switch
			  EmptyLED  : out std_logic; 			-- empty led
			  FullLed   : out std_logic; 			-- led out
			
			  segments	: out std_logic_vector(0 to 6);
			  anodes 	: out std_logic_vector(3 downto 0));
						
end lab5top;


architecture Structural of lab5top is

-- SIGNAL DECLARATIONS 
-- Signals for the clock divider, which divides the master clock down to 10 Mhz
-- Master clock frequency / CLOCK_DIVIDER_VALUE = 20 MHz
constant CDV2: integer :=  50E6/20E6;			-- Nexys2 board has 50 MHz clock
constant CDV3: integer := 100E6/20E6;      		-- Nexys3 board has 100 MHz clock
constant CLOCK_DIVIDER_VALUE: integer := CDV3;  -- use CDV2 or CDV3
constant CLOCK_DIVIDER_VALUE2: integer := 1E4;  
signal clkdiv: integer := 0;					-- the clock divider counter
signal clkdiv2: integer := 0;					-- the clock divider counter
signal clkdiv_tog: std_logic := '0';
signal clkdiv_tog2: std_logic := '0';			-- terminal count
signal clk10: std_logic := '0';                 -- the 10 MHz clock
signal clk11: std_logic := '0';                 -- the 10 MHz clock

-- Other signals
signal rx_data : std_logic_vector(7 downto 0);
signal rx_done_tick : std_logic;

-- signals for memory receiver
signal data_out : std_logic_vector(7 downto 0);
signal tx_done_tick : std_logic;
signal tx_start_tick : std_logic;

-- Component declarations
COMPONENT SerialRx
	PORT(
		Clk : IN std_logic;
		RsRx : IN std_logic;   
		rx_shift : out std_logic;		-- for testing      
		rx_data :  out std_logic_vector(7 downto 0);
		rx_done_tick : out std_logic  );
	END COMPONENT;

-- Add declarations for SerialTx and Mux7seg here
COMPONENT mux7seg
	PORT(
		clk : IN std_logic;
		y0 : IN std_logic_vector(3 downto 0);
		y1 : IN std_logic_vector(3 downto 0);
		y2 : IN std_logic_vector(3 downto 0);
		y3 : IN std_logic_vector(3 downto 0);          
		seg : OUT std_logic_vector(0 to 6);
		an : OUT std_logic_vector(3 downto 0)
		);
	END COMPONENT;

COMPONENT SerialTx
	PORT(
		Clk : IN std_logic;
		tx_data : IN std_logic_vector(7 downto 0);
		tx_start : IN std_logic;          
		tx : OUT std_logic;
		tx_done_tick : OUT std_logic
		);
	END COMPONENT;
	
COMPONENT MemoryReceiver
	PORT(
		rx_done_tick : IN std_logic;
		clk : IN std_logic;
		data_in : IN std_logic_vector(7 downto 0);
		PlaybackSwitch : IN std_logic;
		tx_done_tick : IN std_logic;
		tx_start_tick : OUT std_logic;          
		data_out : OUT std_logic_vector(7 downto 0);
		EmptyLED : OUT std_logic;
		FullLED : OUT std_logic
		);
	END COMPONENT;

-------------------------
	
begin

-- Clock buffer for 10 MHz clock
-- The BUFG component puts the slower clock onto the FPGA clocking network
Slow_clock_buffer: BUFG
      port map (I => clkdiv_tog,
                O => clk10 );

-- Divide the master clock down to 20 MHz, then toggling the
-- clkdiv_tog signal at 20 MHz gives a 10 MHz clock with 50% duty cycle.
Clock_divider: process(mclk)
begin
	if rising_edge(mclk) then
	   	if clkdiv = CLOCK_DIVIDER_VALUE-1 then 
	   		clkdiv_tog <= NOT(clkdiv_tog);		
			clkdiv <= 0;
		else
			clkdiv <= clkdiv + 1;
		end if;
	end if;
end process Clock_divider;

Clock_divider2: process(mclk)
begin
	if rising_edge(mclk) then
	   	if clkdiv2 = CLOCK_DIVIDER_VALUE2-1 then 
	   		clkdiv_tog2 <= NOT(clkdiv_tog2);		
			clkdiv2 <= 0;
		else
			clkdiv2 <= clkdiv2 + 1;
		end if;
	end if;
end process Clock_divider2;

------------------------------

-- Map testing signals to toplevel ports
clk10_p <= clkdiv_tog;
RsRx_p <= RsRx;				
rx_done_tick_p <= rx_done_tick;

Receiver: SerialRx PORT MAP(
		clk => clk10,				
		RsRx => RsRx,
		rx_shift => rx_shift_p,		
		rx_data => rx_data,
		rx_done_tick => rx_done_tick  
	);

Inst_mux7seg: mux7seg PORT MAP(
		clk => clkdiv_tog2,
		y0 => rx_data(3 downto 0),
		y1 => rx_data(7 downto 4),
		y2 => "0000",
		y3 => "0000",
		seg => segments,
		an => anodes
	);
	
Inst_SerialTx: SerialTx PORT MAP(
		Clk => clk10,
		tx_data => data_out,
		tx_start => tx_start_tick,
		tx => RsTx,
		tx_done_tick => tx_done_tick
	);
	
Inst_MemoryReceiver: MemoryReceiver PORT MAP(
		rx_done_tick => rx_done_tick,
		clk => clk10,
		data_in => rx_data,
		data_out => data_out,
		EmptyLED => EmptyLED,
		FullLED => FullLED ,
		PlaybackSwitch => PlaybackSwitch,
		tx_done_tick => tx_done_tick,
		tx_start_tick => tx_start_tick
	);


end Structural;

