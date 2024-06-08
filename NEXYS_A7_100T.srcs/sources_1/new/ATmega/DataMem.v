// Data Memory
module DataMem( input clk_i,
     input rst_i,
     input E,    // Enable Leemos lo de la memoria, saca lo que tiene  
     input WE,   // Write enable 
     input [7:0] Addr, // Address  
     input [7:0] DI, // Data input 
     output [7:0] DO // Data output 
    );
  
  reg [7:0] data_mem [32:0];
  reg [7:0] data_DM;
  integer i;

  always @(posedge clk_i or posedge rst_i) 
begin
  if(rst_i)
    begin 
      for (i=0;i<=32;i=i+1)
        data_mem[i] <= i;//8'b0;
    	end
  else if (WE) begin
    data_mem[Addr] <= DI;
  end 
  else if (E) begin
    data_DM <= data_mem[Addr];
  end
  else begin
    data_DM <= 8'bz;
  end
end
  assign DO = (E==1)? data_DM:8'bz;
 //assign DO = (E ==1 )? data_mem[Addr]:0;
endmodule