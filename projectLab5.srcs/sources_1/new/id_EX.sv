`timescale 1ns / 1ps


module id_EX(
        input logic clk, reset,
        input logic [31:0] PCD, 
        input logic [4:0] RdD, 
        input logic [31:0] ImmExtD, 
        input logic [31:0] PCPlus4D,
        input logic [31:0] RD1D, RD2D,
        input logic RegWriteD, MemWriteD, JumpD, BranchD, ALUSrcD,
        input logic [1:0] ResultSrcD,
        input logic [2:0] ALUControlD,
        output logic [31:0] PCE, 
        output logic [4:0] RdE, 
        output logic [31:0] ImmExtE, 
        output logic [31:0] PCPlus4E, 
        output logic [31:0] RD1E, RD2E,
        output logic RegWriteE, MemWriteE, JumpE, BranchE,ALUSrcE,
        output logic [1:0]ResultSrcE,
        output logic [2:0] ALUControlE
    );
    
always_ff@(posedge clk, posedge reset)

    if(reset) begin
    PCE <= 0;
    RdE <= 0;
    ImmExtE <= 0;
    PCPlus4E <= 0;
    RD1E <= 0;
    RD2E <= 0;
    RegWriteE <= 0;
    MemWriteE <= 0;
    JumpE <= 0;
    BranchE <= 0;
    ALUSrcE <= 0;
    ResultSrcE <= 0;
    ALUControlE <= 0;
    end 
    else begin
    RD1E <= RD1D;
    RD2E <= RD2D;
    PCE <= PCD;
    RdE <= RdD;
    ImmExtE <= ImmExtD;
    PCPlus4E <= PCPlus4D;
    RegWriteE  <= RegWriteD;
    ResultSrcE <= ResultSrcD;
    MemWriteE <= MemWriteD;
    JumpE <= JumpD;  
    BranchE <= BranchD;
    ALUControlE <= ALUControlD;
    ALUSrcE <= ALUSrcD; 
       
    
    end
    


endmodule
