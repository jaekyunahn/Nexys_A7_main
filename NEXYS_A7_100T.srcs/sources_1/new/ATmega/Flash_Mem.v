/*------------------------------------ FLASH MEMORY ----------------------------------------*/


module Flash_Mem(
    input clk_fm,
    input rst_fm,
    input E,                                //enable
  input [size_fm-1:0] Id_adress,            // entradad de la flash memory (dirección a buscar-8 bits)
    output [size_inst-1:0] Out_inst          // Salida de flash memory  (instrucción a decodificar, 16 bits)
);

integer i;
parameter size_inst = 16;              //tamaño de la instrucción 16-bits
parameter size_fm = 8;               // tamaño de la dirección
parameter size_Ifm = 5;                 //Número de instrucciones que se pueden ejecutar (32 instrucciones)

reg [size_inst-1:0] Mem_F[size_fm-1:0];        //vectores de 16 bits en 255 casilleros

always @(posedge clk_fm or posedge rst_fm) begin  
  if(rst_fm) begin  
                  for(i=0; i<=size_fm-1; i=i+1)
                begin
                Mem_F[i] = 16'b0;
                end
            end
          else 
            begin
            Mem_F[0] <= 16'b0010000100001110; //AND  
              Mem_F[1] <= 16'b0000110100010001; //ADD
              Mem_F[2] <= 16'b0010000100001110; //AND
              Mem_F[3] <= 16'b0010110101011001; //MOV d=21 r=9 lo del 9 al 21
              Mem_F[4] <= 16'b1110011101100011; //LDI grabo 115 en d=22
            end
end

assign Out_inst = Mem_F[Id_adress];

endmodule
