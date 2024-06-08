/*-------------Sumador------------*/

module counter(
  input   [7:0] in_C,
  output [7:0] out_C
);
//parameter size_counter = 8;
parameter delay = 90;
//parameter increment = 1;
//parameter inicio = 0;
  
  assign #delay out_C = in_C + 1;

endmodule