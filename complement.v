module complement(data,compdata);
	 input [63:0] data;
    output [63:0] compdata;
	
	assign compdata = ~data;
	
	endmodule
	