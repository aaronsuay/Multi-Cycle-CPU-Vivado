`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/17/2023 04:06:18 PM
// Design Name: 
// Module Name: iwriteback
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module iwriteback(
    input logic clk, reset,
    input logic [1:0] ResultSrcW,
    input logic [31:0] ALUResultW,
    input logic [31:0] ReadDataW, PCPlus4W,
    
    output logic [31:0] ResultW
    );
    
    mux3 mux3(ALUResultW,ReadDataW,PCPlus4W,ResultSrcW,ResultW);

endmodule
