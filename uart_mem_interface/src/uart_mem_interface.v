`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Rice Shelley
// 
// Create Date: 04/01/2020 05:41:47 PM
// Design Name: 
// Module Name: uart_mem_interface
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


module uart_mem_interface # (
        parameter READ_CMD = 0,
        WRITE_CMD = 255
    )(
        input clk,
        input rx_ready,
        input tx_ready,
        input [7:0] rx_data,
        output reg [7:0] tx_buff = 0,
        output reg tx_start_trans = 0,
        output reg [7:0] addr = 0,
        output reg [7:0] dout = 0,
        input [7:0] din,
        output reg wr = 0
    );
    
    localparam
    WAIT_FOR_CMD = 0,
    GET_ADDR = 1,
    WRITE = 2,
    READ = 3;
    
    reg [1:0] state = 0;
    
    reg [7:0] cmd = 0;
    
    reg [1:0] rx_ready_buff = 0;
    wire posedge_rx_ready = (rx_ready_buff == 2'b01);
    always @(posedge clk) begin
        rx_ready_buff <= {rx_ready_buff[0], rx_ready};
    end
    
    always @(posedge clk) begin
    
        case (state)
            WAIT_FOR_CMD:
            begin
                if (posedge_rx_ready) begin
                    cmd <= rx_data;
                    state <= GET_ADDR;
                    wr <= 0;
                    tx_start_trans <= 0;
                end else begin
                    state <= WAIT_FOR_CMD;
                end
            end
            GET_ADDR:
            begin
                if (posedge_rx_ready) begin
                    addr <= rx_data;
                    if (cmd == READ_CMD) begin
                        state <= READ;
                    end else if (cmd == WRITE_CMD) begin
                        state <= WRITE;
                    end else begin
                        // Unkown cmd -> Default to a read
                        state <= READ;
                    end
                end else begin
                    state <= state;
                end
            end
            WRITE:
            begin
                if (posedge_rx_ready) begin
                    dout <= rx_data;
                    wr <= 1;
                    state <= WAIT_FOR_CMD;
                end else begin
                    state <= state;
                end
            end
            READ:
            begin
                if (tx_ready) begin
                    tx_buff <= din;
                    tx_start_trans <= 1;
                    state <= WAIT_FOR_CMD;
                end else begin
                    state <= state;
                end
            end
        endcase
    
    end
    
endmodule
