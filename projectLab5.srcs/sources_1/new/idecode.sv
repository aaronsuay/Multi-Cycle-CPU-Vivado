`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/26/2023 02:43:17 PM
// Design Name: 
// Module Name: idecode
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


module idecode(
    input logic clk, reset,
    input logic [31:0] InstrD,
    input logic [31:0] PCD, PCPlus4D,
    input logic RegWriteW,
    input logic [4:0] RdW,
    input logic [31:0] ResultW,

    output logic [31:0] PCE,
    output logic [4:0] RdE,
    output logic [31:0] ImmExtE, PCPlus4E,
    output logic [31:0] RD1E, RD2E, 
    
    output logic RegWriteE, MemWriteE, JumpE, BranchE, ALUSrcE,
    output logic [1:0] ResultSrcE,
    output logic [2:0] ALUControlE
    
   
   
    

    ); 
    logic [31:0] RD1D, RD2D;
    logic RegWriteD;
    logic [1:0] ResultSrcD;
    logic MemWriteD, JumpD, BranchD;
    logic [2:0] ALUControlD;
    logic ALUSrcD;
    logic [1:0] ImmSrcD;
    logic [4:0] RdD;
    logic [31:0] ImmExtD;
    controller cntrl(InstrD[6:0],InstrD[14:12], InstrD[30], ResultSrcD, MemWriteD, ALUSrcD, RegWriteD, JumpD, BranchD, ImmSrcD, ALUControlD );
    regfile regfile(clk, RegWriteW, InstrD[19:15], InstrD[24:20], RdW, ResultW , RD1D, RD2D ); 
    extend extend(InstrD[31:7], ImmSrcD, ImmExtD);
    
    id_EX id_EX(clk, reset,PCD, InstrD[11:7], ImmExtD, PCPlus4D, RD1D, RD2D, RegWriteD, MemWriteD, JumpD, BranchD, ALUSrcD, ResultSrcD, ALUControlD, PCE, RdE, ImmExtE, PCPlus4E, RD1E, RD2E,
    RegWriteE, MemWriteE, JumpE, BranchE,ALUSrcE,ResultSrcE,ALUControlE);
    
endmodule
