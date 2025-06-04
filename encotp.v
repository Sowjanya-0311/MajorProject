module encryptionotp(clk,rst,plain,chiper);
    input clk,rst;
	 input [63:0] plain;
    output [63:0] chiper;
	
	wire [63:0] x1;
	wire [63:0] data,data1,data2;
	
	lfsr1  u1 (x1, rst, clk);
	
	assign data[63:0] = plain[63:0] ^ x1;
	
	
	bitreversal u2(data,data1);
	complement u3(data1,data2);
	bitreversal u4(data2,chiper);
	endmodule
	
	module encryptionotp_tb();
	reg clk,rst;
	reg [63:0] plain;
    wire [63:0] chiper;
	
	encryptionotp u1(clk,rst,plain,chiper);
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

	