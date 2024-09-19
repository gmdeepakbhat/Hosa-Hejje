`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.09.2024 14:54:41
// Design Name: 
// Module Name: mem_tb
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


module mem_tb();
reg clk,rst,wr,rd;
reg [7:0]data_in;
reg [3:0]address;
wire [7:0]data_out;
mem D0(.clk(clk),.rst(rst),.wr(wr),.rd(rd),.data_in(data_in),.address(address),.data_out(data_out));

initial
begin 
clk=1;
rst=1;
#20 rst=0;wr=1;rd=0;address=4'b0100;data_in=8'b00100010;
#20 rst=0;wr=0;rd=1;address=4'b0100;
#20 wr=1;rd=1;address=4'b0100;data_in=8'b01100010;
#20 wr=0;rd=0;address=4'b0100;data_in=8'b01001010;
#20 wr=0;rd=1;address=4'b0110;data_in=8'b01001010;
#20 wr=0;rd=1;address=4'bz;data_in=8'b01001010;
#20 wr=1;rd=0;address=4'b1110;data_in=8'b01001010;
#20 wr=0;rd=1;address=4'b1110;data_in=8'b01001010;
#20 $finish;
end
always
#10 clk=~clk;
endmodule
