module twoencryptionotp(clk,rst,plain,chiper);
	 input clk,rst;
	 input [63:0] plain;
    output [63:0] chiper;
	
	wire [63:0] x1,x2;
	wire [63:0] data,data1,data2,data3,data4,data5,data6,data7;
	
	lfsr1  u1 (x1, rst, clk);
	
	assign data[63:0] = plain[63:0] ^ x1;
	
	bitreversal u2(data,data1);
	complement u3(data1,data2);
	bitreversal u4(data2,data3);
	bitreversal u9(data3,data4);
	lfsr1  u8 (x2, rst, clk);
	
	assign data5[63:0] = data4[63:0] ^ x1;

	
	bitreversal u5(data5,data6);
	complement u6(data6,data7);
	bitreversal u7(data7,chiper);

	endmodule
	
	module twoencryptionotp_tb();
	reg clk,rst;
	reg [63:0] plain;
    wire [63:0] chiper;
	
	twoencryptionotp u1(clk,rst,plain,chiper);
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
plain = 64'd35;
end

endmodule
