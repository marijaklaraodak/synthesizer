`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:46:40 06/09/2023 
// Design Name: 
// Module Name:    timer2 
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
//TON H
//////////////////////////////////////////////////////////////////////////////////
module timer2 #(parameter maxTimeValue = 101250) (
input clk,
input reset,
output reg freqOut
    );
	 
integer TimerValue;

always @(posedge clk or posedge clk)
begin
 if (reset)
   TimerValue <= 0;
 else if (TimerValue < maxTimeValue)
   begin
	TimerValue <= TimerValue + 1'b1;
	end
 else
 TimerValue <= 26'd0;
end

always @(posedge clk or posedge reset)
begin
 if (reset)
   freqOut <= 1'b0;
 
 else
 begin
 if (TimerValue == maxTimeValue);
 freqOut <= ~freqOut;
end 
end




endmodule
