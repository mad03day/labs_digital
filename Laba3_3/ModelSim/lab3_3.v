module lab3_3(CLOCK_50, KEY, SW, GPIO);

input           CLOCK_50;
input   [1:0]   KEY;
input   [9:0]   SW;
output  [35:0]  GPIO;

reg     [31:0]   cnt_nco;
reg     [31:0]   phase_step;

wire    sys_clk     = CLOCK_50;
wire    sys_rst_n   = KEY[1];
wire    preload_cnt = cnt_nco[31];

assign GPIO[0] = preload_cnt;

always @(posedge sys_clk, negedge sys_rst_n) begin
    if(~sys_rst_n) begin
        phase_step <= 0;
    end else begin
        phase_step <= {4'd0, SW, 18'd0};   //for simplicity here we dont use synchronization
    end
end

always @(posedge sys_clk, negedge sys_rst_n) begin
    if(~sys_rst_n) begin
        cnt_nco <= 'hFFFFFFFF;
    end else 
	begin
            cnt_nco <= cnt_nco - phase_step;
    	end
end

endmodule
