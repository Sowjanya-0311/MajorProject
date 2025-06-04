`timescale 1ns/1ns
module lfsr1(out, rst, clk);

input clk,rst;
output [63:0]out;
reg [63:0] temp;
wire w1;
assign w1 = temp[1] ^ temp[0];
always @(posedge clk)
begin

if(rst)
temp <= 64'b0000001000000010;

else 
begin
//temp <= {w1, temp[15], temp[14], temp[13],temp[12], temp[11], temp[10],temp[9],temp[8],temp[7], temp[6], temp[5],temp[4], temp[3], temp[2],temp[1]};
temp <= {w1,temp[63:1]};
end

end
assign out = temp;
endmodule

module test_lfsr;

reg clk,rst;
wire [63:0]t;

lfsr l1(.clk(clk), .rst(rst), .out(t));

initial
begin
clk=1'b0;
forever #1 clk=~clk;
end

initial
begin
rst=1'b0;
#5 rst=1'b1;
end



endmodule

