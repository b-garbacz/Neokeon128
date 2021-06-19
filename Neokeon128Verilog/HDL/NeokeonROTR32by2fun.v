//Moduł Kombinacyjny wykonujący ROTR o 2 bity.

module NeokeonROTR32by2fun(
	input wire [31:0] inDataWord, //Wejscie 32 bitowe magistrali danych
	output wire [31:0] outputData //Wyjscie 32 bitowe magistrali danych
);


assign outputData = {inDataWord[1:0],inDataWord[31:2]};
endmodule