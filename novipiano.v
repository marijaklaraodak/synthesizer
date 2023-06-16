`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:50:03 06/09/2023 
// Design Name: 
// Module Name:    novipiano 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module novipiano(input clk,
input k1,
input k2, 
input k3,
input k4,
output reg speaker
);


wire A, B, C, D;

timer1 #(.maxTimeValue(113600))t1
(.clk(clk),.reset(~k1),.freqOut(A));

timer2 #(.maxTimeValue(101250))t2
(.clk(clk),.reset(~k2),.freqOut(B));

timer3 #(.maxTimeValue(95550))t3
(.clk(clk),.reset(~k3),.freqOut(C));

timer4 #(.maxTimeValue(85150))t4
(.clk(clk),.reset(~k4),.freqOut(D));


always @ (*)
begin
if (k1)
speaker = A;
else if (k2)
speaker = B;
else if (k3)
speaker = C;
else if (k4)
speaker = D;
else 
speaker = 1'b0;

end






endmodule
