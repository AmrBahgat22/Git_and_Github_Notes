module Parity_Generator_Tx(
	
	// input	wire				parity_en 		,
	input	wire	[7:0]		data_in_tx_par 	,
	
	output 	wire				parity_out      // 0 = even, 1 = odd
	
);
	// wire		parity_bit ;

	assign	parity_out = ~(^data_in_tx_par) ;
	
	// assign	parity_out = (parity_en) ? ~parity_bit : parity_bit ;
	
endmodule



