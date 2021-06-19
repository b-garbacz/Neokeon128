//Moduł sterujący

module NeokeonControl (
input   wire        inClk,					// wejście sygnału zegarowego, aktywne zboczem narastającym
input   wire        inExtKeyWr,				// wejście sygnału zapisu klucza głównego alogorytmy, aktywne poziomem wysokim
input   wire        inExtDataWr,			// wejście sygnału zapisu danych do przetwarzania w algorytmie (tekstu jawnego), aktywne poziomem wysokim
output  wire        outIntKeyschRegExtWr,	// wyjście sygnału zapisu klucza głównego algorytmu do rejestru klucza poprzez interfejs Ext, aktywne poziomem wysokim
output  wire        outIntKeyschRegIntWr,	// wyjście sygnału zapisu klucza głównego algorytmu do rejestru klucza poprzez interfejs Int, aktywne poziomem wysokim
output  wire        outIntRoundRegExtWr,	// wyjście sygnału zapisu danych przetwarzanych w algorytmie do rejestru rundy poprzez interfejs Ext, aktywne poziomem wysokim
output  wire        outIntRoundRegIntWr,	// wyjście sygnału zapisu danych przetwarzanych w algorytmie do rejestru rundy poprzez interfejs Int, aktywne poziomem wysokim
output  wire        outIntDataOutRegWr,		// wyjście sygnału zapisu danych przetwarzanych w algorytmie do rejestru wyjściowego, aktywne poziomem wysokim
output  wire        outBusy					// wyjście sygnału zajętości układu, aktywne poziomem wysokim
);

reg [7:0] regCounter = 8'd0;

always @ (posedge(inClk))
begin
		if (inExtDataWr == 1'b1 || regCounter != 8'd0) begin
			if(regCounter != 8'd17) begin
				regCounter <= regCounter + 8'd1;
			end else begin
				regCounter <= 8'd0;	
			end
		end
end

//Klucz główny można wprowadzać tylko, gdy układ nie pracuje
assign outIntKeyschRegExtWr = (regCounter == 8'd0) ? inExtKeyWr : 1'b0;

//Klucze rundowe generowane są w każdym takcie zegara, w którym pracuje koprocesor
assign outIntKeyschRegIntWr = (regCounter == 8'd0) ? 1'b0 : 1'b1;

//Dane do przetwarzania można wprowadzać tylko, gdy układ nie pracuje
assign outIntRoundRegExtWr = (regCounter == 8'd0) ? inExtDataWr : 1'b0;

//Dane przetwarzane są w każdym takcie zegara, w którym pracuje koprocesor
assign outIntRoundRegIntWr = (regCounter == 8'd0) ? 1'b0 : 1'b1;

//Dane do rejestru wyjściowego wpisywane są w ostatnim takcie zegara, w którym pracuje koprocesor
assign outIntDataOutRegWr = (regCounter == 8'd17) ? 1'b1 : 1'b0;

//Koprocesor jest w stanie zajętym, gdy przetwarza dane
assign outBusy = (regCounter == 8'd0) ? 1'b0 : 1'b1;

endmodule