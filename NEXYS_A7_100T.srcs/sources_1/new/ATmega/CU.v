// Code your design here
//Design
`include "file_Reg.v"
`include "Alu_control.v"
`include "mux.v"
`include "statusR.v"
`include "instD.v"
`include "DataMem.v"
`include "stackP.v"
`include "PC_1.v"
`include "Fetch.v"
`include "control.v"


module CU (CLK,RST,Istack);
	input CLK, RST;
	input [7:0] Istack;
	
	reg [1:0] estado_act;
	parameter Fetch1 = 2'b00,Decode = 2'b01, Execute = 2'b10, WriteB = 2'b11; 
	parameter S0=0, S1=1, S2=2, S3=3;
    integer i=0;
    integer state=0;
	
	wire selM1, selM2, selM3, selM4, selM5, selM6, selM7,selM8;
	wire ReadM, EscM;
	wire Wr_en;
	wire enable_ft, en_pcount;
	wire enableW_SRT, enableR_SRT;
  	wire enable_D;
	
	wire [7:0] Alu_out, Wr_data;
	wire [7:0] Alu_A;
	wire [7:0] Alu_B;	
	wire [7:0] Rd1_data, Rd2_data;
  	wire [2:0] FLAGS, FLAGS_OUT;
  	wire [3:0] Mode_Alu;
  	wire [4:0] Rd_D, Rr_D;
 	wire [5:0] K_D;
    wire [7:0] FM2;
    wire [15:0] IR_out;
    //wire [7:0] SP;
    wire [7:0] DOM;
    wire [7:0] DIM;
    wire [4:0] Waddr;
    wire [15:0] IR_intc;
    wire [7:0] Stack_P;
    wire [7:0] PC_IADD;
    wire [7:0] FLSH_int;
    //wire enable_ft;
    
    
    
  	
  
	
  file_Reg fr0(.clk(CLK), .rst(RST), .FR_RAddr_1(Rd_D), .FR_RAddr_2(Rr_D), .FR_Waddr(Waddr), .FR_Wdata(Wr_data), .FR_WE(Wr_en), .FR_Rdata_1(Rd1_data), .FR_Rdata_2(Rd2_data));
  instD InstD1(.instR(IR_out), .DMode(Mode_Alu), .Rd(Rd_D), .Rr(Rr_D), .K(K_D));
  Alu_control al0(.Operand1(Alu_A), .Operand2(Alu_B), .Mode(Mode_Alu), .Out(Alu_out), .Flags(FLAGS));
  statusR sR1(.clk(CLK), .rst(RST), .flag_in(FLAGS), .flag_out(FLAGS_OUT), .enableR_SR(enableR_SRT), .enableW_SR(enableW_SRT));
  DataMem DM1(.clk_i(CLK),.rst_i(RST), .E(ReadM), .WE(EscM), .Addr(FM2), .DI(DIM), .DO(DOM));
  stackP SKM(.clk(CLK),.rst(RST), .Instack(Istack),.Outstack(Stack_P));
  PC_1 pcc_1(.clk_pc(CLK),.rst_pc(RST),.selMp(selM7),.PC_Iaddr(PC_IADD),.PC_Oaddr(FLSH_int), .en_pc(en_pcount));
  Fetch fetch1(.clk_cpu(CLK), .rst_ft(RST), .Din_ft(FLSH_int), .Instr_ft(IR_out), .en_ft(enable_ft));
  
  mux mux1(.A(Rd1_data), .B(K_D), .Sel(selM1), .F(Alu_A));
  mux mux2(.A(Rd2_data), .B(FLSH_int), .Sel(selM2), .F(FM2));
  mux mux3(.A(Alu_out),.B(DOM),.Sel(selM3),.F(Wr_data));
  mux mux4(.A(FM2), .B(K_D), .Sel(selM4), .F(Alu_B));
  mux mux5(.A(Stack_P),.B(Alu_A),.Sel(selM5),.F(DIM));
  mux mux6(.A(Rd_D), .B(Rr_D), .Sel(selM6), .F(Waddr));
  mux mux8(.A(Alu_out), .B(DOM), .Sel(selM8), .F(PC_IADD));
  
  control CT(.estado(estado_act), .IR(IR_out), .SR(FLAGS_OUT),.selM1(selM1), .selM2(selM2), .selM3(selM3), .selM4(selM4), .selM5(selM5), .selM6(selM6), .selM7(selM7), .selM8(selM8), .Wr_en(Wr_en), .ReadM(ReadM), .EscM(EscM), .enable_ft(enable_ft), .en_pcount(en_pcount), .enableR_SRT(enableR_SRT), .enableW_SRT(enableW_SRT), .enable_D(enable_D));
  
  always @(CLK) begin
    
    if(i==2)begin
    state= state +1;
    i=1;
    end
    else begin
        i=i+1;
    end
      
  case (state)
            S0: begin
              estado_act <= Fetch1;
            end
            S1: begin
              estado_act <= Decode;
              end
            S2: begin
              estado_act <= Execute;
              end
            S3: begin
              estado_act <= WriteB;
              end
            default: begin
              state=0;
              estado_act <= Fetch1;
              end
        endcase 
end
  
endmodule