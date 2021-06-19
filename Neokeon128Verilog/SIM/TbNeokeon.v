module TbNeokeon;
/////////////////////////////////////////

parameter inClkp = 10;

/////////////////////////////////////////

reg         inClk         = 1'b0;

always
begin
    #(inClkp/2) inClk = !inClk;
end

////////////////////////////////////////
reg		[127:0]		inData = 128'b0;
reg				inDataWr = 1'b0;
reg		[127:0]		inKey = 128'b0;
reg				inKeyWr	= 1'b0;
wire 		[127:0]		outData;
wire				outBusy;

reg	[127:0]	Key  = 128'hb1656851699e29fa24b70148503d2dfc;
reg	[127:0]	Data = 128'h2a78421b87c7d0924f26113f1d1349b2;



Neokeon neokeon(
		.inClk(inClk),
		.inData(Data),
		.inDataWr(inDataWr),
		.inKey(Key),
		.inKeyWr(inKeyWr),
		.outData(outData),
		.outBusy(outBusy));


always
begin
	inKeyWr 	= 1'b1;
	inKey  		= Key;
	inDataWr 	= 1'b1;
	inData          = Data;
	#(inClkp);
	inKeyWr 	= 1'b0;
	inKey 		= 128'b0;
	inDataWr 	= 1'b0;
	inData 	= 128'b0;
	#(inClkp);
	wait(outBusy == 1'b0 && inClk == 1'b0);
	$stop;

end

endmodule