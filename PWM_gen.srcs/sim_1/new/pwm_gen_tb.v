module pwm_gen_tb;
    reg clk;
    reg rst;
    wire pwm_out;
    
    pwm_gen dut(
        .clk(clk),
        .rst(rst),
        .pwm_out(pwm_out)
    );
    
    initial begin
        clk = 0;
        rst = 1;
        #50;
        rst = 0;
    end
    
    always #50 clk = ~clk;
    
endmodule