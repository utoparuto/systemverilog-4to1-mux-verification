class scoreboard;
    mailbox #(mux_transaction) mon2scb;
    int pass_cnt = 0;
    int fail_cnt = 0;
task run();
        mux_transaction tr;
        logic exp_out;
            forever begin
            mon2scb.get(tr);
            exp_out = tr.data_in[tr.sel];
            if (tr.y_out === exp_out) begin
                $display(
                    "PASS : sel=%0b data_in=%b y=%b",
                    tr.sel,
                    tr.data_in,
                    tr.y_out
                );
                pass_cnt++;
                end
            else begin
                 $error(
                    "FAIL : exp=%b got=%b",
                    exp_out,
                    tr.y_out
                );   fail_cnt++;
             end
          end
     endtask
endclass
