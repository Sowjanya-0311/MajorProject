module encryption(clk,rst,plain,chiper);
   input clk,rst;
	 input [63:0] plain;
    output [63:0] chiper;
	
	wire [63:0] x1;
	
	lfsr1  u1 (x1, rst, clk);
	
	assign chiper[63:0] = plain[63:0] ^ x1;

	endmodule
	
	module encryption_tb();
	reg clk,rst;
	reg [63:0] plain;
    wire [63:0] chiper;
	
	encryption u1(clk,rst,plain,chiper);
	initial
begin
clk=1'b0;
forever #1 clk=~clk;
end

initial
begin
rst=1'b1;
 #5 rst=1'b0;
end
initial
begin
plain = 64'd25;
end

endmodule
