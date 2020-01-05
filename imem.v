module cpu_tb();
    reg clk, reset;
    wire [31:0] iaddr, idata;
    wire [31:0] daddr, drdata, dwdata;
    wire [3:0] we;

module imem(
    input [31:0] iaddr,
    output [31:0] idata
);
    reg [31:0] m[0:31];
    initial begin $readmemh("imem1_ini.mem",m); end

    assign idata = m[iaddr[31:2]];
	 
endmodule