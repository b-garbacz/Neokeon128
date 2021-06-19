module TbNeokeonRC12fun;

/////////////////////////////////////////

parameter inClkp = 10;

/////////////////////////////////////////

reg         inClk         = 1'b0;

always
begin
    #(inClkp/2) inClk = !inClk;
end

////////////////////////////////////////

reg		[7:0]		constant1 = 8'b0;
reg		[7:0]		constant2 = 8'b0;
wire 		[7:0]		outData1;
wire 		[7:0]		outData2;

NeokeonRC12fun neokeonRC12fun(
		.constant1(constant1),
		.constant2(constant2),
		.outData1(outData1),
		.outData2(outData2));




always
begin
	
	#(inClkp);
	constant1 = 8'h80 & 8'hff;
	constant2 = 8'hd4 & 8'hff;	
	$stop;

end

endmodule