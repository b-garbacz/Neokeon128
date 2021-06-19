module TbNeokeonFullRoundfun;

/////////////////////////////////////////

parameter inClkp = 10;

/////////////////////////////////////////

reg         inClk         = 1'b0;

always
begin
    #(inClkp/2) inClk = !inClk;
end

////////////////////////////////////////
reg		[127:0]		inDataKey = 128'b0;
reg		[127:0]		inDataState= 128'b0;
reg		[31:0]		constant1 = 32'b0;
reg		[31:0]		constant2 = 32'b0;
wire 		[127:0]		outDataState;

NeokeonFullRoundfun neokeonFullRoundfun(
		.inDataKey(inDataKey),
		.inDataState(inDataState),
		.constant1(constant1),
		.constant2(constant2),
		.outDataState(outDataState));




always
begin
	
	#(inClkp);
	inDataKey =   128'hb1656851699e29fa24b70148503d2dfc;
	inDataState = 128'h2a78421b87c7d0924f26113f1d1349b2;
	constant1 = 32'h00000080 & 32'h000000ff;
	constant2 = 32'h00000000;
	$stop;

end

endmodule