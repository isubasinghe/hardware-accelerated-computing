module vadd_ctrl(clk, start, addr, enw, wea, enr, i);
  input clk;
  input start;
  output reg [9:0] addr = 0;
  output reg enw = 0;
  output reg wea = 0;
  output reg enr = 0;
  output reg [9:0] i = 0;

  always @(posedge clk) begin
    i <= i + 1;
  end
endmodule


module tb_vadd_ctrl();
  reg clk = 0;
  reg start = 0;
  wire [9:0] addr = 0;
  wire ena = 0;
  wire wea = 0;
  wire enr = 0;
  wire [9:0] i = 0;

  vadd_ctrl ctrl(clk, start, addr, ena, wea, enr, i);
  always #5 clk = ~clk;

  initial begin
    $monitor($time,, "clk=%0b start=%0b addr=%0d ena=%0d wea=%0b enr=%0b i=%0d", clk, start, addr, ena, wea, enr, i);
    #20
    #20
    $finish;

  end
endmodule



