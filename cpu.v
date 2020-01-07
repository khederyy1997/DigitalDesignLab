module cpu();
wire clk ,RegWrite,MemRead,MemWrite,memtoreg,branch,alusrc,zero;
wire [63:0] aluout,dmout,pcout,muxtoregbank,muxtopc,immgen,muxtoalu,SLout,AdderToMuxOut,pcin,pctoadderout,rd1,rd2,adderinput;
wire [3:0] alucout;
wire [31:0]insMemOut;
wire [1:0] ALUop;
reg reset;

assign adderinput=4;

clock clock1(
	.clk(clk)
	);

pc pc_unit(.clk(clk), 
	.data_in(muxtopc) , 
	.pcout(pcout) , 
	.reset(reset) ,
	.write(1'b1)
	);

adder main_adder(
	.input_data_1(pcout),
	.input_data_2(adderinput),
	 .output_data(pctoadderout)
	 );

instruction_memory insMem(.clk(clk),
	.RD_Address(pcout),
	.data_out(insMemOut)
	);

Controler control_unit(
	  .clk(clk), 
	  .instruction(insMemOut[6:0]), 
      	.ALUop(ALUop),
	 .RegWrite(RegWrite), 
	 .MemRead(MemRead), 
	 .MemWrite(MemWrite), 
	 .MemToReg(memtoreg), 
	 .ALUSrc(alusrc), 
	 .Branch(branch));
 
immgen ig(
	.clk(clk), 
	.instruction(insMemOut), 
	.immgenout(immgen)
	); 
 
register_bank registers(
	 .clk(clk),
	 .instruction(insMemOut),
	 .MemtoRegMuxOutput(muxtoregbank), 
	 .RegWrite(RegWrite), 
	 .read_data_1(rd1), 
	 .read_data_2(rd2));

multiplexer alu_mux(
	  .input_data_1(immgen),
	  .input_data_2(rd2),
	  .input_select(alusrc),
	  .output_data(muxtoalu)
   );

alu_control aluc(
	.ALU_Cnt(alucout), 
	.ALUOp(ALUop), 
	.func7(insMemOut[31:25]), 
	.func3(insMemOut[14:12])
	);

shift_unit SL(
	.input_data(immgen), 
	.output_data(SLout)
	);

ALU alu(
	.read_data_1(rd1), 
	.read_data_2(muxtoalu), 
	.ALUcontrol(alucout), 
	.result(aluout), 
	.zero(zero)
	);

adder branch_adder(.input_data_1(pcout), 
	.input_data_2(SLout), 
	.output_data(AdderToMuxOut)
	);

data_memory dm( .addr(aluout), 
	.write_data(rd2), 
	.memwrite(MemWrite), 
	.memread(MemRead), .clk(clk) , 
	.read_data(dmout));

multiplexer register_back_mux(
	.input_data_1(dmout),
	.input_data_2(aluout),
	.input_select(memtoreg),
	.output_data(muxtoregbank)
	);  

multiplexer branch_mux(
   .input_data_1(AdderToMuxOut),
   .input_data_2(pctoadderout),
   .input_select(branch & zero),
   .output_data(pcin)
   );
 


initial begin
	 reset = 1;
	#30;
	 reset = 0;
  end



endmodule