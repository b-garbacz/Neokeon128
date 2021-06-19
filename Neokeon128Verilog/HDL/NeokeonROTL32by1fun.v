//Moduł Kombinacyjny wykonujący ROTL o 1 bit.

module NeokeonROTL32by1fun(
	input wire [31:0] inDataWord, //Wejscie 32 bitowe magistrali danych
	output wire [31:0] outputData //Wyjscie 32 bitowe magistrali danych
);
//test z tb przeszedl prawidlowo


assign outputData = {inDataWord[30:0],inDataWord[31]};

endmodule
