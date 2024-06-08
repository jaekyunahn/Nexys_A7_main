//EJEMPLO DE MUX
module mux(output wire [7:0] F, //Defino mi salida
            input wire [7:0] A, B, //Defino mis entradas
            input wire Sel); //Defino el selector como es un MUX de 2 entradas basta con seleccionar 1 o 0

assign F = (Sel == 1'b0) ? A: //Si el selector es 0 me saca el valor de A
           (Sel == 0'b1) ? B: //Si el selector es 1 me saca el valor de B
           1'bX;
endmodule