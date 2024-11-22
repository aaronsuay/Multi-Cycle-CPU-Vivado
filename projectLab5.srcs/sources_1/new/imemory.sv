`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/17/2023 03:08:35 PM
// Design Name: 
// Module Name: imemory
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


module imemory(
    input logic clk, reset,
    input logic RegWriteM,
    input logic [1:0] ResultSrcM,
    input logic MemWriteM,
    input logic [31:0] ALUResultM,
    input logic [31:0] WriteDataM,
    input logic [4:0] RdM,
    input logic [31:0] PCPlus4M,
    
    output logic RegWriteW,
    output logic [1:0] ResultSrcW,
    output logic [31:0] ALUResultW,
    output logic [31:0] ReadDataW,
    output logic [4:0] RdW, 
    output logic [31:0] PCPlus4W
    
    );
logic [31:0] RD;
dmem dmem(clk, MemWriteM, ALUResultM, WriteDataM, RD );
mem_WB mem_WB(clk, reset, RegWriteM, ResultSrcM, ALUResultM, RD, RdM, PCPlus4M,
RegWriteW, ResultSrcW, ALUResultW, ReadDataW, RdW, PCPlus4W );
endmodule
