-- TestBench Template 

  LIBRARY ieee;
  USE ieee.std_logic_1164.ALL;
  USE ieee.numeric_std.ALL;

  ENTITY testbench IS
  END testbench;

  ARCHITECTURE behavior OF testbench IS 

  -- Component Declaration
          COMPONENT Alu_regs
         port(r0_ld, r1_ld, r2_ld : in std_logic;
			  sel_a, sel_b : in std_logic_vector ( 1 downto 0);
			  s_mbr: in std_logic_vector(7 downto 0);
			  clk : in std_logic;
			  r0_clr, r1_clr, r2_clr : in std_logic;
			  ctrl_alu : in std_logic_vector(3 downto 0);
			  s_alu_regs: out std_logic_vector( 7 downto 0);
			  x_reg0, x_reg1, x_reg2 : out std_logic_vector( 7 downto 0));
          END COMPONENT;
			signal r0_ld, r1_ld, r2_ld : std_logic;
			signal sel_a, sel_b : std_logic_vector ( 1 downto 0);
			signal s_mbr:  std_logic_vector(7 downto 0);
			signal clk :  std_logic;
			signal r0_clr, r1_clr, r2_clr :  std_logic;
			signal ctrl_alu :  std_logic_vector(3 downto 0);
			signal sout : std_logic_vector(7 downto 0);
			signal x0, x1, x2 : std_logic_vector(7 downto 0);
  BEGIN

  -- Component Instantiation
          uut: Alu_regs PORT MAP(
				r0_ld, r1_ld, r2_ld, sel_a, sel_b, s_mbr, clk, r0_clr, r1_clr,
				r2_clr, ctrl_alu, sout, x0, x1, x2
          );


  --  Test Bench Statements
     tb : PROCESS
     BEGIN
			s_mbr <= "01100110";
			r0_clr <= '1';
			r1_clr <= '1';
			r2_clr <= '1';
			r0_ld <= '0';
			r1_ld <= '0';
			r2_ld <= '0';
			sel_a <= "11";
			sel_b <= "11";
			clk <= '0';
			ctrl_alu <= "0000";
			wait for 100 ns;
			r0_ld <= '1';
		   r1_ld <= '0';
		   r2_ld <= '0';
			sel_a <= "11";
			sel_b <= "11";
			r0_clr <= '0';
			r1_clr <= '0';
			r2_clr <= '0';
			clk <= '1';
		
			ctrl_alu <= "0000";
		 wait for 100 ns;
		 clk <= '0';
		 s_mbr <= "00000011";
        wait for 100 ns; -- wait until global set/reset completes
		   
			r0_ld <= '0';
		   r1_ld <= '1';
		   r2_ld <= '0';			
			sel_a <= "00";
			sel_b <= "11";
			
			clk <= '1';
			r0_clr <= '0';
			r1_clr <= '0';
			r2_clr <= '0';
			ctrl_alu <= "0000";
			wait for 100 ns;
			clk <= '0';
			s_mbr <= "00000101";
			wait for 100 ns;
			r0_ld <= '0';
		   r1_ld <= '0';
		   r2_ld <= '1';
			sel_a <= "00";
			sel_b <= "11";
			
			clk <= '1';
			r0_clr <= '0';
			r1_clr <= '0';
			r2_clr <= '0';
			ctrl_alu <= "0000";
			wait for 100 ns;
			clk <= '0';
			wait for 100 ns;
			r0_ld <= '1';
			r2_ld <= '0';
			clk <= '1';
        -- Add user defined stimulus here

        wait; -- will wait forever
     END PROCESS tb;
  --  End Test Bench 

  END;
