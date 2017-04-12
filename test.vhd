----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/29/2017 11:46:17 PM
-- Design Name: 
-- Module Name: test - Behavioral
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

entity test is
--  Port ( );
end test;

architecture Behavioral of test is

 signal X: STD_LOGIC_VECTOR(7 downto 0):="00000000";
 signal Y: STD_LOGIC_VECTOR(7 downto 0):="00000000";
 signal P: STD_LOGIC_VECTOR(15 downto 0);
 
 
begin

TEST: entity WORK.matricial port map(X,Y,P);

gen_test: process
         begin
               X <= "00000001";
               Y <= "00000010";
               wait for 20 ns;
               
               X <= "11111101";
               Y <= "11111001";
               wait for 20 ns;
               
               X <= "00101011";
               Y <= "01001000";
            wait for 20 ns;
         end process gen_test;
   
end Behavioral;
