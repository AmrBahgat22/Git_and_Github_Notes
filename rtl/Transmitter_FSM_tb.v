module Transmitter_FSM_tb(); 
	
	reg			baud_rate_tx	;
	reg			rst_n 			;
	reg			tx_enable 		;
	
	wire		busy			;
	wire		load			;
	wire		shift           ;

	Transmitter_FSM DUT (
		.baud_rate_tx	(baud_rate_tx	)	,
	    .rst_n 			(rst_n 			)	,
	    .tx_enable 		(tx_enable 		)	,
		.busy  			(busy			)	,
		.load  			(load			)	,
		.shift 			(shift			)
	);
	
	always #125 baud_rate_tx = ~baud_rate_tx ;
	
	initial begin 
		$dumpfile("dump.vcd");
		$dumpvars();
		baud_rate_tx = 1 ;
		rst_n        = 1 ;
		#250
		rst_n = 0 ;
		#250 
		rst_n = 1 ;
		#250
		tx_enable = 1 ;
		
		#4500
		$stop;
		
	
	end 

endmodule