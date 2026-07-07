class mux_transaction;
      rand logic [3:0] data_in;
      rand logic [1:0] sel;
      logic y_out;
endclass
class generator;
        mailbox #(mux_transaction) gen2drv;
        int num_transactions = 20;
task run();
         mux_transaction tr;
         repeat(num_transactions) begin
         tr = new();
             assert(tr.randomize());
                  gen2drv.put(tr);
             end
        endtask
endclass
