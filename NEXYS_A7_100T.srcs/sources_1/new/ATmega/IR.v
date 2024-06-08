//INSTRUCCION REGISTER

module IR(
input clk,
  input  [15:0] IR_int,     //input PC_load,
  output [15:0] IR_OUT     //Dirección a ejecutar
);
  parameter delay=30;
  reg [15:0] IR_inst;

always @(posedge clk)
begin
  IR_inst=IR_int[15:0];
end
assign #delay IR_OUT = IR_inst;
endmodule