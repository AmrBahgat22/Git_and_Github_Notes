module Baud_Rate_Generator_Tx#(parameter CLK = 100_000_000 ,
										 BAUD_RATE = 9600  )
(
	// ports 
	
	input	wire	sys_clk 		,
	input	wire	rst_n   		,
	
	output	reg		baud_rate_tx 

);
	// internal signal
	wire	[10:0]	divisor 	;
  reg		[10:0]	counter = 0 ;
	
	assign divisor = CLK / BAUD_RATE ;
	
	
always@(posedge sys_clk , negedge rst_n) begin 
	if(!rst_n) begin
		baud_rate_tx <= 0 ;
		counter      <= 0 ;		
	end else begin
      	//counter <= counter + 1 ;
		if (counter == divisor-1 ) begin 
			counter 	 <= 0 ;
			baud_rate_tx <= 1 ;		// 1-cycle pulse
		end else begin
			counter 	 <= counter + 1 ;
			baud_rate_tx <= 0 ;
		end	
	end
end 

endmodule 