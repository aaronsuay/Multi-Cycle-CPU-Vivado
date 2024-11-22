`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/03/2023 02:38:40 PM
// Design Name: 
// Module Name: iexecute
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


module iexecute(
    input logic clk, reset,
    input logic RegWriteE,
    input logic [1:0] ResultSrcE,
    input logic MemWriteE, JumpE, BranchE, ALUSrcE,
    input logic [2:0] ALUControlE,
    input logic [31:0] RD1E, RD2E, 
    input logic [31:0] PCE,
    input logic [4:0] RdE,
    input logic [31:0] ImmExtE, PCPlus4E,
   
    
    output logic RegWriteM,
    output logic [1:0] ResultSrcM,
    output logic MemWriteM,
    output logic [31:0] ALUResultM, 
    output logic [31:0] WriteDataM,
    output logic [4:0] RdM,
    output logic [31:0] PCPlus4M,
    output logic PCSrcE,
    output logic [31:0] PCTargetE
    
    );
 
logic [31:0] SrcBE;
logic [31:0] ALUResultE;
logic ZeroE;
//logic WriteDataE;
//logic BranchAndZero;
//assign BranchAndZero = ZeroE & BranchE;
//assign PCSrcE = BranchAndZero | JumpE;
//logic P

adder adder(PCE, ImmExtE, PCTargetE );
mux2 mux2(RD2E, ImmExtE, ALUSrcE, SrcBE);
alu alu(RD1E, SrcBE, ALUControlE, ALUResultE , ZeroE );
EX_mem EX_mem(clk, reset, RegWriteE, ResultSrcE, MemWriteE, ALUResultE, RD2E, RdE, PCPlus4E,
RegWriteM, ResultSrcM, MemWriteM, ALUResultM, WriteDataM, RdM, PCPlus4M );
PCSE PCSE(ZeroE, JumpE, BranchE, PCSrcE);

endmodule

