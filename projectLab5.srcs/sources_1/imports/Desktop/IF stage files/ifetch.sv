//////////////////////////////////////////////////////////////////////////////////
// File Name: ifetch.sv
// Description: Contains all the logic for the Fetch stage of pipeline CPU
//              Links all of the sub components together, handles the logic of fetching an instruction, 
//              calculating the next PC value, and passing this information down the pipeline.
// Author: Aaron Suay
// Create Date: 05/17/2024
// 
//////////////////////////////////////////////////////////////////////////////////


//IF stage 
module ifetch (
   input  logic         clk, reset,
   input  logic         PCSrcE,
   input  logic  [31:0] PCTargetE,
   output logic  [31:0] InstrD,
   output logic  [31:0] PCD,PCPlus4D   
   );

   //signals
   logic [31:0] PCNext, PCF;
   logic [31:0] InstrF,PCPlus4F;

   //instantiations
   mux2  pcmux(PCPlus4F, PCTargetE, PCSrcE, PCNext); 

   //next PC logic
   flopr #(32) pcreg(clk, reset, PCNext, PCF); 
   adder       pcadd4(PCF, 32'd4, PCPlus4F);
  
   //Fetch next Instruction 
   imem imem1(PCF, InstrF);
  
   //Ifetch pipeline register
   if_id  if_id1  (clk, reset,InstrF, PCF,PCPlus4F,InstrD,PCD,PCPlus4D);

  
   initial begin
   //for debugging and simulation output
      $display("Time\t PCF\t PCD\t InstrF\t\t InstrD\t\t PCPlus4D");
      $monitor("%0d\t\t %0d\t\t %0d\t\t %h\t %h\t %h", $time, PCF, PCD, InstrF,InstrD,PCPlus4D);
      #210 $finish;
   end

endmodule 
