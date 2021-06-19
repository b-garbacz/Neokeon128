//Moduł Pamieciowy potrzebny do przechowywania danych 

module NeokeonDataOutReg (
input   wire          inClk,     //wejście sygnału zegarowego, aktywne zboczem narastającym sygnału
input   wire          inWr,        //wejscie sygnału zapisu danych do rejestru, aktywne poziomem wysokim
input   wire [127:0]  inData,    //128-bitowe wejście magistrali danych 
output  wire [127:0]  outData    //128-bitowe wyjście magistrali danych 
);

reg [127:0] regOutData = 128'b0;        //rejestr wyjściowy - służy do przechowywania danych w module NeokeonDataOutReg
    
always@(posedge(inClk))
begin
    if (inWr == 1'b1) begin
        regOutData <= inData;
    end
end

assign outData = regOutData;        //wyjście magistrali danych z rejestru podłączone jest na stałe do rejestru regData

endmodule