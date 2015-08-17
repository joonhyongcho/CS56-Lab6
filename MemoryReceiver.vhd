----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Joon Cho, Audyn Curless
-- 
-- Create Date:    10:39:54 08/06/2015 
-- Design Name: 
-- Module Name:    MemoryReceiver - Behavioral 
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

entity MemoryReceiver is
    Port ( rx_done_tick : in  STD_LOGIC;
			  clk			: in STD_LOGIC;
           data_in : in  STD_LOGIC_VECTOR (7 downto 0);
           data_out  : out  STD_LOGIC_VECTOR (7 downto 0);
           EmptyLED : out  STD_LOGIC;
           FullLED : out  STD_LOGIC;
           PlaybackSwitch : in  STD_LOGIC;
           tx_done_tick : in  STD_LOGIC;
           tx_start_tick : out  STD_LOGIC);
end MemoryReceiver;

architecture Behavioral of MemoryReceiver is

-- signals for entire RAM
constant RAM_ADRR_BITS : integer := 31;
constant RAM_WIDTH : integer := 8;
type ram_type is array (0 to RAM_ADRR_BITS) of std_logic_vector (RAM_WIDTH-1 downto 0);
signal RAM : ram_type;

-- signals for write address generator
signal enable_write, reset_write : std_logic;
signal write_address : integer range 0 to 31;
signal buffer_full : std_logic;							-- to tell if buffer is full

-- signals for for read address generator
signal enable_read, reset_read : std_logic;
signal first_read : std_logic; 						-- to tell if we should send tx_start right away
signal read_address : integer range 0 to 31;

-- signal to communicate with tx
signal select_output : std_logic := '0';
 
type state_type is (waiting, write_memory, buffer_flush, full, buffer_empty, waiting_tx_done_tick);
signal PS, NS : state_type:=buffer_empty; 

signal write_full, done_buffering, send_to_tx, output_select : STD_LOGIC;

begin

	-- Addr Generator
	Writer : process(CLK, enable_write, reset_write)
	begin
		if (rising_edge(CLK)) then
			-- if reset = '1', then address becomes 0
			if (reset_write = '1') then
				write_address <= 0;
			else
				-- we send enable after done tick is given
				-- so we then just write the data in
				if (enable_write = '1') then
					RAM(write_address) <= data_in;
					if write_address=31 then
						write_address<=0;
					else
						write_address <= write_address + 1;
					end if;
				end if;
			end if;
		end if;
	end process Writer;
	
--	Write_compare : process (write_address)
--	begin
--		if (write_address > 31) then
--			buffer_full <= '1';
--		else
--			buffer_full <= '0';
--		end if;
--	end process Write_compare;
	
	Reading_Counter : process(read_address, write_address) 
	begin
		done_buffering <= '0';

		
		if (read_address = write_address) then
			done_buffering <= '1';

		end if;
	end process Reading_Counter;
	
	Data_Out_Multiplexer : process( RAM, output_select, data_in, read_address)
	begin
		if (output_select = '1') then
			data_out <= RAM(read_address);
		else
			data_out <= data_in;
		end if;
	end process Data_Out_Multiplexer;


	Reader : process(CLK, enable_read, reset_read, send_to_tx)
	begin
		if (rising_edge(CLK)) then
			if (reset_read = '1') then
				read_address <= 0;
			else
				if (enable_read = '1') then
					if read_address = 31 then
						read_address <= 0;
					else
						read_address <= read_address + 1;
					end if;
				end if;
			end if;
		end if;
	end process Reader;

	state_change : process (CLK)
	begin
		if (rising_edge(CLK)) then
			PS <= NS;
		end if;
	end process state_change;
	
	Controller : process ( PS, done_buffering, tx_done_tick, rx_done_tick, PlaybackSwitch)
	begin
		enable_read <= '0';
		enable_write <= '0';
		reset_read <= '0';
		reset_write <= '0';
		EmptyLed <= '0';
		FullLed <= '0';
		NS <= PS;
		tx_start_tick <= '0';
		output_select <= '0';
		
		case PS is 
			-- Buffer is empty, we are waiting for the first rx_done_tick
			when buffer_empty =>
					-- Always turn on the Empty LED
					EmptyLed <= '1';
					reset_write <= '1';
					reset_read <= '1';
					
					-- wait for the first rx_done_tick
					if (rx_done_tick = '1') then
						NS <= write_memory;
					end if;
					
			when waiting =>
				-- This is for everything but the first bit, so 
				-- empty led is off
				EmptyLed <= '0';
				
				-- if buffer if full, we stay at waiting, and nothing gets written
				if (done_buffering = '1') then
					NS <= full;
				end if; 
				
				-- wait for write_memory
				if (rx_done_tick = '1') then
					NS <= write_memory;
				end if;
				
				-- if switch is called, then buffer flush
				if (PlaybackSwitch = '1') then
					NS <= buffer_flush;
				end if;
				
			when full =>
				-- since the start tick will be remapped, we just never give a done tick
				FullLed <= '1';
				if (PlaybackSwitch = '1') then
					NS <= buffer_flush;
				end if;
				enable_write <= '0';
				
			when write_memory =>
				-- automatically, we go into waiting, unless buffer is getting flushed
				NS <= waiting;
				
				tx_start_tick <= '1';
				
				-- if switch is called, then buffer flush
				if (PlaybackSwitch = '1') then
					NS <= buffer_flush;
				end if;
				
				-- tell the memory to write the current bit
				enable_write <= '1';
				
			when buffer_flush =>
				-- tell read to start reading
				enable_read <= '1';
				output_select <= '1';
				tx_start_tick <= '1';
				NS <= waiting_tx_done_tick;
				
				-- if this is the first flush then we are going to send a start_tick immediately
				-- if we get a tx_done_tick then send a start_tick
				
			when waiting_tx_done_tick =>
				output_select <= '1';
				if (tx_done_tick = '1') then
					NS <= buffer_flush;
				end if;
				
				if (done_buffering = '1') then
					NS <= buffer_empty;
				end if;

			end case;
		end process Controller;

end Behavioral;

