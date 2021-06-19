//Szyfrowanie

module Neokeon (
	input wire 			  inClk,
	input wire  [127:0] inData,
	input wire 			  inDataWr,
	input wire  [127:0] inKey,
	input wire 			  inKeyWr,
	output wire [127:0] outData,
	output wire 		  outBusy);
// TODO:Nie moge dodac assigments....juz dziala
wire ControlKeyRegExtWr;
wire ControlKeyRegIntWr;
wire ControlRoundRegExtWr;
wire ControlRoundRegIntWr;
wire ControlOutDataRegWr;

wire [127:0] KeyRegOutData;
wire [31:0]  KeyRegRC;


wire [127:0] RoundFullDataOut;

wire [127:0] RoundRegDataOut;

wire [127:0] RoundLastOut;

wire [31:0]  RC12funOut;

NeokeonKeyReg neokeonKeyReg(
				.inClk(inClk),
				.inExtWr(ControlKeyRegExtWr),
				.inIntRC(RC12funOut),
				.inIntWr(ControlKeyRegIntWr),
				.inExtData(inKey),
				.outRC(KeyRegRC),
				.outData(KeyRegOutData));

NeokeonRC12fun neokeonRC12fun(
				.constant1(KeyRegRC),
				.outData1(RC12funOut));

NeokeonControl neokeonControl(
				.inClk(inClk),
				.inExtKeyWr(inKeyWr),
				.inExtDataWr(inDataWr),
				.outIntKeyschRegExtWr(ControlKeyRegExtWr),
				.outIntKeyschRegIntWr(ControlKeyRegIntWr),
				.outIntRoundRegExtWr(ControlRoundRegExtWr),
				.outIntRoundRegIntWr(ControlRoundRegIntWr),
				.outIntDataOutRegWr(ControlOutDataRegWr),
				.outBusy(outBusy));


NeokeonRoundReg neokeonRoundReg(
				.inClk(inClk),
				.inExtWr(ControlRoundRegExtWr),
				.inIntWr(ControlRoundRegIntWr),
				.inExtData(inData),
				.inIntData(RoundFullDataOut),
				.outData(RoundRegDataOut));


NeokeonFullRoundfun neokeonFullRoundfun(
				.inDataKey(KeyRegOutData),
				.inDataState(RoundRegDataOut),
				.constant1(KeyRegRC),
				.constant2(),
				.outDataState(RoundFullDataOut));


NeokeonLastRoundfun neokeonLastRoundfun(
				.inDataKey(KeyRegOutData),
				.inDataState(RoundRegDataOut),
				.constant1(KeyRegRC),
				.constant2(),
				.outDataState(RoundLastOut));


NeokeonDataOutReg neokeonDataOutReg(
				.inClk(inClk),
				.inWr(ControlOutDataRegWr),
				.inData(RoundLastOut),
				.outData(outData));
	
endmodule
	