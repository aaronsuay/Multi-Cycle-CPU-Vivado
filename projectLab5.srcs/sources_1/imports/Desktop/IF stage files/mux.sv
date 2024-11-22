//////////////////////////////////////////////////////////////////////////////////
// File Name: mux.sv
// Description: Contains a 2-1 multiplexer (mux2) and a 3-1 multiplexer (mux3).
//              These multiplexers are used across the processor to select between
//              multiple input signals based on selector values.
//              - mux2 selects between two 32-bit inputs based on a single-bit selector (s).
//              - mux3 selects among three 32-bit inputs based on a 2-bit selector (s[1:0]).
// Author: Aaron Suay
// Create Date: 05/17/2024
// 
//////////////////////////////////////////////////////////////////////////////////

// 2-1 Multiplexer
module mux2(input  logic [31:0] d0, d1, 
              input  logic       s, 
              output logic [31:0] y);

  // If s is true, assign d1 to y; otherwise, assign d0 to y.
  assign y = s ? d1 : d0;
endmodule

// 3-1 Multiplexer
module mux3(input  logic [31:0] d0, d1, d2,
              input  logic [1:0]       s, 
              output logic [31:0] y);

  // If s[1] is true, assign d2 to y.
  // Else, if s[0] is true, assign d1 to y.
  // Else (s == 2'b00), assign d0 to y.
  assign y = s[1] ? d2 : (s[0] ? d1 : d0); 
endmodule
