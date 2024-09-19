`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.09.2024 12:00:00
// Design Name: 
// Module Name: mem
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


module mem(
input clk,rst,wr,rd,
[7:0]data_in,[3:0]address,
output reg[7:0]data_out);
reg [7:0]d[0:10];

always@(posedge clk)
begin
    if(rst)
      begin
        d[0]=8'b0;
        d[1]=8'b0;
        d[2]=8'b0;
        d[3]=8'b0;
        d[4]=8'b0;
        d[5]=8'b0;
        d[5]=8'b0;
        d[6]=8'b0;
        d[7]=8'b0;
        d[8]=8'b0;
        d[9]=8'b0;
        d[10]=8'b0;
      end
    else
      begin
        case({wr,rd})
            2'b10: d[address]=data_in;
            2'b01: data_out=d[address];
            default: data_out=8'bz;
        endcase;
      end
end
endmodule
