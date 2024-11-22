`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/17/2023 06:54:44 PM
// Design Name: 
// Module Name: PCSE
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


module PCSE(
    input logic ZeroE, 
    input logic JumpE, 
    input logic BranchE,
    output logic PCSrcE
    );
    logic BranchAndZero;

    assign BranchAndZero = ZeroE & BranchE;
    assign PCSrcE = BranchAndZero | JumpE;
endmodule
