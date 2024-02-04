`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name: top_module 
//////////////////////////////////////////////////////////////////////////////////


module top_module(
    input clr,
    input clk,
    input load,
    output logic [6:0] seg,
    output logic [3:0] an
    );
    
    
    logic [7:0] Q = 0;
    logic xnor_out;
    
    
    // XNOR OUT LOGIC
    assign xnor_out = ~(Q[3] ^ Q[4] ^ Q[5] ^ Q[7]);
    
    // Module instantition
    //  8 D-FF
    D_FF P7(.load(load), .D(xnor_out), .clk(clk), .rst(rst), .Q(Q[7]));
    D_FF P6(.load(load), .D(Q[7]), .clk(clk), .rst(clr), .Q(Q[6]));
    D_FF P5(.load(load), .D(Q[6]), .clk(clk), .rst(clr), .Q(Q[5]));
    D_FF P4(.load(load), .D(Q[5]), .clk(clk), .rst(clr), .Q(Q[4]));
    D_FF P3(.load(load), .D(Q[4]), .clk(clk), .rst(clr), .Q(Q[3]));
    D_FF P2(.load(load), .D(Q[3]), .clk(clk), .rst(clr), .Q(Q[2]));
    D_FF P1(.load(load), .D(Q[2]), .clk(clk), .rst(clr), .Q(Q[1]));
    D_FF P0(.load(load), .D(Q[1]), .clk(clk), .rst(clr), .Q(Q[0]));
    // MAIN FOR 7-SEG FUNCTIONLITY
    seg_driver M0 (.clr(clr), .clk(clk), .in(Q), .seg(seg) ,.an(an));
    // SETTING LOAD AND CLR BUTTONS.
    debounce B1(.clk_in(clk), .button_in(clr));
    debounce B2(.clk_in(clk), .button_in(load));
endmodule
