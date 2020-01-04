module alu(
    input [31:0] in1,
    input [31:0] in2,
    input [3:0] alucon,
    output reg [31:0] out,
    output zero
    );
	assign zero = (out == 0);
	always @(*) begin
		case (alucon)
			2 : out <= in1 + in2; //ADD
			3 : out <= in1 - in2; //SUB
			1 : out <= in1 | in2; //OR
			0 : out <= in1 & in2; //AND
			default: out <= 32'h00000000;
		endcase
		end
endmodule