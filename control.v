 
module Controler(clk,instruction,ALUop,RegWrite,MemRead,MemWrite,MemToReg,ALUSrc,Branch);
  
  input clk;
  input [6:0] instruction ;
  output reg RegWrite,MemRead,MemWrite,MemToReg,ALUSrc,Branch;
  output reg [1:0] ALUop;
  
  
  always@(posedge clk)
  case(instruction)
    
    7'b0110011 :begin
         ALUop = 2;
         RegWrite = 1;
         MemRead = 0;
         MemWrite = 0;
         MemToReg = 0;
         ALUSrc = 0;
         Branch = 0;
        end 
        
    7'b0000011 : begin
        ALUop = 0;
        RegWrite = 1;
        MemRead = 1;
        MemWrite = 0;
        MemToReg = 1;
        ALUSrc = 1;
        Branch = 0;
        end
        
    7'b0100011 :begin
        ALUop = 0;
        RegWrite = 0;
        MemRead = 0;
        MemWrite = 1;
        MemToReg = 1'bx;
        ALUSrc = 1;
        Branch = 0;
        end
        
    7'b1100011 :begin
         ALUop = 1;
         RegWrite = 0;
         MemRead = 0;
         MemWrite = 0;
         MemToReg = 1'bx;
         ALUSrc = 0;
         Branch = 1;
        end
  endcase
    
endmodule