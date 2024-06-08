//Decode
module instD (instR,DMode,Rd,Rr,K);
  input[15:0] instR; //Recibimos un vector de 16bits
  output reg [3:0] DMode; //La operación a realizar se define con 4 bits
  output reg [4:0] Rd; //Dirección de registro
  output reg [4:0] Rr; //Direccion de registro
  output reg [7:0] K;

always@(*)
begin
  case (instR[15:10])
    	6'b000000: //NO OPERATION 
        begin
          #30 DMode = 4'b0010;   //NOP A
          Rr = {instR[9], instR[3:0]};
          Rd = {instR[8], instR[7:4]};
          K = instR[7:0];
          
        end
        6'b000011: //ARITMETICA ADD 
        begin
          #30 DMode = 4'b0000;
          Rr = {instR[9], instR[3:0]};
          Rd = {instR[8], instR[7:4]};
          K = instR[7:0];
        end   
       /* 6'b000110:  //ARITMETICA SUB
        begin
            DMode = 4'b0001;
            Rr = {instR[9], instR[3:0]};
            Rd = {instR[8], instR[7:4]};
            Opcode = instR[15:10];
        end*/
    	6'b001000: //ARITMETICA AND
        begin
          #30 DMode = 4'b0100;
          Rr = {instR[9], instR[3:0]};
          Rd = {instR[8], instR[7:4]};
          K = instR[7:0];
        end
    	6'b001010: //ARITMETICA OR 
        begin
          #30 DMode = 4'b0101;
          Rr = {instR[9], instR[3:0]};
          Rd = {instR[8], instR[7:4]};
          K = instR[7:0];
        end /*  
        6'b001001:  //ARITMETICA EOR
        begin
            DMode = 4'b0110;
            Rr = {instR[9], instR[3:0]};
            Rd = {instR[8], instR[7:4]};
         	Opcode = instR[15:10];
        end*/
    
    	6'b001011: //ARITMETICA MOV
        begin
          #30 DMode = 4'b0011; //SACA B SIN CAMBIOS
          Rr = {instR[9], instR[3:0]};
          Rd = {instR[8], instR[7:4]};
          K = instR[7:0];
        end  
    	6'b000101: //CP 
        begin
          #30 DMode = 4'b0001;
          Rr = {instR[9], instR[3:0]};
          Rd = {instR[8], instR[7:4]};
          K = instR[7:0];
        end
    	6'b111001: //LDI
        begin
          #30 DMode = 4'b0011; //SACA B SIN CAMBIOS
          Rr = {instR[9], instR[3:0]};
          Rd = {1'b1, instR[7:4]};
          K = {instR[11:8],instR[3:0]};
        end
               
    endcase
end
endmodule
