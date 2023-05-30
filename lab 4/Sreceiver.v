module Sreceiver(input wire SCin, SDin,
				 output wire [7:0] PDout,
				 output reg PDready);

reg [2:0] cntr;
reg SRshift;
reg [7:0] SR;

always @(posedge SCin)
	begin
		if(SRshift == 1'b0)
			cntr[2:0]<=3'b000;
		
		else
			begin
				cntr[2:0]<=cntr[2:0]+1'b1;
				SR[7:0] <= {SR[6:0],SDin};
			end
			
		
		if (cntr[2:0]==3'd7)
			PDready <= 1'b1;
		
		else
			PDready <= 1'b0;
	end
always @(posedge SCin)
	begin
		if (SDin && cntr[2:0] != 3'd7)		
			SRshift <= 1'b1;
		else if (cntr[2:0] == 3'd7) 
			SRshift <= 1'b0;
		
		else 
			SRshift <= SRshift;
	end
assign PDout[7:0]=SR[7:0];

endmodule