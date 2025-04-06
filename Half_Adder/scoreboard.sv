class scoreboard;
  
  packet pkt_a,pkt_ref;
  
  mailbox ref2sbc;
  mailbox rmon2sbc;
  
  function new(mailbox ref2sbc,rmon2sbc);
    this.rmon2sbc=rmon2sbc;
    this.ref2sbc=ref2sbc;
  endfunction
  
  //get the data from ref model and rmon using task run
  task run;
    forever begin
      rmon2sbc.get(pkt_a);
      ref2sbc.get(pkt_ref);
      
      //compare the actual input and ref input
      if((pkt_a.a == pkt_ref.a) && (pkt_a.b == pkt_ref.b))
        begin
          //compare the outputs
          if((pkt_a.sum == pkt_ref.sum) && (pkt_a.carry == pkt_ref.carry))
            begin
              $display(" TEST PASS ");
              pkt_a.print("ACTUAL DATA");
              pkt_ref.print("REFERANCE DATA"); 
            end
          else 
            begin
              $display(" TEST FAIL ");
              pkt_a.print("ACTUAL DATA");
              pkt_ref.print("REFERANCE DATA");
            end
        end
      else
        begin
          $display("INVALID: TEST FAILS DUE TO INPUT MISMATCH");
          pkt_a.print("ACTUAL DATA");
          pkt_ref.print("REFERANCE DATA");
        end
    end
  endtask
  
endclass