----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date: 01/17/2025 03:32:10 PM
-- Design Name:
-- Module Name: pwm_gen - Behavioral
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
use ieee.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity pwm_gen is
    port(
        clk : in std_logic;
        rst : in std_logic;
        pwm_gen : out std_logic
    );
end pwm_gen;

architecture Behavioral of pwm_gen is
    signal counter : std_logic_vector( 7 downto 0 );
    begin
    process (clk, rst)
        begin
            if rst = '1' then
                counter <= (others => '0');
            elsif rising_edge(clk) then
                if counter < 99 then
                    counter <= counter + '1';
                else
                    counter <= (others => '0');
                end if;
            end if;
    end process;
    pwm_gen <= '1' when counter < 20 else '0';
end Behavioral;