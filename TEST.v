`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:54:15 06/09/2023
// Design Name:   novipiano
// Module Name:   C:/Users/Marina/Desktop/MU_PDS/novipiano/TEST.v
// Project Name:  novipiano
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: novipiano
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module TEST;

	// Inputs
	reg clk;
	reg k1;
	reg k2;
	reg k3;
	reg k4;

	// Outputs
	wire speaker;

	// Instantiate the Unit Under Test (UUT)
	novipiano uut (
		.clk(clk), 
		.k1(k1), 
		.k2(k2), 
		.k3(k3), 
		.k4(k4), 
		.speaker(speaker)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		k1 = 0;
		k2 = 0;
		k3 = 0;
		k4 = 0;
		
		#75 k1=1;
		#120 k1=0;
		#15 k2=1;
		#120 k2=0;
	   #150 k3=1; 
		#120 k3=0;
	   #210 k4=1;
      #250 k4=0;


		// Wait 100 ns for global reset to finish
		#1000 $stop; 
   end      
   always 
	#5 clk=~clk;
      
endmodule

