// Moduł kombinacyjny wyznaczajacy kolejne klucze rundowe constant1
module NeokeonRC12fun (
	input	wire	[31:0]	constant1,	// 32-bitowe wejście magistrali constant1
	output	wire	[31:0]	outData1 // 32-bitowe wyjście magistrali danych
	
);
//test z tb przeszedl prawidlowo

assign outData1 = ((constant1 & 32'h00000080) != 32'h00000000) ? (constant1 << 1) ^ 32'h011B : (constant1 << 1);

endmodule
