module TbNeokeonPi2fun;

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

NeokeonPi2fun neokeonPi2fun(
		.inDataState(inDataState),
		.outDataState(outDataState));




always
begin
	
	#(inClkp);
	inDataState = 128'h7aa93d4ece14b678b3d291bb05537ff4;	
	$stop;

end

endmodule