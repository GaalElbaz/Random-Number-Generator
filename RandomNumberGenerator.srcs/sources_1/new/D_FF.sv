`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name: D_FF
//////////////////////////////////////////////////////////////////////////////////


module D_FF(
    input load,
    input D,
    input clk,
    input rst,
    output logic Q
    );
    
    always_ff @(posedge clk or posedge rst) begin
        if(rst) 
            Q <= 1'b0;
        else if(load)
            Q <= D;
    end    
endmodule
