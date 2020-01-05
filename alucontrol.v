module alucontrol(
    input [1:0] aluop,
    input [6:0] funct7,
    input [2:0] funct3,
    output reg [3:0] alucon
    );

always @(*)
begin
	case (aluop)
		2'b10: begin //ALU
				alucon[0]<=funct3[0];
				 alucon[1]<=funct3[1];
				 alucon[2]<=funct3[2];
				 alucon[3]<=funct7[5];end

endmodule