//Moduł kombinacyjny wykonujacy warstwe konfuzji

module NeokeonGammafun(
	input wire [127:0] inDataState, //Wejscie Stanu  128 bitowe magistrali danych
	output wire [127:0] outDataState //Wyjscie Stanu  128 bitowe magistrali danych
);

// funkcja sprawdzona, testbench prawidlowy z implementacja software
// Wejscia stanu po 32 bity

//deklaracja wejsc dla F.FirstNonLinearFun -> pierwsza nieliniowa transformacja state
wire [127:0] NeokeonGammaFirstNonLinear1funInData;
wire [127:0] NeokeonGammaFirstNonLinear1funOutData;

////deklaracja wejsc dla F.SecondLinearFun -> liniowa transformacja state
wire [127:0] NeokeonGammaSecondLinearfunInData;
wire [127:0] NeokeonGammaSecondLinearfunOutData;

//deklaracja wejsc dla F.FirstNonLinearFun -> druga nieliniowa transformacja state
wire [127:0] NeokeonGammaFirstNonLinear2funInData;
wire [127:0] NeokeonGammaFirstNonLinear2funOutData;


NeokeonGammaFirstNonLinearfun neokeonGammaFirstNonLinear1fun(
		.inDataState (NeokeonGammaFirstNonLinear1funInData),
		.outDataState(NeokeonGammaFirstNonLinear1funOutData));

NeokeonGammaSecondLinearfun neokeonGammaSecondLinearfun(
		.inDataState (NeokeonGammaSecondLinearfunInData),
		.outDataState(NeokeonGammaSecondLinearfunOutData));

NeokeonGammaFirstNonLinearfun neokeonGammaFirstNonLinear2fun(
		.inDataState (NeokeonGammaFirstNonLinear2funInData),
		.outDataState(NeokeonGammaFirstNonLinear2funOutData));
		
assign NeokeonGammaFirstNonLinear1funInData = inDataState;	
assign NeokeonGammaSecondLinearfunInData	= NeokeonGammaFirstNonLinear1funOutData;
assign NeokeonGammaFirstNonLinear2funInData = NeokeonGammaSecondLinearfunOutData; 
assign outDataState = NeokeonGammaFirstNonLinear2funOutData;
endmodule