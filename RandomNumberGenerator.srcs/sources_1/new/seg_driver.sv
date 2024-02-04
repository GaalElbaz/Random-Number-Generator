`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name: seg_driver
//////////////////////////////////////////////////////////////////////////////////


module seg_driver(
    input clr,
    input clk,
    input [7:0] in,
    output logic [6:0] seg,
    output logic [3:0] an
    );
    
    localparam HUNDS_LED = 2'b10, TENS_LED = 2'b01, ONES_LED = 2'b00;
    logic [3:0] one = 0, ten = 0 , hund = 0;
    logic [11:0] seg_clk = 0;
    logic [1:0] enable_seg = ONES_LED;
    logic [6:0] seg_ones, seg_tens, seg_hunds;
    
    always_ff @(posedge clk) begin
        seg_clk = seg_clk + 1'b1;
        if(seg_clk[3] == 1) //Generate a slow clock for led switching
            seg_clk = 0;
    end 
    
    always_ff @(posedge clr or posedge seg_clk[3]) begin
        if(clr) begin
            // When game starts -> ALL 3 DIGITS ARE 000
            seg = 7'b0000001;;
            an = 4'b0000;
            enable_seg = ONES_LED;
        end
        else begin
            case(enable_seg)
                ONES_LED: begin
                    seg = seg_ones;
                    an = 4'b1110;
                    enable_seg = TENS_LED;
                end
                TENS_LED: begin
                    seg = seg_tens;
                    an = 4'b1101;
                    enable_seg = HUNDS_LED;
                end
                HUNDS_LED: begin
                    seg = seg_hunds;
                    an = 4'b1011;
                    enable_seg = ONES_LED;
                end
            endcase
        end
    end
    
    // First, need to extract the ones,tens and hunds from in.
    binaryToBcd U0(.in(in),.ones(one),.tens(ten),.hunds(hund));
    // Second, need to convery from bcd to 7-seg form.
    seven_seg_decoder L1(.in(one), .seg(seg_ones));
    seven_seg_decoder L2(.in(ten), .seg(seg_tens));
    seven_seg_decoder L3(.in(hund), .seg(seg_hunds));
    
    
endmodule
