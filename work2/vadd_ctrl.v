module vadd_ctrl(clk, start, addrsw, addrsr, ena, wea, enr);
  input clk, start;
  output wire [9:0] addrsw, addrsr; 
  output wire ena, wea, enr;

  reg [9:0] i = 0;
  always @(posedge clk) begin 
    if (start)
      i <= i + 1;
  end

  assign addrsw = i - 1;
  assign addrsr = i; 
  assign ena = start && i > 0 && i < 101;
  assign wea = start && i > 0 && i < 101;
  assign enr = start && i < 100;

endmodule


module tb_vadd_ctrl();
  reg clk = 0;
  reg start = 0;
  wire [9:0] addrsw;
  wire [9:0] addrsr; 
  wire ena, wea, enr;

  vadd_ctrl ctrl(clk, start, addrsw, addrsr, ena, wea, enr);
  always #5 clk = ~clk;

  initial begin 
    $monitor($time,, "clk=%0b addrsw=%0d addrsr=%0d ena=%0b wea=%0b enr=%0b", clk, addrsw, addrsr, ena, wea, enr);
    #20;
    #20;
    start=1;
    #20;
    $finish;
  end
endmodule

