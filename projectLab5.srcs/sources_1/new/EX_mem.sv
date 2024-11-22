`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/08/2023 03:10:28 PM
// Design Name: 
// Module Name: EX_mem
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


module EX_mem(
    input logic clk, reset,
    input logic RegWriteE,
    input logic [1:0] ResultSrcE,
    input logic MemWriteE,
    input logic [31:0]ALUResultE,
    input logic [31:0]RD2E,
    input logic [4:0]RdE,
    input logic [31:0] PCPlus4E,
    
    output logic RegWriteM,
    output logic [1:0] ResultSrcM,
    output logic MemWriteM,
    output logic [31:0]ALUResultM,
    output logic [31:0] WriteDataM,
    output logic [4:0] RdM,
    output logic [31:0] PCPlus4M
    
    );
    
always_ff @(posedge clk, posedge reset)
    
    if(reset)begin
    RegWriteM <= 0;
    ResultSrcM <= 0;
    MemWriteM <= 0;
    ALUResultM <= 0;
    WriteDataM <= 0;
    RdM <= 0;
    PCPlus4M <= 0;
    end
    
    else begin
    RegWriteM <= RegWriteE;
    ResultSrcM <= ResultSrcE;
    MemWriteM <= MemWriteE;
    ALUResultM <= ALUResultE;
    WriteDataM <= RD2E;
    RdM <=RdE;
    PCPlus4M <= PCPlus4E;
    end
endmodule
