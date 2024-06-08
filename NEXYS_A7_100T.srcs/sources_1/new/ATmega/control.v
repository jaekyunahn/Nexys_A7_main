module control(
    input [1:0] estado,
    input [15:0] IR, //llegada del instruction register
    input [2:0] SR, //llegada del status register
    output reg selM1,selM2,selM3,selM4,selM5,selM6,selM7,selM8,Wr_en,ReadM, EscM,enable_ft, en_pcount, enableR_SRT, enableW_SRT, enable_D
);

parameter Fetch1 = 2'b00,Decode = 2'b01, Execute = 2'b10, WriteB = 2'b11;
always@(*)
begin
    selM1 = 0; 
    selM2 = 0;
    selM3 = 0;
    selM4 = 0;
    selM5 = 0;
    selM6 = 0;
    selM7 = 0;
    selM8 = 0;
    Wr_en = 0; //enable file register escritura
    ReadM = 0; //leer memory
    EscM = 0; //escribir memory
    enable_ft = 0; //enable fetch
    en_pcount = 0; //enable pcounter
    enableR_SRT = 0; //enable leer status R
    enableW_SRT = 0; //enable escribir status R
  	enable_D = 0;

if (estado == Fetch1) begin
    enable_ft = 1;
end
else if (estado == Decode) begin
  enable_D = 1;
  if (IR[15:14] == 2'b00) begin //sera arit, no manda direcciÃ³n
        ReadM = 0;
        EscM = 0;
    end
    else
    begin
      enable_D = 1;
    end
end
else if (estado == Execute) begin
    if (IR[15:14] == 2'b00) begin
        enableW_SRT = 1; //permito escribir las flags
        enableR_SRT = 1; //permito leerlas
    end 
    else begin
        Wr_en = 0;
        enableW_SRT = 1; //permito escribir las flags
        enableR_SRT = 1; //permito leerlas
        selM2 = 1;
        selM4 = 1;
        selM5 = 1;
        ReadM = 1; //si no es aritmetica manda direcciÃ³n
        EscM = 1; //escribe el dato que le llegue del mux 5
    end
end
else if (estado == WriteB) begin
    en_pcount = 1;
    Wr_en = 1; //permito escribir en el file R
  	#20 Wr_en = 0;
end
end

endmodule
