module twostagedecryptionotp(clk,rst,chiper,plain);
	input clk,rst;
	 input [63:0] chiper;
    output [63:0] plain;
	
	wire [63:0] x1,x2;
	wire [63:0] data,data1,data2,data3,data4,data5,data6,data7;
	bitreversal u2(chiper,data);
	complement u3(data,data1);
	bitreversal u4(data1,data2);
	lfsr1  u1 (x1, rst, clk);
	
	assign data3[63:0] = data2[63:0] ^ x1;
   bitreversal u9(data3,data4);
	bitreversal u5(data4,data5);
	complement u6(data5,data6);
	bitreversal u7(data6,data7);
	lfsr1  u8 (x2, rst, clk);
	
	assign plain[63:0] = data7[63:0] ^ x2;
	
	
	endmodule
	
	
	module twostagedecryptionotp_tb();
	reg clk,rst;
	reg [63:0] chiper;
    wire [63:0] plain;
	
	twostagedecryptionotp u1(clk,rst,chiper,plain);
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
//chiper = 64'd11024812987322990720;
chiper = 64'd14195347124991819904;
end

endmodule

