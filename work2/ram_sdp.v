module ram_sdp(clk, ena, enb, wea, addra, addrb, dia, dob);
    input clk, ena, enb, wea;
    input [9:0] addra, addrb;
    input [31:0] dia;
    output [31:0] dob;
    reg [31:0] ram [1023:0];
    reg [31:0] doa, dob;

    always @(posedge clk) begin
        if (ena) begin
            if (wea)
                ram[addra] <= dia;
        end
    end

    always @(posedge clk) begin
        if (enb)
            dob <= ram[addrb];
    end  
endmodule




module tb_ram_sdp();
  reg clk = 0;
  reg ena = 0;
  reg enb = 0;
  reg wea = 0;
  reg [9:0] addra = 0;
  reg [9:0] addrb = 0; 
  reg [31:0] dia = 0;
  wire [31:0] dob;

  ram_sdp ram(clk, ena, enb, wea, addra, addrb, dia, dob);

  always #5 clk = ~clk;

  initial begin 
    $monitor($time,,"ena=%0b dia=%0d dob=%0d", ena, dia, dob); 
    #20 ena = 1; enb=1; wea = 1; addra = 0; addrb = 0; dia=95;
    #20 ena = 1; enb=1; wea = 1; addra = 23; addrb = 0; dia=99;
    #22 ena = 0; enb = 1; wea = 0; addra = 69; addrb = 23; 
    #20 $finish;
  end
endmodule
