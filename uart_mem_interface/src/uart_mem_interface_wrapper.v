`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/01/2020 06:47:01 PM
// Design Name: 
// Module Name: uart_mem_interface_wrapper
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module uart_mem_interface_wrapper # (
        parameter READ_CMD = 0,
        WRITE_CMD = 255
    )(
        input clk100Mhz,
        input rx,
        output tx,
        input [7:0] din,
        output [7:0] addr,
        output [7:0] dout,
        output wr
    );
    
    wire rx_ready;
    wire tx_ready;
    wire [7:0] rx_data;
    wire [7:0] tx_buff;
    wire tx_start_trans;
    
    uart_mem_interface #(READ_CMD, WRITE_CMD) umi_inst (
        .clk(clk100Mhz),
        .rx_ready(rx_ready),
        .tx_ready(tx_ready),
        .rx_data(rx_data),
        .tx_buff(tx_buff),
        .tx_start_trans(tx_start_trans),
        .addr(addr),
        .dout(dout),
        .din(din),
        .wr(wr)
    );
    
    uart_0 uart_inst (
        .clk(clk100Mhz),
        .rx(rx),
        .rx_data(rx_data),
        .rx_ready(rx_ready),
        .tx(tx),
        .tx_buff(tx_buff),
        .tx_ready(tx_ready),
        .tx_start_trans(tx_start_trans)
    );
    
endmodule
