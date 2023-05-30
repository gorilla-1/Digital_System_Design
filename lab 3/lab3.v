module lab3(input wire clk,SwOut,output wire SwOutdb1, SwOutdb2);

debouncer1 db1(SwOut,clk,SwOutdb1);
debouncer2 db2(SwOut,clk,SwOutdb2);

endmodule 

module debouncer1(SwOut,clk,swoutdb);

input wire SwOut,clk;
output reg swoutdb;

reg [3:0] debouncer1;


	always@(posedge clk)
	begin
		debouncer1[3:1]<=debouncer1[2:0];
		debouncer1[0]<=SwOut;
		
		if (debouncer1[3:1]==3'b111 && SwOut ==1)
		swoutdb<=1'b1;
		
		else if(debouncer1[3:0]== 4'b1000 && SwOut == 0) 
		swoutdb<=1'b0;
		
		else 
		swoutdb<=swoutdb;
	end
endmodule
 
module debouncer2(SwOut,clk,swoutdb);

input wire SwOut,clk;
output reg swoutdb;

reg [3:0] debouncer;
	always@(posedge clk)
	begin
		
		debouncer[3:1]<=debouncer[2:0]; //shift register
		debouncer[0]<=SwOut;
		
		if(debouncer[3:1] == 3'b100 && SwOut==0)//1110 1100 1101 
		swoutdb<=1'b0;
		
		else if(debouncer[3:0]==4'd0 && SwOut==1) //0001 
		swoutdb<=1'b1;
		
		else  
		swoutdb<=swoutdb;
	
	end
endmodule
