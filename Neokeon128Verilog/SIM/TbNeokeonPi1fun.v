module TbNeokeonPi1fun;

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

NeokeonPi1fun neokeonPi1fun(
		.inDataState(inDataState),
		.outDataState(outDataState));




always
begin
	
	#(inClkp);
	inDataState = 128'h6954e6d2713150fa99d8dc6fd246cddc;	
	$stop;

end

endmodule