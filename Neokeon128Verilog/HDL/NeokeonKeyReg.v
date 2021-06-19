//Moduł pamięciowy przechowujacy główny klucz algorytmu blokowego i stałych rundowych

module NeokeonKeyReg (
input   wire          	inClk,			//wejście sygnału zegarowego, aktywne zboczem narastającym sygnału
input   wire          	inExtWr,		//wejscie sygnału zapisu danych z interfejsu Ext, aktywne poziomem wysokim
input   wire 				inIntWr,
input   wire [31:0]		inIntRC,
input   wire [127:0]  	inExtData,	
output  wire [31:0]     outRC,
output  wire [127:0]  	outData	//128-bitowe wejście magistrali danych pierwszego klucza interfejsu Ext 

);

reg [127:0] regKey;		//rejestr klucza - służy do przechowywania klucza głównego algorytmu lub dwóch kolejnych kluczy rundowych
reg [31:0 ] regRC;

always@(posedge(inClk))
begin
	if (inExtWr == 1'b1) begin
		regKey <= inExtData;
		regRC <= 8'h80;
	end
	else if (inIntWr == 1'b1) begin
		regRC <= inIntRC;
	end
end

assign outData = regKey;		//wyjście pierwszego klucza podłączone jest do mniej znaczącej części rejestru regData
assign outRC		= regRC;

endmodule