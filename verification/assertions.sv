always @(posedge clk) begin
    AST_OUTPUT_VALID:
    assert (
        (y_out === data_in[0]) ||
        (y_out === data_in[1]) ||
        (y_out === data_in[2]) ||
        (y_out === data_in[3])
    )
    else
        $error("Output not matching any input"); 
     AST_NO_UNKNOWN:
    assert (!$isunknown(y_out))
    else
        $error("Unknown output detected");
end
property p_sel00;
    @(posedge clk)
    (sel == 2'b00) |-> (y_out == data_in[0]);
endproperty

AST_SEL00:
assert property (p_sel00)
else
    $error("SEL=00 : y_out != data_in[0]");
