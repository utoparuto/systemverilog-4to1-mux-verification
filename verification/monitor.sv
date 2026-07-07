class monitor;
    virtual mux_if.MONITOR vif;
    mailbox #(mux_transaction) mon2scb;
function new(
        virtual mux_if.MONITOR vif,
        mailbox #(mux_transaction) m
    );
        this.vif     = vif;
        this.mon2scb = m;
endfunction
task run();
        mux_transaction tr;
        forever begin
             tr = new();
           @(posedge vif.clk);
 #1;      tr.data_in = vif.data_in;
            tr.sel     = vif.sel;
            tr.y_out   = vif.y_out;

            mon2scb.put(tr);
       end
   endtask
endclass
