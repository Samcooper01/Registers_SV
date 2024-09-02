`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/09/2024 04:55:47 PM
// Design Name: 
// Module Name: reg_map
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


module reg_map(
    input logic clk,
    input logic rst_n,
    input logic reg_read,
    input logic reg_write,
    input logic [15:0] reg_rx_data,
    input logic [3:0] reg_sel,
    output logic [15:0] reg_tx_data,
    output logic reg_rdy
);

logic [15:0] reg0;
logic [15:0] reg1;
logic [15:0] reg2;
logic [15:0] reg3;
logic [15:0] reg4;
logic [15:0] reg5;
logic [15:0] reg6;
logic [15:0] reg7;
logic [15:0] IPR;
logic [15:0] IR;
logic [15:0] DR;
logic [15:0] ZF;

logic set_reg_rdy;
logic set_reg_rdy_WR;

always_ff @(posedge clk or negedge rst_n or posedge reg_read) begin
    if(!rst_n) begin
        reg_tx_data = 16'bz;
        set_reg_rdy = 0;
    end else if (reg_read == 1) begin
        case(reg_sel)
            0: reg_tx_data = reg0;
            1: reg_tx_data = reg1;
            2: reg_tx_data = reg2;
            3: reg_tx_data = reg3;
            4: reg_tx_data = reg4;
            5: reg_tx_data = reg5;
            6: reg_tx_data = reg6;
            7: reg_tx_data = reg7;
            8: reg_tx_data = ZF;
            9: reg_tx_data = DR;
            10: reg_tx_data = IR;
            12: reg_tx_data = IPR;
         endcase
         set_reg_rdy = 1;
    end
    else begin
        set_reg_rdy = 0;
    end
end

always_ff @(posedge clk) begin
    if(set_reg_rdy == 1 || set_reg_rdy_WR == 1) begin
        reg_rdy = 1;
    end
    else begin
        reg_rdy = 0;
    end
end

//GPR Registers
always_ff @(posedge clk or negedge rst_n or posedge reg_write) begin
    if(!rst_n) begin
        reg0 = '0;
    end
    else if (reg_write && reg_sel == 0) begin
        reg0 = reg_rx_data;
        set_reg_rdy_WR = 1;
    end
    else begin
        set_reg_rdy_WR = 0;
    end
end
always_ff @(posedge clk or negedge rst_n or posedge reg_write) begin
    if(!rst_n) begin
        reg1 = '0;
    end
    else if (reg_write && reg_sel == 1) begin
        reg1 = reg_rx_data;
        set_reg_rdy_WR = 1;
    end
    else begin
        set_reg_rdy_WR = 0;
    end
end

always_ff @(posedge clk or negedge rst_n or posedge reg_write) begin
    if(!rst_n) begin
        reg2 = '0;
    end
    else if (reg_write && reg_sel == 2) begin
        reg2 = reg_rx_data;
        set_reg_rdy_WR = 1;
    end
    else begin
        set_reg_rdy_WR = 0;
    end
end

always_ff @(posedge clk or negedge rst_n or posedge reg_write) begin
    if(!rst_n) begin
        reg3 = '0;
    end
    else if (reg_write && reg_sel == 3) begin
        reg3 = reg_rx_data;
        set_reg_rdy_WR = 1;
    end
    else begin
        set_reg_rdy_WR = 0;
    end
end

always_ff @(posedge clk or negedge rst_n or posedge reg_write) begin
    if(!rst_n) begin
        reg4 = '0;
    end
    else if (reg_write && reg_sel == 4) begin
        reg4 = reg_rx_data;
        set_reg_rdy_WR = 1;
    end
    else begin
        set_reg_rdy_WR = 0;
    end
end

always_ff @(posedge clk or negedge rst_n or posedge reg_write) begin
    if(!rst_n) begin
        reg5 = '0;
    end
    else if (reg_write && reg_sel == 5) begin
        reg5 = reg_rx_data;
        set_reg_rdy_WR = 1;
    end
    else begin
        set_reg_rdy_WR = 0;
    end
end

always_ff @(posedge clk or negedge rst_n or posedge reg_write) begin
    if(!rst_n) begin
        reg6 = '0;
    end
    else if (reg_write && reg_sel == 6) begin
        reg6 = reg_rx_data;
        set_reg_rdy_WR = 1;
    end
    else begin
        set_reg_rdy_WR = 0;
    end
end

always_ff @(posedge clk or negedge rst_n or posedge reg_write) begin
    if(!rst_n) begin
        reg7 = '0;
    end
    else if (reg_write && reg_sel == 7) begin
        reg7 = reg_rx_data;
        set_reg_rdy_WR = 1;
    end
    else begin
        set_reg_rdy_WR = 0;
    end
end

//CPU registers
always_ff @(posedge clk or negedge rst_n or posedge reg_write) begin
    if(!rst_n) begin
        IPR = '0;
    end
    else if (reg_write && reg_sel == 12) begin
        IPR = reg_rx_data;
        set_reg_rdy_WR = 1;
    end
    else begin
        set_reg_rdy_WR = 0;
    end
end

always_ff @(posedge clk or negedge rst_n or posedge reg_write) begin
    if(!rst_n) begin
        IR = '0;
    end
    else if (reg_write && reg_sel == 10) begin
        IR = reg_rx_data;
        set_reg_rdy_WR = 1;
    end
    else begin
        set_reg_rdy_WR = 0;
    end
end

always_ff @(posedge clk or negedge rst_n or posedge reg_write) begin
    if(!rst_n) begin
        DR = '0;
    end
    else if (reg_write && reg_sel == 9) begin
        DR = reg_rx_data;
        set_reg_rdy_WR = 1;
    end
    else begin
        set_reg_rdy_WR = 0;
    end
end

always_ff @(posedge clk or negedge rst_n or posedge reg_write) begin
    if(!rst_n) begin
        ZF = '0;
    end
    else if (reg_write && reg_sel == 8) begin
        ZF = reg_rx_data;
        set_reg_rdy_WR = 1;
    end
    else begin
        set_reg_rdy_WR = 0;
    end
end

endmodule
