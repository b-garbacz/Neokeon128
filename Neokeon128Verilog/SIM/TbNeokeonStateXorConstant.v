module TbNeokeonStateXorConstant;

/////////////////////////////////////////

parameter inClkp = 10;

/////////////////////////////////////////

reg         inClk         = 1'b0;

always
begin
    #(inClkp/2) inClk = !inClk;
end

////////////////////////////////////////

reg		[127:0]		inDataState = 128'b0;
reg		[31:0]		constant1 = 32'b0;
wire 		[127:0]		outDataState;


NeokeonStateXorConstant neokeonStateXorConstant(
		.inDataState (inDataState ),
		.constant1(constant1),
		.outDataState(outDataState));




always
begin
	
	#(inClkp);
	constant1 = 32'h0080 & 32'h00ff;
	inDataState = 128'h2a78429b87c7d0924f26113f1d1349b2;
	$stop;

end

endmodule