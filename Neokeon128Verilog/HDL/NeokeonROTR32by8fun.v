//Moduł Kombinacyjny wykonujący ROTR o 8 bitów.
module NeokeonROTR32by8fun(
	input wire [31:0] inDataWord, //Wejscie 32 bitowe magistrali danych
	output wire [31:0] outputData //Wyjscie 32 bitowe magistrali danych
);


assign outputData = {inDataWord[7:0],inDataWord[31:8]};
endmodule