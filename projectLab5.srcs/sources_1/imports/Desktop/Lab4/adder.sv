//////////////////////////////////////////////////////////////////////////////////
// Module Name: adder.sv
// Description: Module for obtaining the summation of two 32bit inputs
//              One 32bit Output
//     Author:  Aaron Suay
// Create Date: 05/17/2024 
// 
//////////////////////////////////////////////////////////////////////////////////

module adder(input  [31:0] a, b,
             output [31:0] y);

  //add a to b
 assign y = a + b;
  
endmodule