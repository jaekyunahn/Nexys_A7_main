//STATUS REGISTER
module statusR(
input rst, 
input clk,
input enableW_SR, //permito escribir
input enableR_SR, //permito leer
input [2:0] flag_in,
output [2:0] flag_out);
  
reg [2:0] flag_mem;
  
always@(posedge clk or posedge rst)
begin 
    if(rst == 1)
        flag_mem <= 3'b000;
    else if (enableW_SR) begin
        flag_mem <= flag_in;
    end 
    else begin
        flag_mem <= 3'bz;
    end
        
end
  assign flag_out = (enableR_SR == 1)? flag_mem:3'bz;
endmodule