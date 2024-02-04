`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name: seven_seg_decoder
//////////////////////////////////////////////////////////////////////////////////


module seven_seg_decoder(
    input [3:0] in,
    output logic [6:0] seg
    );
    
    always_comb begin
        case(in)
            0: seg = 7'b0000001;  
            1: seg = 7'b1001111; 
            2: seg = 7'b0010010;
            3: seg = 7'b0000110;
            4: seg = 7'b1001100;
            5: seg = 7'b0100100;
            6: seg = 7'b0100000;
            7: seg = 7'b0001111;
            8: seg = 7'b0000000;
            9: seg = 7'b0001100;
        endcase
    end
endmodule
