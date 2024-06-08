// Stack Pointer
module stackP(rst, clk, Instack,Outstack);
  input rst;
  input clk;
  input wire [7:0] Instack;
  output [7:0] Outstack;
  
  reg[7:0] stack_mem[1:0];
  
  always@(posedge clk or posedge rst)
    begin 
  if(rst == 1)
        stack_mem[1] <= 8'b0;
    else 
        stack_mem[1] <= Instack;
end
  
  assign Outstack = stack_mem[1];
endmodule
//Este es el bueno 