module ROM_8x4(
input clk,en,
input [2:0] addr,
output reg [3:0] data_out
    );
reg [3:0] mem [2:0];

always@(posedge clk)
begin
    if(en)
        data_out <= mem[addr];
    else 
        data_out <= 4'bxxxx;    
end

initial
begin
    mem[0] = 4'b0000;
    mem[1] = 4'b0010;
    mem[2] = 4'b0110;
    mem[3] = 4'b1001;
    mem[4] = 4'b0001;
    mem[5] = 4'b1001;
    mem[6] = 4'b1100;
    mem[7] = 4'b1111;
end
endmodule
