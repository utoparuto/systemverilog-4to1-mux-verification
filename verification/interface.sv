interface mux_if(input logic clk);

    logic [3:0] data_in;
    logic [1:0] sel;
    logic       y_out;

    clocking driver_cb @(posedge clk);
        default input #1 output #1;
        output data_in;
        output sel;
        input  y_out;
    endclocking

modport DRIVER  (clocking driver_cb);
modport MONITOR (input data_in, sel, y_out);
endinterface
