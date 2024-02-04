`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name: digital_clk_TB
//////////////////////////////////////////////////////////////////////////////////


module digital_clk_TB(
    );
    
    logic clr, clk, load;
    logic [6:0] seg;
    logic [3:0] an;
    
    top_module tb_inst (.clr(clr), .clk(clk), .load(load), .seg(seg), .an(an));
    
    always #10 clk = ~clk;
    
    initial begin
        clr = 1'b1;
        clk = 1'b0;
        load = 1'b0;
        #5
        clr = 1'b0;
        #35
        load = 1'b1;
        #10
        load = 1'b0;
        #100
        load = 1'b1;
        #1000
        $finish;
    end
endmodule
