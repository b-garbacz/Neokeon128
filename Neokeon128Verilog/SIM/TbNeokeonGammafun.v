module TbNeokeonGammafun;

/////////////////////////////////////////

parameter inClkp = 10;

/////////////////////////////////////////

reg         inClk         = 1'b0;

always
begin
    #(inClkp/2) inClk = !inClk;
end

////////////////////////////////////////
reg		[127:0]		inDataState= 128'b0;
wire 		[127:0]		outDataState;

NeokeonGammafun neokeonGammafun(
		.inDataState(inDataState),
		.outDataState(outDataState));




always
begin
	
	#(inClkp);
	inDataState = 128'h6954e6d2e262a1f43b1b8df3491b3773;	
	$stop;

end

endmodule