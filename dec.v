module decryption(clk,rst,chiper,plain);
    input clk,rst;
	 input [63:0] chiper;
    output [63:0] plain;
	
	wire [63:0] x1;
	
	lfsr1  u1 (x1, rst, clk);
	
	assign plain[63:0] = chiper[63:0] ^ x1;

	
	endmodule
	
		module decryption_tb();
   reg clk,rst;
	reg [63:0]chiper;
    wire [63:0] plain;
	
	decryption u1(clk,rst,chiper,plain);
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
chiper = 64'd8388761;
end

endmodule
	