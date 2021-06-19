module TbNeokeonThetafun;

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
wire 		[127:0]		outDataState;

NeokeonThetafun neokeonThetafun(
		.inDataKey(inDataKey),
		.inDataState(inDataState),
		.outDataState(outDataState));




always
begin
	
	#(inClkp);
	inDataKey =   128'hb1656851699e29fa24b70148503d2dfc;
	inDataState = 128'h2a78429b87c7d0924f26113f1d1349b2;	
	$stop;

end

endmodule