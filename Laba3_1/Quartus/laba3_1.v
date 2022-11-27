module laba3_1(CLOCK_50, KEY, GPIO);

input           CLOCK_50;
input   [1:0]   KEY;
output  [35:0]  GPIO;

parameter       DIV_BY = 7;
localparam      N = $clog2(DIV_BY);

reg     [N-1:0] cnt;

wire    sys_clk         = CLOCK_50;
wire    sys_rst_n       = KEY[1];
wire    sync_rst_cnt    = (DIV_BY-1) == cnt;

assign GPIO[0] = sync_rst_cnt;

always @(posedge sys_clk, negedge sys_rst_n) begin
    if(~sys_rst_n) begin
        cnt <= 0;
    end else begin
        if (sync_rst_cnt)
            cnt <= 0;
        else
            cnt <= cnt + 1'b1;
    end
end


endmodule