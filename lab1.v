module lab1(Clk, Res, Out, Sel);

input Clk, Res, Sel;
output Out;
wire dA,dC;

Count Y(Clock, Reset, dA, dC);
and_xor  X(dA, dC, Select, Out);

endmodule

module Count (Clk, Res,dA,dB,dC);
	input Clk, Res;
	output dA,dB,dC;
	reg dA,dB,dC;
always@(posedge Clk or negedge Res)
if(Res == 1'b0)

	begin
	dA <= 1'b0;
	dB <= 1'b0;
	dC <= 1'b0;
	end
else

	begin
	dA <= (dA&~dB)|(~dA&dB&dC)|(dA&~dC) ;
	dB <= (dB^dC);
	dC <= ~dC;
	end
	
endmodule

module and_xor (A, C, Sel, Out);
input A,C,Sel;
output Out;

wire And=A&C;
wire Xor=A^C;

assign Out = (Sel == 1'b0) ? And : Xor ;

endmodule
