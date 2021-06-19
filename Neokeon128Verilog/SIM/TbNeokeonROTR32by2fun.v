module TbNeokeonROTR32by2fun;

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

NeokeonROTR32by2fun neokeonROTR32by2fun(
		.inDataWord(inDataWord),
		.outputData(outputData));




always
begin
	
	#(inClkp);
	inDataWord = 32'h1111aaaa;	
	$stop;

end

endmodule