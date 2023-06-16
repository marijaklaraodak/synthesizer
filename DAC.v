`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:45:00 06/09/2023 
// Design Name: 
// Module Name:    DAC 
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
module DAC(input clk, reset, data_in, output reg dac_cs, spi_sck, spi_mosi, dac_clr,
output SPI_SS_B, AMP_CS, SF_CE0, FPGA_INIT_B);


wire [11:0] data_out;

assign data_out = (data_in)? 12'b111111111111 : 12'b0;


reg [2:0]dac_state;
reg [31:0]dac_out;
reg [5:0]count=32;

assign SPI_SS_B=1; 
assign AMP_CS=1; 
assign AD_CONT=0; 
assign SF_CE0=1; 
assign FPGA_INIT_B=1; 

always@(posedge clk or posedge reset) 
	begin
	if(reset==1) 
		begin
			dac_cs<=1;
			spi_sck<=0;
			spi_mosi<=0;
			dac_clr<=1;
			dac_state<=0;
		end
	else begin
			case(dac_state)
			0: begin
			dac_cs<=1;
			spi_sck<=0;
			spi_mosi<=0;
			dac_clr<=1;
			dac_state<=1;
			end

			1: begin  
			dac_out<={8'b00000000, 4'b0011, 4'b0000,data_out, 4'b0000};
			dac_state<=2;
			end

			2: begin
			dac_cs<=0;
			spi_sck<=0;
			spi_mosi<=dac_out[count-1];

			count<=count-1;
			dac_state<=3; 
			end

			3:begin
			if(count>0)
			begin
			spi_sck<=1;
			dac_state<=2;
			end

			else
			begin spi_sck<=1;
			dac_state<=4;
			end
			end

			4: begin
			spi_sck<=0;
			dac_state<=5;
			end

			5: begin
			dac_cs<=1;
			dac_state<=6;
			end

			6:begin
			dac_state<=dac_state+1;
			end

			//7:begin
			//dac_state<=1;
			//end

			default:begin
			dac_cs<=1;
			spi_mosi<=0;
			spi_sck<=0;
			dac_clr<=1;
			dac_state<=0;
			count<=32;
			end

endcase
end
end
endmodule