module immgen(clk,instruction,immgenout);
  
  input wire [31:0]instruction;
  input clk;
  output reg [63:0]immgenout;
    
  
  always@(posedge clk)
     case(instruction[6:0])
       7'b0000011: 
 		immgenout = {{52{instruction[31]}}, instruction[31:20]};

       7'b0100011: 
		immgenout = {{52{instruction[31]}}, instruction[31:25], instruction[11:7]};

       7'b1100011: 
		immgenout = {{52{instruction[31]}}, instruction[12], instruction[7], instruction[30:25], instruction[11:8]};

       7'b1101111: 		
		immgenout = {{44{instruction[31]}},  instruction[20:12], instruction[21], instruction[30:22]};


     endcase
   
   endmodule