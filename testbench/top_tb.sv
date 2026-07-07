module tb_top;
logic clk = 0;
always #5 clk = ~clk;

mux_if intf(clk);

mux4to1 dut (
.data_in (intf.data_in),
.sel     (intf.sel),
.y_out   (intf.y_out)
);

mailbox #(mux_transaction) gen2drv = new();
mailbox #(mux_transaction) mon2scb = new();

generator gen;
driver drv;
monitor mon;
scoreboard scb;

  initial begin
gen = new();
drv = new(intf, gen2drv);
mon = new(intf, mon2scb);
scb = new();

gen.gen2drv = gen2drv;
drv.gen2drv = gen2drv;
mon.mon2scb = mon2scb;
scb.mon2scb = mon2scb;

fork
    gen.run();
    drv.run();
    mon.run();
    scb.run();
join_none
#300;
$display("PASS COUNT = %0d", scb.pass_cnt);
$display("FAIL COUNT = %0d", scb.fail_cnt);
$finish;
end
endmodule
