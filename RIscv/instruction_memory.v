module instruction_memory( clk,RD_Address,data_out );
input clk;
parameter n=63;
input wire [n:0] RD_Address;
output reg[31:0] data_out ;
integer i =0;
reg [31:0]mem[1023:0];

initial begin
for(i=0;i<1024;i=i+3)
 begin
   mem[i] = 32'b00000001010110100000010010110011;
   mem[i+1] = 32'b00000001010110100011010010110011;
   mem[i+2] = 32'b00000001010110100011110010110011;
 end
end

always@(posedge clk)
  begin
   data_out =mem[RD_Address];
  end

endmodule