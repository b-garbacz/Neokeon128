//Modul kombinacyjny wykonujący warstwe dyfuzji 

module NeokeonThetafun(
	input wire [127:0] inDataKey, //Wejscie kLUCZA  128 bitowe magistrali danych
	input wire [127:0] inDataState, //Wejscie Stanu  128 bitowe magistrali danych
	output wire [127:0] outDataState ////Wejscie Stanu  128 bitowe magistrali danych
);

// funkcja sprawdzona, testbench prawidlowy z implementacja software
//TODO: Rozdzielić ten moduł na pod moduły bo jest za dziki.
wire [31:0] inA0;
wire [31:0] inA1;
wire [31:0] inA2;
wire [31:0] inA3;

wire [31:0] inK0;
wire [31:0] inK1;
wire [31:0] inK2;
wire [31:0] inK3;


//buffory
wire [31:0] inA0prym;
wire [31:0] inA1prym;
wire [31:0] inA2prym;
wire [31:0] inA3prym;

//buffory2
wire [31:0] inA1prymprym;
wire [31:0] inA0prymprym;
wire [31:0] inA2prymprym;
wire [31:0] inA3prymprym;

//Kolejne buffory
wire [31:0] temp;
wire [31:0] tempRout;
wire [31:0] tempLout;

wire [31:0] temp2;
wire [31:0] tempRout2;
wire [31:0] tempLout2;

wire [31:0] temp3;

wire [31:0] temp4;




assign   inA0 = inDataState[127:96];
assign   inA1 = inDataState[95:64];
assign   inA2 = inDataState[63:32];
assign   inA3 = inDataState[31:0];

assign   inK0 = inDataKey[127:96];
assign   inK1 = inDataKey[95:64];
assign   inK2 = inDataKey[63:32];
assign   inK3 = inDataKey[31:0];

//////

assign temp = inA0 ^ inA2;

NeokeonROTR32by8fun neokeonROTR32by8fun(
						.inDataWord(temp),
						.outputData(tempRout));


NeokeonROTL32by8fun neokeonROTL32by8fun(
						.inDataWord(temp),
						.outputData(tempLout));
						
						
assign temp2 = temp ^ tempRout ^ tempLout;





assign inA1prym = inA1 ^ temp2;
assign inA3prym = inA3 ^ temp2;

//-----------------

assign inA0prym = 		inA0 ^ inK0;
assign inA1prymprym = 	inA1prym ^ inK1;
assign inA2prym = 		inA2 ^ inK2;
assign inA3prymprym = 	inA3prym ^ inK3;

//-----------------

assign temp3 = inA1prymprym ^ inA3prymprym;

NeokeonROTR32by8fun neokeonROTR32by8funn(
						.inDataWord(temp3),
						.outputData(tempRout2));


NeokeonROTL32by8fun neokeonROTL32by8funn(
						.inDataWord(temp3),
						.outputData(tempLout2));
						

assign temp4 =temp3 ^ tempRout2 ^ tempLout2;




assign inA0prymprym = inA0prym ^ temp4;
assign inA2prymprym = inA2prym ^ temp4;


assign outDataState = {inA0prymprym, inA1prymprym, inA2prymprym, inA3prymprym};


endmodule