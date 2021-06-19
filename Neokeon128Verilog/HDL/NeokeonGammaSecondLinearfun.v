module NeokeonGammaSecondLinearfun(
	input wire [127:0] inDataState,
	output wire [127:0] outDataState
);

wire [31:0] inA0;
wire [31:0] inA1;
wire [31:0] inA2;
wire [31:0] inA3;

wire [31:0] inA2new;

assign   inA0 = inDataState[127:96];
assign   inA1 = inDataState[95:64];
assign   inA2 = inDataState[63:32];
assign   inA3 = inDataState[31:0];

assign inA2new = inA2 ^ inA3 ^ inA1 ^ inA0;

assign outDataState = {inA3, inA1, inA2new ,inA0 };

endmodule 