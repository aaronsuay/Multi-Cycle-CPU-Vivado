
//////////////////////////////////////////////////////////////////////////////////
// Module Name: imem
// Description: Defines the instruction memory module for a RISC-V CPU.
//              Loads 32-bit instructions from a file and allows read-only
//              access for word-aligned addresses.
// 
//      Author: Aaron Suay 
// Create Date: 05/17/2024
// 
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 1ps
module imem(input  logic [31:0] a,
            output logic [31:0] rd);

  logic [31:0] RAM[63:0];

  initial
      $readmemh("riscvcode.txt",RAM);

  assign rd = RAM[a[31:2]]; // word aligned
endmodule