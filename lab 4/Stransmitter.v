module Stransmitter(input wire clk,send,
					input wire [7:0] PDin,
					output wire SDout,SCout);

reg[7:0] SR;

always @(posedge clk)
	begin
		if(send == 1'b1)
			SR[7:0]<=PDin[7:0];
			
		else
			SR[7:1] <= SR[6:0];
			SR[0] <= 1'b0;
	end
	
assign SDout = (SR[7]|send);
assign SCout = clk;
					
endmodule 