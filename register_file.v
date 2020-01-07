module register_bank (instruction,MemtoRegMuxOutput, RegWrite, read_data_1, read_data_2,clk);
 
 input clk;
 reg [4:0] read_register_1,read_register_2,write_register;
 input [31:0]instruction;
 input [63:0]MemtoRegMuxOutput;
 input RegWrite;
 reg [31:0]ram[64:0];
 output [63:0]read_data_1,read_data_2;
 


integer i;
 initial begin  
	   for(i=0;i<256;i=i+1)  
			ram[i] <= i;  
      end  
 
 always@(posedge clk)
 begin
     assign read_register_1=instruction[19:15];
     assign read_register_2=instruction[24:20];
     assign write_register=instruction[11:7];
     if(RegWrite)
      ram[write_register] = MemtoRegMuxOutput;
   
 end
     assign read_data_1=ram[read_register_1];
     assign read_data_2=ram[read_register_2];
 endmodule  
  
  