`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/17/2023 03:21:06 PM
// Design Name: 
// Module Name: mem_WB
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


module mem_WB(
    input logic clk, reset,
    input logic RegWriteM,
    input logic [1:0] ResultSrcM,
    input logic [31:0] ALUResultM,
    input logic [31:0] RD,
    input logic [4:0] RdM,
    input logic [31:0] PCPlus4M,
    
    output logic RegWriteW,
    output logic [1:0] ResultSrcW,
    output logic [31:0] ALUResultW,
    output logic [31:0] ReadDataW,
    output logic [4:0] RdW,
    output logic [31:0] PCPlus4W
    );


always_ff @(posedge clk, posedge reset)
    if(reset)begin
    RegWriteW <= 0;
    ResultSrcW <= 0;
    ALUResultW <= 0;
    ReadDataW <= 0;
    RdW <= 0;
    PCPlus4W <= 0;
    end
    
    else begin
    RegWriteW <= RegWriteM;
    ResultSrcW <= ResultSrcM;
    ALUResultW <= ALUResultM;
    ReadDataW <= RD;
    RdW <= RdM;
    PCPlus4W <= PCPlus4M;
    end
endmodule