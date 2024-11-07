`timescale 1ns / 1ps

module pwm_gen_testbench
    reg clk;
    reg rst;
    wire pwm_gen_out;
    
    pwm_gen dut(
    .clk(clk),
    .rst(rst),
    .pwm_gen_out(pwm_gen_out)
    );
    
initial begin
    clk = 0;
    rst = 1;
    #500;
    rst = 0;
end

always #2.5 clk = ~clk;
endmodule
