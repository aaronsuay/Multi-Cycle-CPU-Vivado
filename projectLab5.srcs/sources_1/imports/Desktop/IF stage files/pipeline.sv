
module pipeline ();


  logic        clk;
  logic        reset;

  //logic [31:0] WriteData, DataAdr;
 //logic        MemWrite;
  
  // initialize test
  initial
    begin
      reset <= 1; # 5; reset <= 0;
    end

  // generate clock to sequence tests
  always
    begin
      clk <= 1; # 5; clk <= 0; # 5;
    end



//~~~~~~~~~~~~~~~~~iFetch Module~~~~~~~~~~~~~~~~~~~~~~

  logic [31:0] InstrD,PCD,PCPlus4D;
  logic PCSrcE;
  logic [31:0]PCTargetE;


  ifetch ifetch1(clk, reset,PCSrcE,PCTargetE,InstrD,PCD,PCPlus4D); 

   initial begin      
    PCSrcE <= 0;    
    PCTargetE <= 0;      
   end                    


//~~~~~~~~~~~~~~~iDecode Module~~~~~~~~~~~~~~~~~~~~~~~~
   // logic [31:0] InstrD;
    // logic [31:0] PCD, PCPlus4D;
    logic RegWriteW;
    logic [31:0] ResultW;
    logic [4:0] RdW;
    
    logic [31:0] RD1E, RD2E;
    logic [31:0] PCE;
    logic [4:0] RdE;
    logic [31:0] ImmExtE;
    logic [31:0] PCPlus4E;
    logic RegWriteE, MemWriteE, JumpE, BranchE, ALUSrcE;
    logic [1:0] ResultSrcE;
    logic [2:0] ALUControlE;
    
    idecode idecode(clk, reset, InstrD, PCD, PCPlus4D, RegWriteW, RdW, ResultW, PCE, RdE, ImmExtE, PCPlus4E, RD1E, RD2E, RegWriteE, MemWriteE, JumpE, BranchE, ALUSrcE,
    ResultSrcE,  ALUControlE);
    
    initial begin
        InstrD <= 0;
        PCD <= 0;
        PCPlus4D <=0;
        RegWriteW <=0;
        ResultW <=0;
        RdW <=0;
        
    end
    
//~~~~~~~~~~~~~~~~~~~~iexecute module~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    logic RegWriteM;
    logic [1:0] ResultSrcM;
    logic MemWriteM;
    logic [31:0] ALUResultM;
    logic [31:0] WriteDataM;
    logic [4:0] RdM;
    logic [31:0] PCPlus4M;
    
    
    iexecute iexecute(clk, reset, RegWriteE, ResultSrcE, MemWriteE, JumpE, BranchE, ALUSrcE, ALUControlE, RD1E, RD2E, PCE, RdE, ImmExtE, PCPlus4E, 
    RegWriteM, ResultSrcM, MemWriteM, ALUResultM, WriteDataM, RdM, PCPlus4M, PCSrcE, PCTargetE );
    
    initial begin
        RegWriteE <= 0;
        ResultSrcE <= 0;
        MemWriteE <= 0;
        JumpE <= 0;
        BranchE <= 0;
        ALUSrcE <= 0;
        ALUControlE <= 0;
        RD1E <= 0;
        RD2E <= 0;
        PCE <= 0;
        RdE <= 0;
        ImmExtE <= 0; 
        PCPlus4E <= 0;
        //PCTargetE <=0;
        end
//~~~~~~~~~~~~~~~~~~~~~~~~imemory module~~~~~~~~~~~~~~~~~~~~~~~~

   // logic RegWriteW;
    logic [1:0] ResultSrcW;
    logic [31:0] ALUResultW;
    logic [31:0] ReadDataW;
  //  logic [4:0] RdW;
    logic [31:0] PCPlus4W;
     imemory imemory(clk, reset, RegWriteM, ResultSrcM, MemWriteM, ALUResultM, WriteDataM, RdM, PCPlus4M,
     RegWriteW, ResultSrcW, ALUResultW, ReadDataW, RdW, PCPlus4W );
     
     initial begin
     RegWriteM <= 0;
     ResultSrcM <= 0;
     MemWriteM <= 0;
     ALUResultM <= 0;
     WriteDataM <= 0;
     RdM <= 0;
     PCPlus4M <= 0;
     
     
     end
//~~~~~~~~~~~~~~~~~~~~~~~write back~~~~~~~~~~~~~~~~~~~~~~~~~~~~

    iwriteback iwriteback(clk, reset, ResultSrcW, ALUResultW, ReadDataW, PCPlus4W, ResultW);
    
    initial begin
    ResultSrcW <= 0;
    ALUResultW <= 0;
    ReadDataW <= 0;
    PCPlus4W <= 0;
    end
endmodule // pipeline
