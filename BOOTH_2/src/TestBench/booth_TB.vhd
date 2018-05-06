library ieee;
use ieee.numeric_std.all;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

	-- Add your library and packages declaration here ...

entity booth_tb is
end booth_tb;

architecture TB_ARCHITECTURE of booth_tb is
	-- Component declaration of the tested unit
	component booth
	port(
		A : in SIGNED(7 downto 0);
		B : in SIGNED(7 downto 0);
		C : out SIGNED(15 downto 0) );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal A : SIGNED(7 downto 0);
	signal B : SIGNED(7 downto 0);
	-- Observed signals - signals mapped to the output ports of tested entity
	signal C : SIGNED(15 downto 0);

	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : booth
		port map (
			A => A,
			B => B,
			C => C
		);

	-- Add your stimulus here ...
process 
	begin 			 
		A <= "00000100";
		B <= "00000001" ;
		WAIt FOR 10 NS ;
		A <= "00000100";
		B <= "00000010" ; 
		WAIt FOR 10 NS ;
		A <= "00000101";
		B <= "00000010" ;
		
	end process ;

end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_booth of booth_tb is
	for TB_ARCHITECTURE
		for UUT : booth
			use entity work.booth(booth);
		end for;
	end for;
end TESTBENCH_FOR_booth;

