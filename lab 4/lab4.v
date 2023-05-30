module lab4(input wire clk,send,
			input wire [7:0] Pdin,
			output wire [7:0] PDout,
			output wire PDready, SClk, SDout);
			

Stransmitter tr(.clk(clk), .send(send),.PDin(Pdin),.SDout(SDout),.SCout(SClk));
Sreceiver rc(.SCin(SClk),.SDin(SDout),.PDout(PDout),.PDready(PDready));


endmodule