module vadd(
    input clk,
    input start,
    input ena,
    input [9:0] addra,
    input [31:0] dia,
    input enb,
    input [9:0] addrb,
    input [31:0] dib,
    input ens,
    input [9:0] addrs,
    output [31:0] dos
);
  
  /* reg t = 1; 
  reg f = 0;

  wire [31:0] outa;
  wire [31:0] outb;

  reg add_res [31:0];

  ram_sdp rama(clk, ena, t, ena, addra, _, dia, outa);

  ram_sdp ramb(clk, enb, _, _, addrb, _, dib, outb);

  ram_sdp rams(clk, ens, _, _, _, addrs, dis, _);

  always @(posedge clk) begin 
    if (start) begin 
    end
  end */

endmodule

