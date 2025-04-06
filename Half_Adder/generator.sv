class generator;
  
  packet pkt_g;
  
  mailbox mbx; // LOCAL MAILBOX HANDLE
  
  function new(mailbox gen2drv);
    mbx=gen2drv;
  endfunction
  
  task run();
    begin
      pkt_g=new();
      repeat(5)
        begin
          assert(pkt_g.randomize()); //calling randomize method
          pkt_g.print("GENERATOR");
          mbx.put(pkt_g); //putting packet into mailbox
          #1;
        end
    end
  endtask
  
endclass