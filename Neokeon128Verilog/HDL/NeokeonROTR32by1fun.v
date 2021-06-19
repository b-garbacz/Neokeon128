//Moduł Kombinacyjny wykonujący ROTR o 1 bity.
module NeokeonROTR32by1fun(
	input wire [31:0] inDataWord, //Wejscie 32 bitowe magistrali danych
	output wire [31:0] outputData //Wyjscie 32 bitowe magistrali danych
);


assign outputData = {inDataWord[0],inDataWord[31:1]};
endmodule
