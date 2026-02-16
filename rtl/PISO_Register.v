module PISO_Register(
	
	input	wire			baud_rate_tx ,
	input	wire			rst_n 		 ,	
	input	wire			load 		 ,
	input	wire			shift 		 ,
	input	wire			parity_bit 	 ,

	input	wire	[0:7]	p_data_in 	 ,
	
	output	reg				s_data_out 
	
);

	// internal signal 
	
	reg	[10:0]	p_data_in_reg 	; 

always@(posedge baud_rate_tx or negedge rst_n) 
begin 
	if(!rst_n)begin
	
		s_data_out    <= 1 ;	// Ideal condition in UART interface 
		p_data_in_reg <= 0 ;
		
	end else begin
	
		if(load && !shift)begin

			//p_data_in_reg <= {1'b1,parity_bit,p_data_in,1'b0} ;
			 p_data_in_reg <= {1'b0,p_data_in,parity_bit,1'b1} ;

		end else if(shift && !load ) begin
		
			s_data_out     <= p_data_in_reg[10]   ; 
			p_data_in_reg  <= p_data_in_reg << 1 ; 
			
		end else begin
		
			s_data_out <= 1 ;
			
		end
	end
end 
endmodule 