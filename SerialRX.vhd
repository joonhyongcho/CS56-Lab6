----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Audyn Curless, Joon Cho
-- 
-- Create Date:    21:17:06 07/29/2015 
-- Design Name: 
-- Module Name:    SerialRX - Behavioral 
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

entity SerialRX is
	Port ( clk : in STD_LOGIC; 								-- 10MHz clock
		RsRx : in STD_LOGIC; 									-- received bit stream
		rx_shift : out STD_LOGIC; 								-- for testing
		rx_data : out STD_LOGIC_VECTOR (7 downto 0); 	-- data byte
		rx_done_tick : out STD_LOGIC );					 	-- data ready tick
end SerialRX;

architecture Behavioral of SerialRX is
	--state stuff
	constant clkspeed: integer:=10E6;
	constant baudrate: integer:=115200;
	constant N: integer:=clkspeed/baudrate-1;
	constant Ntwo: integer:=N/2;
	
	type state_type is (s000, s001, s010, s011, s100);
	signal currents : state_type := s000;
	signal nexts : state_type := s000;
	
	-- sync stuff
	signal sreg : std_logic_vector(1 downto 0) := (others => '1');
	signal datasync : std_logic := '1';
	
	-- register stuff
	signal shift : std_logic := '0';
	signal export : std_logic := '0';
	signal clear : std_logic := '0';
	signal ten_reg : std_logic_vector(9 downto 0) := (others => '0');
	signal eight_reg : std_logic_vector(7 downto 0) := (others => '0');
	
	--clock stuff
	signal clkenable : std_logic := '0';
	signal clkclear : std_logic := '0';
	signal clkenableh : std_logic := '0';
	signal clkclearh : std_logic := '0';
	signal halfn : std_logic := '0';
	signal fulln : std_logic := '0';
	signal bittenreached : std_logic := '0';
	signal bitcnten : std_logic := '0';
	
	-- state machine stuff
	signal transfer : std_logic := '0';
	signal bitcnt : unsigned(3 downto 0) := (others => '0');
	signal clkcnt : unsigned(7 downto 0) := (others => '0');
	signal clkcnth : unsigned(7 downto 0) := (others => '0');
begin
	sync_proc : process(clk)
	begin 
		if rising_edge(clk) then
			datasync <= sreg(1);
			sreg <= sreg(0) & RsRx;
		end if;
	end process;
	
	
	shift_reg : process(clk, datasync, shift, export, transfer)
	begin
		if rising_edge(clk) then
			if (clear = '1') then
				ten_reg <= (others => '0');
			end if;
			
			if (shift = '1') then
				ten_reg <= datasync & ten_reg(9 downto 1);
			end if;
			
			if (transfer = '1') then
				eight_reg <= ten_reg(8 downto 1);
			end if;
			
			if (export = '1') then
				rx_data <= eight_reg(7 downto 0);
			end if;
			
		end if;
	end process;
	
	sync_proc_reg: process(clk)
	begin
		if rising_edge(clk) then 
			currents <= nexts;
		end if;
	end process sync_proc_reg;
	
	count_proc: process(clk, clkenable, clkclear)
	begin
		if (clkclear = '1') then
			clkcnt <= (others => '0');
			fulln <= '0';
		else
			if (clkcnt = to_unsigned(N,8)) then
				fulln <= '1';
				clkcnt <= (others => '0');
			else
				if (clkenable = '1') then
					if rising_edge(clk) then
						clkcnt <= clkcnt + 1;
						fulln <= '0';
					end if;
				end if;
			end if;
		end if;
	end process count_proc;
	
	count_proc_half: process(clk, clkenableh, clkclearh)
	begin
		if (clkclearh = '1') then
			clkcnth <= (others => '0');
			halfn <= '0';
		else
			if (clkcnth = to_unsigned(Ntwo,8) and currents = s001) then
				halfn <= '1';
				clkcnth <= (others => '0');
			else
				if (clkenableh = '1') then
					if rising_edge(clk) then
						clkcnth <= clkcnth + 1;
						halfn <= '0';
					end if;
				end if;
			end if;
		end if;
	end process count_proc_half;
	
	count_bits : process(clk, bitcnten)
	begin
		if rising_edge(clk) then
			bittenreached <= '0';
			if (bitcnten = '1') then
				if (bitcnt = to_unsigned(9,4)) then
					bittenreached <= '1';
					bitcnt <= (others => '0');
				else
					bitcnt <= bitcnt + 1;
					bittenreached <= '0';
				end if;
			end if;
		end if;
	end process count_bits;
	
	hlpsm : process(halfn, datasync, currents, bittenreached, fulln)
	begin
		rx_shift <= '0';
		rx_done_tick <= '0';
		shift <= '0';
		transfer <= '0';
		clear <= '0';
		bitcnten <= '0';
		nexts <= currents;
		
		case currents is
			
			-- wating for start bit
			when s000 =>
				if (datasync = '0') then
					nexts <= s001;
				else nexts <= s000;
				end if;
			
			-- wait for N/2
			when s001 =>
				if (halfn = '1') then
					shift <= '1';
					rx_shift <= '1';
					nexts <= s010;
					bitcnten <= '1';
				else 
					clkenableh <= '1';
					nexts <= s001;
				end if;
			
			-- get next bit
			when s010 =>
				clkenableh <= '0';
				clkenable <= '1';
				if (bittenreached = '1') then
					nexts <= s011;
				else
					nexts <= s010;
					if (fulln = '1') then
						shift <= '1';
						rx_shift <= '1';
						bitcnten <= '1';
					end if;
				end if;
				
			
			-- transfer bits to register
			when s011 =>
		
				clkenable <= '0';
				transfer <= '1';
				nexts <= s100;
			
			-- export register to rx_data;
			when s100 =>
				rx_done_tick <= '1';
				export <= '1';
				clear <= '1';
				nexts <= s000;
			
		end case;
	end process hlpsm;		
						
					
						
				


end Behavioral;


































