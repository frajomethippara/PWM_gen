----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/17/2024 03:58:46 PM
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
use IEEE.numeric_std.all;
use IEEE.std_logic_unsigned.all;

entity pwm_gen is
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           pwm_gen_out : out STD_LOGIC);
end pwm_gen;

architecture Behavioral of pwm_gen is
--    constant duty : real := 0.6;
    constant duty : integer := 60;
    constant fclk : integer := 200_000_000;
    constant fsw  : integer := 400_000;
    signal counter_pwm: std_logic_vector( 8 downto 0 );
--    signal duty_count : integer := integer(duty * fclk / fsw);
    signal duty_count : integer := integer((duty / 100) * fclk / fsw);    
    
    begin
    pwm_gen_label: process (clk)
    begin
        if rst = '1' then
            counter_pwm <= (others => '1');
        elsif rising_edge (clk) then
            if counter_pwm < (fclk/fsw - 1) then
                counter_pwm <= counter_pwm + '1';
--                pwm_gen_out <= '1';
                report "Values is lower";
            else
                counter_pwm <= (others => '0');
--                pwm_gen_out <= '0';
                report "Valeues is higher";
            end if;
--            report "Counter PWM Value: " & to_integer(unsigned(counter_pwm));
            report "Counter PWM Value: " & integer'image(to_integer(unsigned(counter_pwm)));
        end if; 
    end process pwm_gen_label;
    
    pwm_gen_out <= '1' when counter_pwm < duty_count
                       else '0';

end Behavioral;
