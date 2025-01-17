module alu(input  logic [31:0] a, b,
           input  logic [2:0]  ALUControlE,
           output logic [31:0] ALUResultE,
           output logic        ZeroE);

  logic [31:0] condinvb, sum;
  logic        v;              // overflow
  logic        isAddSub;       // true when is add or subtract operation

  assign condinvb = ALUControlE[0] ? ~b : b;
  assign sum = a + condinvb + ALUControlE[0];
  assign isAddSub = ~ALUControlE[2] & ~ALUControlE[1] |
                    ~ALUControlE[1] & ALUControlE[0];

  always_comb
    case (ALUControlE)
      //
     3'b000:ALUResultE = sum;
      
     3'b001: ALUResultE = sum;
       
     3'b101: ALUResultE = (a < b)? 1:0 ;
      
     3'b011: ALUResultE = a | b;
      
     3'b010: ALUResultE = a & b;
      
    endcase

  assign zero =(ALUResultE == 0)? 1:0; //
  assign v = ~(ALUControlE[0] ^ a[31] ^ b[31]) & (a[31] ^ sum[31]) & isAddSub;
  
endmodule