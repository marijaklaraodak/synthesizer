`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:46:20 06/09/2023 
// Design Name: 
// Module Name:    Sintisajzer 
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
module Sintisajzer( input clk, sw0, sw1, sw2, sw3, output dac_cs, spi_sck, spi_mosi, dac_clr
    );
	 
	wire w1;
	
novipiano novipiano (.clk(clk), .k1(sw0), .k2(sw1), .k3(sw2), .k4(sw3), .speaker(w1));
DAC DAC(.clk(clk),.data_in(w1),.spi_mosi(spi_mosi),.dac_cs(dac_cs),.dac_clr(dac_clr),.spi_sck(spi_sck));

endmodule
