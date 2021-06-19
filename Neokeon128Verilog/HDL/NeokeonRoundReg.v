//Modul pamieciowy dla przechowywania stanu rundy

module NeokeonRoundReg (
input   wire          inClk,        //wejście sygnału zegarowego, aktywne zboczem narastającym sygnału
input   wire          inExtWr,        //wejscie sygnału zapisu danych z interfejsu Ext, aktywne poziomem wysokim
input   wire          inIntWr,        //wejscie sygnału zapisu danych z interfejsu Int, aktywne poziomem wysokim
input   wire [127:0]  inExtData,    //128-bitowe wejście magistrali danych z interfejsu Ext 
input   wire [127:0]  inIntData,    //128-bitowe wejście magistrali danych z interfejsu Int
output  wire [127:0]  outData        //128-bitowe wyjście magistrali danych z rejestru
);

reg [127:0] regData = 128'b0;        //rejestr rundy - służy do przechowywania stanu



//Zapis danych do rejestru regData następuje na każdym zboczu narastającym zegara na wejściu inClk pod warunkiem, że wejście inExtWr lub inIntWr jest aktywne.

always@(posedge(inClk))
begin
    if (inExtWr == 1'b1) begin
        regData <= inExtData;
    end
    else if (inIntWr == 1'b1) begin
        regData <= inIntData;
    end
end


assign outData = regData;     //wyjście magistrali danych z rejestru podłączone jest na stałe do rejestru regData

endmodule