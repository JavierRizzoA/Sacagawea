-- TestBench Template 

  LIBRARY ieee;
  USE ieee.std_logic_1164.ALL;
  USE ieee.numeric_std.ALL;

  ENTITY testbench IS
  END testbench;
 
  ARCHITECTURE behavior OF testbench IS 

  -- Component Declaration
          COMPONENT Sacagawea
          PORT(
                  clk : in  STD_LOGIC;
					  senal_rst : in  STD_LOGIC;
					  switches_sal : in  STD_LOGIC_VECTOR (7 downto 0);
					  leds_in : out  STD_LOGIC_VECTOR (7 downto 0);
					  bus_datos_memtoregs :  out std_logic_vector(7 downto 0);
					  bus_datos_mbrtomem : out std_logic_vector(7 downto 0);
					  senal_rw : out std_logic;
					  conta : out std_logic_vector(24 downto 0);
					  salida_ip : out std_logic_vector(11 downto 0);
					  salida_ir : out std_logic_vector(7 downto 0);
					  salida_ar : out std_logic_vector(11 downto 0)
                 );
          END COMPONENT;
 
          --inputs
			 signal clk : std_logic := '0';
			 signal senal_rst : std_logic := '0';
			 signal switches_sal : std_logic_vector(7 downto 0) := "00000000";
			 
			 -- outputs
			 signal leds_in : std_logic_vector(7 downto 0) := "00000000";
			 signal bus_datos_memtoregs : std_logic_vector(7 downto 0);
			 signal bus_datos_mbrtomem : std_logic_vector(7 downto 0);
			 signal senal_rw : std_logic := '0';
			 signal conta : std_logic_vector(24 downto 0);
			 signal salida_ip : std_logic_vector(11 downto 0);
			 signal salida_ir : std_logic_vector(7 downto 0);
			 signal salida_ar : std_logic_vector(11 downto 0);
          

  BEGIN

  -- Component Instantiation
          uut: Sacagawea PORT MAP(
                  clk => clk,
                  senal_rst => senal_rst,
						switches_sal => switches_sal,
						leds_in => leds_in,
						bus_datos_memtoregs => bus_datos_memtoregs,
						bus_datos_mbrtomem => bus_datos_mbrtomem,
						senal_rw => senal_rw,
						conta => conta,
						salida_ip => salida_ip,
						salida_ir => salida_ir,
						salida_ar => salida_ar
          );


  --  Test Bench Statements
     tb : PROCESS
     BEGIN
	  
		-- ya funciona cargar numero directo a RAM :)
		-- ya carga un numero a LEDS
		-- No funciona el SLT
		-- Error con switches, no funciona
		
		
		

        wait for 100 ns; -- wait until global set/reset completes
			
			clk <= '0';
			switches_sal <= X"53";
			
			wait for 100 ns;
			
			clk <= '1';
			
			wait for 100 ns;
			
			clk <= '0';
	
			wait for 100 ns;
			
			clk <= '1';
			
			wait for 100 ns;
			
			clk <= '0';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '1';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '0';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '1';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '0';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '1';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '0';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '1';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '0';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '1';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '0';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '1';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '0';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '1';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '0';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '1';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '0';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '1';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '0';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '1';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '0';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '1';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '0';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '1';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '0';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '1';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '0';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '1';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '0';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '1';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '0';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '1';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '0';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '1';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '0';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '1';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '0';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '1';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '0';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '1';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '0';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '1';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '0';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '1';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '0';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '1';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '0';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '1';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '0';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '1';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '0';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '1';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '0';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '1';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '0';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '1';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '0';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '1';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '0';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '1';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '0';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '1';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '0';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '1';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '0';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '1';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '0';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '1';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '0';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '1';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '0';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '1';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '0';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '1';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '0';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '1';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '0';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '1';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '0';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '1';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '0';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '1';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '0';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '1';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '0';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '1';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '0';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '1';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '0';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '1';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '0';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '1';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '0';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '1';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '0';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '1';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '0';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '1';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '0';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '1';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '0';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '1';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '0';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '1';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '0';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '1';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '0';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '1';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '0';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '1';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '0';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '1';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '0';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '1';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '0';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '1';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '0';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '1';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '0';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '1';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '0';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '1';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '0';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '1';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '0';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '1';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '0';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '1';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '0';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '1';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '0';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '1';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '0';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '1';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '0';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '1';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '0';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '1';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '0';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '1';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '0';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '1';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '0';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '1';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '0';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '1';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '0';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '1';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '0';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '1';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '0';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '1';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '0';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '1';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '0';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '1';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '0';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '1';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '0';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '1';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '0';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '1';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '0';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '1';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '0';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '1';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '0';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '1';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '0';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '1';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '0';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '1';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '0';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '1';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '0';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '1';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '0';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '1';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '0';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '1';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '0';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '1';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '0';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '1';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '0';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '1';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '0';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '1';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '0';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '1';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '0';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '1';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '0';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '1';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '0';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '1';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '0';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '1';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '0';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '1';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '0';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '1';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '0';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '1';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '0';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '1';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '0';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '1';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '0';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '1';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '0';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '1';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '0';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '1';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '0';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '1';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '0';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '1';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '0';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '1';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '0';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '1';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '0';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '1';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '0';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '1';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '0';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '1';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '0';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '1';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '0';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '1';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '0';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '1';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '0';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '1';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '0';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '1';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '0';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '1';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '0';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '1';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '0';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '1';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '0';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '1';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '0';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '1';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '0';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '1';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '0';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '1';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '0';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '1';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '0';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '1';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '0';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '1';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '0';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '1';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '0';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '1';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '0';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '1';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '0';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '1';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '0';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '1';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '0';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '1';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '0';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '1';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '0';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '1';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '0';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '1';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '0';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '1';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '0';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '1';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '0';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '1';
			senal_rst <= '0';
			
			wait for 100 ns;
			clk <= '0';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '1';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '0';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '1';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '0';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '1';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '0';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '1';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '0';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '1';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '0';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '1';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '0';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '1';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '0';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '1';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '0';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '1';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '0';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '1';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '0';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '1';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '0';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '1';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '0';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '1';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '0';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '1';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '0';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '1';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '0';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '1';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '0';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '1';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '0';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			clk <= '1';
			senal_rst <= '0';
			
			wait for 100 ns;
			
			
       
        wait; -- will wait forever
     END PROCESS tb;
  --  End Test Bench 

  END;
