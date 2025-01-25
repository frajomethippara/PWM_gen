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
        inc_dut_cyc : in std_logic;
        pwm_out : out std_logic
    );
end pwm_gen;

architecture Behavioral of pwm_gen is
    signal counter : integer := 0;
--    signal counter : integer range 0 to 100 := 0;
    signal duty_cycle : integer := 0;
    begin
--    process (clk, inc_dut_cyc)
--        begin
----            if inc_dut_cyc = '1' then
----                counter <= 0;
----                if duty_cycle < 100 then
----                  duty_cycle <= duty_cycle + 10;
----                else
----                    duty_cycle <= 0;
----                end if;

--            if rising_edge(clk) then
--                if inc_dut_cyc = '1' then
----                if rising_edge(inc_dut_cyc) then
--                    counter <= 0;
--                    if duty_cycle < 100 then
--                      duty_cycle <= duty_cycle + 10;
--                    else
--                        duty_cycle <= 0;
--                    end if;
--                end if;
--                if counter < 99 then
--                    counter <= counter + 1;
--                else
--                    counter <= 0;
--                end if;
            
----            elsif rising_edge(inc_dut_cyc) then
----                counter <= 0;
----                if duty_cycle < 100 then
----                  duty_cycle <= duty_cycle + 10;
----                else
----                    duty_cycle <= 0;
----                end if;           
--            end if;
            
----            if counter < duty_cycle  then
----                pwm_out <= '1';
----            else
----                pwm_out <= '0';
----            end if;
----            pwm_out <= '1' when counter < duty_cycle else '0';
--    end process;


    process(inc_dut_cyc)
    begin
        if rising_edge(inc_dut_cyc) then
--            counter <= 0;
            if duty_cycle < 100 then
                duty_cycle <= duty_cycle + 10;
            else
                duty_cycle <= 0;
            end if;
        end if;      
    end process;
    
    process (clk)
    begin
        if rising_edge(clk) then
            if counter < 99 then
                counter <= counter + 1;
            else
                counter <= 0;
            end if;     
        end if;
    end process;
    pwm_out <= '1' when counter < duty_cycle else '0';
end Behavioral;