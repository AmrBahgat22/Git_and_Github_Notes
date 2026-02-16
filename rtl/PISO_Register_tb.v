module PISO_Register_tb();
	
	reg			baud_rate_tx ;
	reg			rst_n 		 ;	
	reg			load 		 ;
	reg			shift 		 ;
	reg			parity_bit 	 ;

	reg	[7:0]	p_data_in 	 ;
	
	wire		s_data_out 	  ;
	

	PISO_Register DUT (
	
		.baud_rate_tx 	(baud_rate_tx 	) ,
		.rst_n 		 	(rst_n 			) ,
		.load 		 	(load 		 	) ,
		.shift 		 	(shift 		 	) ,
	    .parity_bit  	(parity_bit  	) ,

	    .p_data_in 	 	(p_data_in 	 	) ,
		.s_data_out		(s_data_out     )
		
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
		load 		 = 0 ;
		parity_bit 	 = 0 ;
		shift 		 = 0 ;
		
		#250 
		load = 1 ;
		parity_bit = 0 ;
		shift = 0 ;
		p_data_in = 8'b00001111 ;
		
		#250
		load = 0 ;
		shift = 1 ;
		
		#2750
		
		load  = 0 ;
		shift = 0 ;
		
		#250
		/*
		load = 1 ;
		parity_bit = 0 ;
		shift = 0 ;
		p_data_in = 8'b11110000 ;
		
		#250
		shift = 1 ;
		#3750
		*/
		$stop;
	end
endmodule