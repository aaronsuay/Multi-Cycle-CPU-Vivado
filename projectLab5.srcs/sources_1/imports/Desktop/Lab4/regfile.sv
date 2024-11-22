module regfile(input  logic        clk, 
               input  logic        WE3, 
               input  logic [ 4:0] A1, A2, A3, 
               input  logic [31:0] WD3, 
               output logic [31:0] RD1D, RD2D);

  logic [31:0] rf[31:0];
  integer i;
  
  initial begin
          for (i = 0; i < 32; i = i + 1)
                rf[i] <= 0;
  end

  // three ported register file
  // read two ports combinationally (A1/RD1, A2/RD2)
  // write third port on rising edge of clock (A3/WD3/WE3)
  // register 0 hardwired to 0
    //assign RD1D = (A1 !=0)? rf[A1]:0;
    //assign RD2D = (A2 !=0)? rf[A2]:0;
    
  always_ff @(posedge clk)
    //
    begin
    if (WE3)
        rf[A3] <= WD3;
    end

    assign RD1D = (A1 !=0)? rf[A1]:0;
    assign RD2D = (A2 !=0)? rf[A2]:0;
;

  
endmodule