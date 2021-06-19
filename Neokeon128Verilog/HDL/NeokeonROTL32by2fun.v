//Moduł Kombinacyjny wykonujący ROTL o 2 bity.

module NeokeonROTL32by2fun(
	input wire [31:0] inDataWord, //Wejscie 32 bitowe magistrali danych
	output wire [31:0] outputData //Wyjscie 32 bitowe magistrali danych
);
//test z tb przeszedl prawidlowo


assign outputData = {inDataWord[29:0],inDataWord[31:30]};

endmodule