class driver;
    virtual mux_if.DRIVER vif;
    mailbox #(mux_transaction) gen2drv;
  
function new(
        virtual mux_if.DRIVER vif,
        mailbox #(mux_transaction) m
    );
        this.vif     = vif;
        this.gen2drv = m;
endfunction
task run();
        mux_transaction tr;
        forever begin
        gen2drv.get(tr);
              @(vif.driver_cb);
                          vif.driver_cb.data_in <= tr.data_in;
                          vif.driver_cb.sel     <= tr.sel;
      end
  endtask
endclass
