module alu_control( ALU_Cnt, ALUOp,func7,func3);
 output reg[3:0] ALU_Cnt;
 input [1:0] ALUOp;
 input [6:0] func7;
 input [2:0] func3;
 wire [5:0] ALUControlIn;
 
 assign ALUControlIn = {ALUOp,func7,func3};
 
 always @(ALUControlIn)
 casex (ALUControlIn)
   12'b00xxxxxxxxxx: ALU_Cnt=4'b0010;
   12'b01xxxxxxxxxx: ALU_Cnt=4'b0110;
   12'b100000000000: ALU_Cnt=4'b0010;
   12'b100100000000: ALU_Cnt=4'b0110;
   12'b100000000111: ALU_Cnt=4'b0000;
   12'b100000000110: ALU_Cnt=4'b0001;
  default: ALU_Cnt=4'b0000;
  endcase
endmodule