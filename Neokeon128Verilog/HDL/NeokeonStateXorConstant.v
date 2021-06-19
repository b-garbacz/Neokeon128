module NeokeonStateXorConstant(
	input wire [127:0] inDataState,
	input wire [31:0] constant,
	output wire [127:0] outDataState
);
// funkcja sprawdzona, testbench prawidlowy z implementacja software

wire [31:0] inA0;
wire [31:0] inA1;
wire [31:0] inA2;
wire [31:0] inA3;

wire [31:0] inA0XorConstant1;

assign   inA0 = inDataState[127:96];
assign   inA1 = inDataState[95:64];
assign   inA2 = inDataState[63:32];
assign   inA3 = inDataState[31:0];



assign inA0XorConstant1 = inA0 ^ constant;

assign outDataState ={inA0XorConstant1, inA1, inA2, inA3};

endmodule