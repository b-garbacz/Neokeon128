module TbNeokeonROTR32by8fun;

/////////////////////////////////////////

parameter inClkp = 10;

/////////////////////////////////////////

reg         inClk         = 1'b0;

always
begin
    #(inClkp/2) inClk = !inClk;
end

////////////////////////////////////////

reg		[31:0]		inDataWord = 32'b0;
wire 		[31:0]		outputData;

NeokeonROTR32by8fun neokeonROTR32by8fun(
		.inDataWord(inDataWord),
		.outputData(outputData));




always
begin
	
	#(inClkp);
	inDataWord = 32'h00800080;	
	$stop;

end

endmodule