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
--    generic(
--        duty_cycle : integer := 0
--    );
    port(
        clk : in std_logic;
        dut_cyc_0 : in std_logic;
        dut_cyc_1 : in std_logic;
        dut_cyc_no : in std_logic;
        pwm_out : out std_logic
    );
end pwm_gen;

architecture Behavioral of pwm_gen is
    signal counter : integer range 0 to 100 := 0;
    signal duty_cycle : integer := 0;
    
    function getDutyCycle(sw_0 : std_logic;
                            sw_1 : std_logic;
                            sw_no : std_logic) return integer is
        variable dc : integer range 0 to 100 := 0;                    
        begin
            if sw_0 = '0' and sw_1 = '0' then
                dc := 25;
            elsif sw_0 = '0' and sw_1 = '1' then
                dc := 50;
            elsif sw_0 = '1' and sw_1 = '0' then
                dc := 75;
            elsif sw_0 = '1' and sw_1 = '1' then
                dc := 100;
            end if;
            
            if sw_no = '1' then
                dc := 0;
            end if;
            
            return dc;
    end function;
    
    begin
    
    process (clk)
    begin
        if rising_edge(clk) then
            if counter < 99 then
                counter <= counter + 1;
            else
                counter <= 0;
            end if;     
        end if;
        duty_cycle <= getDutyCycle(dut_cyc_0, dut_cyc_1, dut_cyc_no);
    end process;
    pwm_out <= '1' when counter < duty_cycle else '0';
end Behavioral;