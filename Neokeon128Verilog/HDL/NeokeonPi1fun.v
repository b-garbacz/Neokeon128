// Moduł kombinacyjny wykonujacy funkcje P1

module NeokeonPi1fun(
	input wire [127:0] inDataState, //Wejscie Stanu 128 bitowe magistrali danych
	output wire [127:0] outDataState //Wyjscie Stanu 128 bitowe magistrali danych
);
// funkcja sprawdzona, testbench prawidlowy z implementacja software
wire [31:0] inA0;
wire [31:0] inA1;
wire [31:0] inA2;
wire [31:0] inA3;


wire [31:0] outA0;
wire [31:0] outA1;
wire [31:0] outA2;
wire [31:0] outA3;


assign   inA0 = inDataState[127:96];
assign   inA1 = inDataState[95:64];
assign   inA2 = inDataState[63:32];
assign   inA3 = inDataState[31:0];

assign outA0 = inA0;

NeokeonROTL32by1fun neokeonROTL32by1fun(
						.inDataWord(inA1),
						.outputData(outA1));
	
	
NeokeonROTL32by5fun neokeonROTL32by5fun(
						.inDataWord(inA2),
						.outputData(outA2));

						
NeokeonROTL32by2fun neokeonROTL32by2fun(
						.inDataWord(inA3),
						.outputData(outA3));
						
						

assign outDataState = {outA0,outA1,outA2,outA3};


endmodule
