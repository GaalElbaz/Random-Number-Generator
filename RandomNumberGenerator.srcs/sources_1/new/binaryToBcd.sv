`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////// 
// Module Name: binaryToBcd
//////////////////////////////////////////////////////////////////////////////////


module binaryToBcd(
    input [7:0] in,
    // we need 4 bits in order to represent the digit 9 (1001).
    output logic [3:0] ones,
    output logic [3:0] tens,
    output logic [3:0] hunds
    );
    
    logic [7:0] bcd_data = 0;
    always_comb begin
                                    // Assume for example in = 235
        bcd_data = in;              // bcd_data = 235
        ones = bcd_data % 10;       // x = 5;
        bcd_data = bcd_data - ones; // bcd_data = 230
        bcd_data = bcd_data / 10;   // bcd_data = 23
        tens = bcd_data % 10;       // tens = 3
        bcd_data = bcd_data - tens; // bcd_data = 20
        bcd_data = bcd_data / 10;   // bcd_data = 2
        hunds = bcd_data % 10;      // hunds = 2   
    end
    
    
endmodule
