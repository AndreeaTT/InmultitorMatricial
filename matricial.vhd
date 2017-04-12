----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/29/2017 08:32:05 AM
-- Design Name: 
-- Module Name: matricial - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
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
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity matricial is
  Port (
  	X: in STD_LOGIC_VECTOR(7 downto 0);
  	Y: in STD_LOGIC_VECTOR(7 downto 0);
  	P: out STD_LOGIC_VECTOR(15 downto 0)
   );
end matricial;

architecture Behavioral of matricial is

type matrix1 is array(6 downto 0) of STD_LOGIC_VECTOR(8 downto 0);
type matrix2 is array(7 downto 0) of STD_LOGIC_VECTOR(8 downto 0);
type matrix3 is array(7 downto 0) of STD_LOGIC_VECTOR(7 downto 0);

signal pp: matrix3 := (others => (others => '0'));
signal t: matrix1 := (others => (others => '0'));
signal s:matrix2 := (others => (others => '0'));

begin

mult0: for i in 0 to 7 generate
    mult01: for j in 0 to 7 generate
        pp(i)(j) <= Y(i) and X(j);
    end generate mult01;
end generate mult0;

mult1: for i in 1 to 6 generate
       t(i)(0) <= '0';
end generate mult1;

mult2: for i in 1 to 7 generate
       s(i)(8) <= t(i-1)(8);
end generate mult2;

rez: for i in 0 to 15 generate
      p(i) <= s(i)(0) when (i < 8) else s(7)(i-7);
end generate rez;

mult3: for i in 0 to 6 generate	
 mult31: for j in 0 to 7 generate	 
  	DUT: entity WORK.sumel port map(s(i)(j+1), pp(i+1)(j), t(i)(j), s(i+1)(j), t(i)(j+1));
 end generate mult31;
end generate mult3;

mult4: for i in 0 to 7 generate
       s(0)(i) <= pp(0)(i);
end generate mult4;

end Behavioral;
