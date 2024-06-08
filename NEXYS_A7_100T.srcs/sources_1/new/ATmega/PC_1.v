//TOP
`include "counter.v"
`include "RPC.v"
//`include "mux.v"

module PC_1 (
    input rst_pc,
    input clk_pc,
    input en_pc,
    input selMp,                 //seleccionador de entrada para el mux
    input [7:0] PC_Iaddr, 
    output wire [7:0] PC_Oaddr            //DirecciÃ³n a ejecutar//DirecciÃ³n a buscar
);
    
/*----- PARAMETROS DE COUNTER ----*/
wire [7:0] PC_Ocounter; //salida del counter
reg clk_pcc;
  
/*------- PARAMETROS DE MUX -----*/
wire [7:0] outM_pc; //salida del mux
  /*----- PARAMETROS PC_BLOCK---*/
  always@(clk_pc, en_pc)begin
    if(en_pc)begin
    clk_pcc = clk_pc & en_pc;
    end
  end
  counter U1(.in_C(PC_Oaddr), .out_C(PC_Ocounter));
  
  mux mux7(.A(PC_Ocounter), .B(PC_Iaddr), .Sel(selMp), .F(outM_pc));
  
  RPC U3(.rst(rst_pc), .clk(clk_pcc), .pc_Newaddr(outM_pc), .pc_Daddr(PC_Oaddr));  
    
endmodule