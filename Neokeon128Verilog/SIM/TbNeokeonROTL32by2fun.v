module TbNeokeonROTL32by2fun;

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

NeokeonROTL32by2fun neokeonROTL32by2fun(
		.inDataWord(inDataWord),
		.outputData(outputData));




always
begin
	
	#(inClkp);
	inDataWord = 32'h11111111;	
	$stop;

end

endmodule