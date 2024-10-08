`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.09.2024 16:11:27
// Design Name: 
// Module Name: mem32_tb
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
module mem32_tb;
    reg clk,rst,rd,wr;
    reg [1:0] address;
    reg [31:0] data_in;

    wire [7:0] data_out;
    wire valid;

   mem32 dut (.clk(clk),.rst(rst),.rd(rd),.wr(wr),.addr(addr),.Indata(Indata),.Dataout(Dataout),.valid(valid));
    always #5 clk = ~clk;
    initial 
    begin
        clk = 0;rst = 1;rd = 0;wr = 0;
        address = 2'b00;
        data_in = 32'h00000000;
        
        #10;rst = 0;
        data_in = 32'hA1B2C3D4; 
        wr = 1; #10; 
        #10; wr = 0;
        
        if (valid) 
            $display("Valid flag set. All data written successfully.");
        else
            $display("Error: Valid flag not set!");
            
        rd = 1;
        address = 2'b00;  
        
        #10;
        $display("Read byte 0: Dataout = %h (Expected: A1)", Dataout);
        address = 2'b01;
        
        #10;
        $display("Read byte 1: Dataout = %h (Expected: B2)", Dataout);

        address = 2'b10;
        #10;
        $display("Read byte 2: Dataout = %h (Expected: C3)", Dataout);

        address = 2'b11;  
        #10;
        $display("Read byte 3: Dataout = %h (Expected: D4)", Dataout);

        rd = 0;
        #10;
        $finish;
    end
endmodule
