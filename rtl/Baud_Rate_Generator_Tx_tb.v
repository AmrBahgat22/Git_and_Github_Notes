`timescale 1ns/1ps

module Baud_Rate_Generator_Tx_tb();
	reg	sys_clk		; 		
    reg	rst_n   	;	
 
    wire		baud_rate_tx ;
	
  Baud_Rate_Generator_Tx #(.CLK(64_000_000),.BAUD_RATE(4_000_000))
  	DUT(
		.sys_clk		(sys_clk		)	,		
		.rst_n   		(rst_n			) 	,		
		.baud_rate_tx 	(baud_rate_tx	) 	
	);
	
	
	always #5 sys_clk = ~sys_clk ;
	
	initial begin 
		$dumpfile("Baud_Rate_Generator_Tx.vcd");
		$dumpvars();
		
		sys_clk = 1 ;
		rst_n   = 1 ;  
		#100000		
		$stop;
	end
endmodule