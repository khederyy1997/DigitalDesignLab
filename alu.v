module ALU(clock,read_data_1,read_data_2,ALUcontrol,result,zero);
  
  input clock;
  input [63:0] read_data_1,read_data_2;
  wire [63:0] r1,r2;
  input [3:0] ALUcontrol;
  output reg [63:0] result;
  output reg zero;


always @ (read_data_1, read_data_2, ALUcontrol) 
   begin    
      case(ALUcontrol)
      
      4'b0000: result = read_data_1 & read_data_2;
         
      4'b0001: result = read_data_1 | read_data_2;
        
      4'b0010: result = read_data_1 + read_data_2;
        
      4'b0110: result = read_data_1 - read_data_2;
      
      endcase 
	assign zero =( result == 0) ? 1 : 0;
    end
endmodule