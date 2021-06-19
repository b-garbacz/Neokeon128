module NeokeonFullRoundfun(
	input wire [127:0] inDataKey,
	input wire [127:0] inDataState,
	input	wire	[31:0]	constant1,	
   input	wire	[31:0]	constant2,
	output wire [127:0] outDataState
);
// funkcja sprawdzona, testbench prawidlowy z implementacja software

//deklaracja wejsc dla F.StateXorConstant1
wire [127:0] NeokeonStateXorConstant1InData;
wire [32:0]  NeokeonStateXorConstant1Constant1;
wire [127:0] NeokeonStateXorConstant1OutData;
//deklaracja wejsc dla F.theta
wire [127:0] NeokeonThetainDataKey;
wire [127:0] NeokeonThetainDataState;
wire [127:0] NeokeonThetaoutDataState;


//deklaracja wejsc dla F.StateXorConstant2
wire [127:0] NeokeonStateXorConstant2InData;
wire [32:0]  NeokeonStateXorConstant2Constant2;
wire [127:0] NeokeonStateXorConstant2OutData;


//deklaracja wejsc dla Pi1
wire [127:0] NeokeonPi1InDataState;
wire [127:0] NeokeonPi1OutDataState;

//deklaracja wejsc dla Gamma
wire [127:0] NeokeonGammaInDataState;
wire [127:0] NeokeonGammaOutDataState;

//deklaracja wejsc dla Pi2
wire [127:0] NeokeonPi2InDataState;
wire [127:0] NeokeonPi2OutDataState;



NeokeonStateXorConstant neokeonStateXorConstant1(
		.inDataState (NeokeonStateXorConstant1InData ),
		.constant(NeokeonStateXorConstant1Constant1),
		.outDataState(NeokeonStateXorConstant1OutData));


NeokeonThetafun neokeonThetafun(
		.inDataKey(NeokeonThetainDataKey),
		.inDataState(NeokeonThetainDataState),
		.outDataState(NeokeonThetaoutDataState));

	
NeokeonStateXorConstant neokeonStateXorConstant2(
		.inDataState (NeokeonStateXorConstant2InData ),
		.constant(32'h0),
		.outDataState(NeokeonStateXorConstant2OutData));
		
NeokeonPi1fun neokeonPi1fun(
		.inDataState(NeokeonPi1InDataState),
		.outDataState(NeokeonPi1OutDataState));

		
NeokeonGammafun neokeonGammafun(
		.inDataState(NeokeonGammaInDataState), 
		.outDataState(NeokeonGammaOutDataState)); 

		
NeokeonPi2fun neokeonPi2fun(
		.inDataState(NeokeonPi2InDataState),
		.outDataState(NeokeonPi2OutDataState));
		
assign NeokeonStateXorConstant1InData = inDataState;
assign NeokeonStateXorConstant1Constant1 = constant1;

assign NeokeonThetainDataKey = inDataKey;
assign NeokeonThetainDataState = NeokeonStateXorConstant1OutData;

assign NeokeonStateXorConstant2InData = NeokeonThetaoutDataState;
assign NeokeonStateXorConstant2Constant2 = constant2;

assign NeokeonPi1InDataState = NeokeonStateXorConstant2OutData;

assign NeokeonGammaInDataState = NeokeonPi1OutDataState;

assign NeokeonPi2InDataState = NeokeonGammaOutDataState;

assign outDataState = NeokeonPi2OutDataState;
endmodule