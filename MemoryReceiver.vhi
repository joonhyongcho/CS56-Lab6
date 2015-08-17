
-- VHDL Instantiation Created from source file MemoryReceiver.vhd -- 15:58:05 08/06/2015
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT MemoryReceiver
	PORT(
		rx_done_tick : IN std_logic;
		clk : IN std_logic;
		data_in : IN std_logic_vector(7 downto 0);
		PlaybackSwitch : IN std_logic;
		tx_done_tick : IN std_logic;
		tx_start_tick : IN std_logic;          
		data_out : OUT std_logic_vector(7 downto 0);
		EmptyLED : OUT std_logic;
		FullLED : OUT std_logic
		);
	END COMPONENT;

	Inst_MemoryReceiver: MemoryReceiver PORT MAP(
		rx_done_tick => ,
		clk => ,
		data_in => ,
		data_out => ,
		EmptyLED => ,
		FullLED => ,
		PlaybackSwitch => ,
		tx_done_tick => ,
		tx_start_tick => 
	);


