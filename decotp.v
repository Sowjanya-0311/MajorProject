module decryptionotp(clk,rst,chiper,plain);
   input clk,rst;
	 input [63:0] chiper;
    output [63:0] plain;
	
	wire [63:0] x1;
	wire [63:0] data,data1,data2,data3,data4,data5,data6;
	bitreversal u2(chiper,data1);
	complement u3(data1,data2);
	bitreversal u4(data2,data);
	lfsr1  u1 (x1, rst, clk);
	
	assign plain[63:0] = data[63:0] ^ x1;
	
	
	
	
	endmodule
	
	module decryptionotp_tb();
	reg clk,rst;
	reg [63:0] chiper;

    wire [63:0] plain;
	
	decryptionotp u1(clk,rst,chiper,plain);
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
chiper = 64'd18446744073701162854;
end

endmodule
	