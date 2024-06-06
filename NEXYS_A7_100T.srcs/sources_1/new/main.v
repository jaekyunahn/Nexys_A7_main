module main(
    //  System
    input wire CLK100MHZ,
    input wire CPU_RESETN,
    
    //  GPIO Array
    input wire [15:0] SW,
    output wire [15:0] LED,
    
    //  UART
    input wire UART_RX,
    output wire UART_TX,

    //  LED
    output wire LED16_B,
    output wire LED16_G,
    output wire LED16_R,
    output wire LED17_B,
    output wire LED17_G,
    output wire LED17_E
);

    //

endmodule
