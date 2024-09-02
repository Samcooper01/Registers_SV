`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/09/2024 05:15:12 PM
// Design Name: 
// Module Name: reg_map_tb
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


module reg_map_tb();

logic clk;
logic rst_n;
logic reg_read;
logic reg_write;
logic [15:0] reg_rx_data;
logic [3:0] reg_sel;
logic [15:0] reg_tx_data;
logic reg_rdy;

reg_map iDUT(
    .clk(clk),
    .rst_n(rst_n),
    .reg_read(reg_read),
    .reg_write(reg_write),
    .reg_rx_data(reg_rx_data),
    .reg_sel(reg_sel),
    .reg_tx_data(reg_tx_data),
    .reg_rdy(reg_rdy)
);

initial begin
    @(posedge clk);
    rst_n = 0;
    reg_write = 0;
    reg_read = 0;
    @(posedge clk);
    @(posedge clk);
    rst_n = 1;
    @(posedge clk);
    @(posedge clk);
    
    for(int reg_index = 0; reg_index < 13; reg_index++) begin
        //Read reg0
        reg_sel = reg_index;
        reg_read = 1;
        @(posedge clk);
        reg_read = 0;
        if(reg_tx_data == 0) begin
            $display("READ REG %d PASSED\n", reg_index);
        end
        else begin
            $display("READ REG %d FAILED\n", reg_index);
        end
        @(posedge clk);
        @(posedge clk);
        
        //Write reg0
        reg_sel = reg_index;
        reg_read = 0;
        reg_rx_data = 44;
        reg_write = 1;
        @(posedge clk);
        reg_write = 0;
        if(reg_tx_data == 0) begin
            $display("WRITE REG %d PASSED\n", reg_index);
        end
        else begin
            $display("WRITE REG %d FAILED\n", reg_index);
        end
        @(posedge clk);
        @(posedge clk);
        
        //Read reg0
        reg_sel = reg_index;
        reg_write = 0;
        reg_read = 1;
        @(posedge clk);
        reg_read = 0;
        if(reg_tx_data == 0) begin
            $display("READ REG %d PASSED\n", reg_index);
        end
        else begin
            $display("READ REG %d FAILED\n", reg_index);
        end
        @(posedge clk);
        @(posedge clk);
    end



    reg_read = 0;
    reg_write = 0;
    @(posedge clk);
    $stop();
end

initial begin
clk = 0;
forever #5 clk = ~clk;
end

endmodule
