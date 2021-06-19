//Moduł Kombinacyjny wykonujący ROTR o 5 bitów.
module NeokeonROTR32by5fun(
	input wire [31:0] inDataWord, //Wejscie 32 bitowe magistrali danych
	output wire [31:0] outputData //Wyjscie 32 bitowe magistrali danych
);


assign outputData = {inDataWord[4:0],inDataWord[31:5]};
endmodule