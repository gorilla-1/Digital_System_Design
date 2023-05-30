module lab2(nReset,Clock,Enable,Co1[3:0],Co10[3:0],Co100[3:0]);

input nReset,Clock,Enable;
output [3:0] Co1;
output [3:0] Co10;
output [3:0] Co100;
wire NextEn1,NextEn2,NextEn3;

bcd_counter a(nReset,Clock,Enable,Co1[3:0],NextEn1);
bcd_counter b(nReset,Clock,NextEn1,Co10[3:0],NextEn2);
bcd_counter c(nReset,Clock,NextEn2&NextEn1,Co100[3:0],NextEn3);

endmodule

module bcd_counter(nReset,Clock,Enable,counter[3:0],next);

input nReset,Clock,Enable;
output reg [3:0] counter,next;

always @(posedge Clock)
begin
	if (nReset == 1'b0)
		begin
			counter[3:0] <= 4'd0;
			next = 1'b0;
		end
	else
		begin
			if(Enable==1'b0)
			counter[3:0]<=counter[3:0];				
			else
				begin
					if(counter[3:0] < 4'd9)
					begin
						counter[3:0]<=counter[3:0]+4'd1;
						if (counter[3:0]==4'd8)
							next=1'b1;
						else
							next=1'b0;
					end
					else if(counter[3:0]==4'd9)
					begin
						next=1'b0;
						counter[3:0]<=4'd0;
					end
					else 
					next=1'b0;
				end
			end
		end
endmodule 