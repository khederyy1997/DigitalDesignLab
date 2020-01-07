module pc(  clk , data_in , pcout , reset ,write);
input clk , reset,write;
parameter n=63;
input [n:0] data_in ;
output  reg [n:0]  pcout;
always @(posedge clk)
begin
    if(reset)
        pcout = 0 ;
    else
       if (write)
          pcout = data_in ;
end
endmodule