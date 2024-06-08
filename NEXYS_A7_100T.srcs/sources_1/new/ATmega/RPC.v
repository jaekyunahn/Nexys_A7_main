/*-------------PC-------------*/

module RPC (
    input rst,
    input clk,
    //input pc_load,                              //Boton de encendido
    input [size_data-1:0] pc_Newaddr,           //Nueva direcciÃ³n
    output [size_data-1:0] pc_Daddr            //DirecciÃ³n a ejecutar
);

parameter size_data = 8;
parameter size_PC = 2;

reg [size_data-1:0] pila;

always @(posedge rst or posedge clk) begin
    if(rst)begin 
      pila=0;
    end

    else begin
                            //Siguiente dato a ejecutar
      pila = pc_Newaddr;                   //Captura nuevo dato
    end
    
end
    assign pc_Daddr= pila;
endmodule