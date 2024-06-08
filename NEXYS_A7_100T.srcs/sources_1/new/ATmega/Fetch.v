/*-------------------------------------FETCH------------------------------*/

`include "IR.v"
`include "Flash_Mem.v"

//parameter size_dft = 16;
//parameter size_inputft = 2;

module Fetch (
    input en_ft,
	input clk_cpu,                                                    //reloj de entrada estado fetch
    input rst_ft,
    input [7:0] Din_ft,                        // 8 bits dirección/domicilio de entrada
    output wire [15:0] Instr_ft );                  // 16 bits instrucción a ejecutar (salida ft)

    
    /*------- PARAMETROS PARA FLASH MEMORY -----*/
  wire [15:0] next_inst;                       // 16 bits
reg clk_ft;

   always@(clk_cpu, en_ft)begin
     if(en_ft)begin
    clk_ft= clk_cpu & en_ft;
  end
   end
    /*------------- INSTANCIACIÓN ----------------*/

    Flash_Mem fm_ft(.clk_fm(clk_ft), .rst_fm(rst_ft), .Id_adress(Din_ft), .Out_inst(next_inst));

  IR Ir_ft(.clk(clk_ft), .IR_int(next_inst), .IR_OUT(Instr_ft));

endmodule