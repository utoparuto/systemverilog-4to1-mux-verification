module mux4to1 (
    input  logic [3:0] data_in,
    input  logic [1:0] sel,
    output logic       y_out
);

always_comb begin
    case (sel)
        2'b00 : y_out = data_in[0];
        2'b01 : y_out = data_in[1];
        2'b10 : y_out = data_in[2];
        2'b11 : y_out = data_in[3];
        default: y_out = 1'bx;
    endcase
end
endmodule
