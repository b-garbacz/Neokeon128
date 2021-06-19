module NeokeonLastRoundfun(
	input wire [127:0] inDataKey,
	input wire [127:0] inDataState,
	input	wire	[31:0]	constant1,	
   input	wire	[31:0]	constant2,
	output wire [127:0] outDataState
);

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


NeokeonStateXorConstant neokeonStateXorConstant1LastFun(
		.inDataState (NeokeonStateXorConstant1InData ),
		.constant(NeokeonStateXorConstant1Constant1),
		.outDataState(NeokeonStateXorConstant1OutData));


NeokeonThetafun neokeonThetafunLastFun(
		.inDataKey(NeokeonThetainDataKey),
		.inDataState(NeokeonThetainDataState),
		.outDataState(NeokeonThetaoutDataState));

	
NeokeonStateXorConstant neokeonStateXorConstant2LastFun(
		.inDataState (NeokeonStateXorConstant2InData ),
		.constant(NeokeonStateXorConstant2Constant2),
		.outDataState(NeokeonStateXorConstant2OutData));
		
assign NeokeonStateXorConstant1InData = inDataState;
assign NeokeonStateXorConstant1Constant1 = constant1;

assign NeokeonThetainDataKey = inDataKey;
assign NeokeonThetainDataState = NeokeonStateXorConstant1OutData;

assign NeokeonStateXorConstant2InData = NeokeonThetaoutDataState;
assign NeokeonStateXorConstant2Constant2 = 32'H0;

assign outDataState = NeokeonStateXorConstant2OutData;

endmodule