//////////////////////////////////////////////////////////////////////////////////
// File Name: if_id.sv
// Description: This is a pipeline register for the Instruction Fetch (IF) and
//              the Instruction Decode (ID) stages. It holds values for the instruction(Instr),
//              program counter(PC), and the target address for the next instruction (PCPlus4)
//              -Sends it from IF to ID on the positive edge of the clock
// Author: Aaron Suay
// Create Date: 05/17/2024
// 
//////////////////////////////////////////////////////////////////////////////////


module if_id (
  
   input logic clk, reset,
   input logic [31:0] InstrF,   // Input of IF/ID Instruction Register
                      PCF,      // Input of IF/ID NPC Register
				      PCPlus4F, // Input of IF/ID for Jump target address
   output logic [31:0] InstrD,      // Output of IF/ID Instruction Register
                       PCD,         // Output of IF/ID NPC Register
					   PCPlus4D     // Output of IF/ID for Jump target address
   );
  
  always_ff @(posedge clk, posedge reset)
    if (reset) begin
		PCD <= 0;
		InstrD <=0;
		PCPlus4D <=0;
	end
	else begin
		PCD <= PCF;
		InstrD <=InstrF;
		PCPlus4D <=PCPlus4F;
	
	end
	
endmodule 