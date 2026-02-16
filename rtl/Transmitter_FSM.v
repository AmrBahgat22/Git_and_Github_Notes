module Transmitter_FSM(
	
	input	wire	baud_rate_tx	,
	input	wire	rst_n 			,
	input	wire	tx_enable 		,
	
	output	reg		busy			,
	output	reg		load			,
	output	reg		shift

); 

	localparam	IDLE  = 2'b00 , 	
				LOADE = 2'b01 ,
				SHIFT = 2'b10 ,
				WAIT  = 2'b11 ;

	reg		[1:0]	current_state , next_state ;
	reg		[3:0]	counter		;
	
always@(posedge baud_rate_tx or negedge rst_n) 
begin
	if(!rst_n) begin
		current_state <= IDLE ;
	end else begin
		current_state <= next_state ;
		if(shift) begin 
			counter<=counter +1 ; 
		end
	end
end

always@(*) 
begin
	case(current_state)
	
	IDLE : begin
		busy	=	0	;
		load	=	0	;
		shift	=	0	;
		counter = 	0 	;
		
		if(tx_enable)begin
			next_state = LOADE	;
		end else begin
			next_state = IDLE	;
		end
		
	end
	
	LOADE : begin
		busy	=	1	;
		load	=	1	;
		shift	=	0	;
		counter	=	0	;
		
		next_state = SHIFT	;
	end
	
	SHIFT : begin
		busy	=	1	;
		load	=	0	;
		shift	=	1	;
		
		if(counter < 12) begin
			next_state = SHIFT ;
		end else begin
			next_state = WAIT	;
		end 
		
	end
	
	WAIT : begin
		busy	=	1	;
		load	=	0	;
		shift	=	0	;
		next_state = IDLE	;	
	end
		
	endcase
end
endmodule 