module vadd(
    input clk,
    input start,
    input ena,          // PS enable signal to write port of vector $a$ RAM
    input [9:0] addra,  // PS address signal to write port of vector $a$ RAM
    input [31:0] dia,   // PS data in signal to write port of vector $a$ RAM
    input enb,          // PS enable signal to write port of vector $b$ RAM
    input [9:0] addrb,  // PS address signal to write port of vector $b$ RAM
    input [31:0] dib,   // PS data in signal to write port of vector $b$ RAM
    input ens,          // PS enable signal to read port of vector $s$ RAM
    input [9:0] addrs,  // PS address signal to read port of vector $s$ RAM
    output [31:0] dos,   // Data out signal from read port of vector $s$ RAM to PS
    output wire [31:0] doa, 
    output wire [31:0] dob, 
    output wire [31:0] dis, 
    output wire [9:0] addrsw,
    output wire [9:0] addrsr, 
    output wire enw, 
    output wire wea, 
    output wire enr
);
    // define internal wires here
    /* wire [31:0] doa;
    wire [31:0] dob;
    wire [31:0] dis;
    wire [9:0] addrsw;
    wire [9:0] addrsr;
    wire enw;
    wire wea;
    wire enr; */

    // instantiate RAM blocks here
    ram_sdp ramA(clk, ena, enr, ena, addra, addrsr, dia, doa);

    ram_sdp ramB(clk, enb, enr, enb, addrb, addrsr, dib, dob);

    ram_sdp ramS(clk, enw, ens, enw, addrsw, addrs, dis, dos);



    // instantiate vadd control here
    vadd_ctrl ctrl(clk, start, addrsw, addrsr, enw, wea, enr);


    // add combinational logic for 32-bit adder here
    assign dis = doa + dob;

endmodule


module tb_vadd();
  reg clk = 0;
  reg start = 0;
  reg ena = 0; 
  reg [9:0] addra = 0; 
  reg [31:0] dia = 4;
  reg enb = 0;
  reg [9:0] addrb = 0;
  reg [31:0] dib = 6;
  reg ens = 0;
  reg [9:0] addrs = 0;
  reg [31:0] dos;

  wire [31:0] vdoa;
  wire [31:0] vdob;
  wire [31:0] vdis;
  wire [9:0] vaddrsw;
  wire [9:0] vaddrsr;
  wire ienw, iwea, ienr;

  vadd vadder(clk, start, ena, addra, dia, enb, addrb, dib, ens, addrs, dos, vdoa, vdob, vdis, vaddrsw, vaddrsr, ienw, iwea, ienr);
  
  always #5 clk = ~clk;
  initial begin
    $monitor($time,, "start=%0b ena=%0b addra=%0d dia=%0d enb=%0b addrb=%0d dib=%0d ens=%0b addrs=%0d dos=%0d vdoa=%0d vdob=%0d vdis=%0d vaddrsw=%0d vaddrsr=%0d ienw=%0b iwea=%0b, ienr=%0b", start, ena, addra, dia, enb, addrb, dib, ens, addrs, dos, vdoa, vdob, vdis, vaddrsw, vaddrsr, ienw, iwea, ienr);
    ena=1;
    enb=1;
    #10;
    addra = 1;
    addrb = 1;
    dia=2;
    dib=3;
    #10
    start=1;
    ens=1;
    #5;
    #5;
    #20;
    addrs=1;
    #5;
    $finish;
  end
endmodule
