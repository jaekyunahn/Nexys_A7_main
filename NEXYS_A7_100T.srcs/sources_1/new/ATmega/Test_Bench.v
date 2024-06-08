`timescale 1ns/1ps

module CU_TB();
reg rst_TB;
reg clk_TB;
reg EN;
  CU DT (.RST(rst_TB), .CLK(clk_TB));
  
  
initial begin
  EN=1;
  rst_TB=1;
 
  
  #1 rst_TB=0;
  
  
  #590EN=0;
end
  
initial 
    begin    
    clk_TB=1;
      while( EN ==1)
    #5 clk_TB= ~clk_TB;
  end
  
    initial 
      begin
      $dumpvars;
      $dumpfile("dump.vcd");
    end
endmodule