module RAM_32x32( reset, clk, addr, data_in, cs, rw, data_out);
parameter N = 32, M = 5;
input wire reset, clk, cs, rw;
input wire [N-1:0] data_in;
input wire [M-1:0] addr;
output wire [N-1:0] data_out;
reg [N-1:0] mem [M-1:0];
reg [M-1:0] addr_reg;

always@(posedge clk)
begin
    if (cs)
        begin
        if (reset)
            begin
            mem[addr] <= 32'h000000;
            end
        else if (rw)
            begin
            mem[addr] <= data_in;
            end
        else
            begin
            addr_reg <= addr;
            end    
                  
        end
end
assign data_out = mem[addr_reg];
endmodule