//Moduł Kombinacyjny wykonujący ROTL o 5 bitów.

module NeokeonROTL32by5fun(
	input wire [31:0] inDataWord, //Wejscie 32 bitowe magistrali danych
	output wire [31:0] outputData //Wyjscie 32 bitowe magistrali danych
);
//test z tb przeszedl prawidlowo

assign outputData = {inDataWord[26:0],inDataWord[31:27]};


endmodule