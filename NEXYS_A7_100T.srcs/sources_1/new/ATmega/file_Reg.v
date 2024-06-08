//FILE REGISTER
module file_Reg(  
      input                    clk,                     //WIRE por default
                                                        // seÃ±al de reloj
      input                    rst,                     // seÃ±al de reset
      // write port  
      input                    FR_WE,                   //indicativo de que vamos a ingresar un nuevo registro
  input          [4:0]     FR_Waddr,                // DirecciÃ³n donde se guardara el dato
      input          [7:0]    FR_Wdata,                //Valor del dato a guardar
      //read port 1  
  input          [4:0]     FR_RAddr_1,              //Leer la direcciÃ³n del dato
      output         [7:0]    FR_Rdata_1,              //Leer el dato de la direcciÃ³n
      //read port 2  
  input          [4:0]     FR_RAddr_2,  
      output         [7:0]    FR_Rdata_2  
 );  
      reg     [7:0] reg_File [31:0];       // Matriz de registros: filas (nÃºmero de registros) x columnas (tamaÃ±o del dato)
      integer i;     
      
      /*------------------------------------- Guardar un registro --------------------------*/
      always @ (posedge clk or posedge rst) begin   //va a depener de mÃ¡s factores
           if(rst) begin  
             for( i=0; i<32; i=i+1) 
               reg_File[i] = i;
             end  
           else begin  
                if(FR_WE) begin                         // verificamos que desemos ingresar un nuevo dato
                     reg_File[FR_Waddr] <= FR_Wdata;    // asignamos una direcciÃ³n en donde se va a guardar el dato y le damos el valor del dato
                end  
           end  
      end  
      /*-------------------------------- Obtener el valor de un registro--------------------------------------*/
  assign FR_Rdata_1 = reg_File[FR_RAddr_1];
  assign FR_Rdata_2 = reg_File[FR_RAddr_2];
 endmodule



/*------------------------------------------ FILE REGISTER -------------------------------------------------------*/

/* Matriz de 32 registros de uso general
    2 columnas: Registros Derechos y Registros Izquierdo
    6 de ellos estan restringidos como direccionamiento indirecto: 5 de SRAM y 1 Flash memory*/

//parameter size_data= 8;               // dato de 8-bis
//parameter size_row = 32;                // 16 registros en columna izq + 16 registros en columna derecha = 32 registros
//parameter size_addr= 4;                 // 0001 0000 (16 direcciones posibles)