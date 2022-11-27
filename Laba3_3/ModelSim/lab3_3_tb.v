`timescale 1ns / 1ps

module testbench;

parameter PERIOD = 20;

wire [35:0] gpio;        
wire        o_clk;
reg         i_clk, i_rst_n;
reg [9:0]   i_phase;

integer i = 0;

lab3_3 lab3_3_inst(.CLOCK_50(i_clk), 
                        .KEY ({i_rst_n, 1'b0}),
                        .SW (i_phase), 
                        .GPIO (gpio)
                        );

assign o_clk = gpio[0];

initial begin
    i_clk = 0;
    forever #(PERIOD/2) i_clk = ~i_clk;
end

initial begin
    i_rst_n = 1'b0;
    i_phase = 0;

    @(negedge i_clk) i_rst_n = 1;

    repeat(10) @(negedge i_clk);

    for (i=15; i<1024; i=i+10) begin   
        i_phase = i;         
        repeat(50*i) @(negedge i_clk);
    end

    $finish;  
end
  
endmodule
