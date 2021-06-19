//Moduł Kombinacyjny wykonujący ROTL o 8 bitów.

module NeokeonROTL32by8fun(
	input wire [31:0] inDataWord, //Wejscie 32 bitowe magistrali danych
	output wire [31:0] outputData //Wyjscie 32 bitowe magistrali danych
);
//test z tb przeszedl prawidlowo


assign outputData = {inDataWord[23:0],inDataWord[31:24]};


endmodule