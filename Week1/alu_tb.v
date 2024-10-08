`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.09.2024 21:13:16
// Design Name: 
// Module Name: alu_tb
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



module alu_32bit_tb;
    reg clk,rst;
    reg [31:0] a_in, b_in;
    reg [3:0] select;
    wire [31:0] y_out;
    wire flag;
    wire [32:0] sum_out;

alu_32bit uut(.clk(clk),.rst(rst),.a_in(a_in),.b_in(b_in),.sel(sel),.y_out(y_out),.flag(flag),.sum_out(sum_out));
    initial 
    begin
        clk = 0;
        forever #5 clk = ~clk; 
    end

  
    initial 
    begin
        rst = 1; 
        #10 rst = 0; 

 
        for (integer k = 0; k < 16; k = k + 1) begin 
            for (integer i = 0; i < 10; i = i + 1) begin  
                for (integer j = 0; j < 10; j = j + 1) begin 
                    a_in = i * 1000;  
                    b_in = j * 2000;
                    select = k;
                    #10;  
                    $display("Time=%0t | a_in=%b, b_in=%b, select=%b | y_out=%b, flag=%b, sum_out=%b",
                             $time, a_in, b_in, select, y_out, flag, sum_out);
                end
            end
        end
        
        $finish; 
    end
endmodule
