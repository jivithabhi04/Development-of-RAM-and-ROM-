module RAM_FOUR_32x32(rst, reset, clk, addr, data_in, rw, data_out, cs_in);
parameter N = 32, M = 5;
input wire [1:0] cs_in;
input wire reset, clk, rw, rst;
input wire [N-1:0] data_in;
input wire [M-1:0] addr;
output wire [N-1:0] data_out;
reg [3:0] de_out;

// Instantiation of memory 1
RAM_32x32 memory_1 (
.clk(clk),
.rw(rw),
.reset(reset),
.addr(addr),
.data_in(data_in),
.data_out(data_out),
.cs(de_out[0])
);

// Instantiation of memory 2
RAM_32x32 memory_2 (
.clk(clk),
.rw(rw),
.reset(reset),
.addr(addr),
.data_in(data_in),
.data_out(data_out),
.cs(de_out[1])
);

// Instantiation of memory 3
RAM_32x32 memory_3 (
.clk(clk),
.rw(rw),
.reset(reset),
.addr(addr),
.data_in(data_in),
.data_out(data_out),
.cs(de_out[2])
);
 
// Instantiation of memory 4
RAM_32x32 memory_4 (
.clk(clk),
.rw(rw),
.reset(reset),
.addr(addr),
.data_in(data_in),
.data_out(data_out),
.cs(de_out[3])
);

always@(posedge clk or posedge rst)
    begin
        if (rst) 
        de_out <= 4'b0000;
        else
        begin
            case (cs_in)
            2'b00 : de_out <= 4'b0001;
            2'b01 : de_out <= 4'b0010;
            2'b10 : de_out <= 4'b0100;
            2'b11 : de_out <= 4'b1000;
            default : de_out <= 4'b0000;
            endcase
        end 
    end
endmodule