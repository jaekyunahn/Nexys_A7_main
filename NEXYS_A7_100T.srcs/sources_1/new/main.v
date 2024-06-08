
//  ATmega : https://github.com/RicardoAlan/ATmega328p
//  ARM9 : 

module main(
    //  System
    input   wire    CLK100MHZ,
    input   wire    CPU_RESETN,
    
    //  GPIO Array
    input   wire    [15:0] SW,
    output  wire    [15:0] LED,
    input   wire    [15:0] HEADER_X,
    input   wire    [15:0] HEADER_Y,
    
    //  UART
    input   wire    UART_RX,
    output  wire    UART_TX,

    //  LED
    output  wire    LED16_B,
    output  wire    LED16_G,
    output  wire    LED16_R,
    output  wire    LED17_B,
    output  wire    LED17_G,
    output  wire    LED17_E
);

/*
    //
    adder_16bit u_alu (
        .alu_a_i(HEADER_X),
        .alu_b_i(HEADER_Y),
        .alu_r_o(LED)
    );
*/
    //  Test Mode
/*
    CU_TB testCU_TB();
*/
    
endmodule
