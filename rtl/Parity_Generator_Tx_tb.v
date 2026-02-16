`timescale 1ns/1ps

module Parity_Generator_Tx_tb();
	// reg			parity_en		; 		
  	reg	[7:0]	data_in_tx_par   	;	
 
    wire		parity_out ;
	
  Parity_Generator_Tx DUT(
		//.parity_en		(parity_en		)	,		
		.data_in_tx_par  (data_in_tx_par) 	,		
		.parity_out 	(parity_out	) 	
	);
	
	
	initial begin 
        $dumpfile("dump.vcd");
		$dumpvars();
      
		// parity_en = 1 ;
      	data_in_tx_par = 8'd5 ;
      	#250
      	// parity_en = 1 ;
      	data_in_tx_par = 8'd4 ;
      	#250
      	// parity_en = 0 ;
      	data_in_tx_par = 8'd7 ;
        #250
		$stop;
	end
endmodule