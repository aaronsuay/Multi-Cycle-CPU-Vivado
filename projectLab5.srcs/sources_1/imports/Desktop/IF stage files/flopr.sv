//////////////////////////////////////////////////////////////////////////////////
// File Name: flopr.sv
// Description: Contains a D-Flip Flop
//              Takes input (d) and on each positive edge of the clock
//              assigns it to output (q). 
//              (reset) is asynchronous so q is set to 0 as soon as reset goes high
//              regardless of the clock.
// Author: Aaron Suay
// Create Date: 05/17/2024
// 
//////////////////////////////////////////////////////////////////////////////////

module flopr #(parameter WIDTH = 8)
              (input  logic             clk, reset,
               input  logic [WIDTH-1:0] d, 
               output logic [WIDTH-1:0] q);

  always_ff @(posedge clk, posedge reset)
    if (reset) q <= 0;
    else       q <= d;
endmodule