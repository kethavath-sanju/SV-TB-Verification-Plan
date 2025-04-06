class ref_model;
  packet pkt_wm,pkt_ref;
  
  mailbox mbx;
  mailbox ref2sbc;
  
  function new(mailbox wmon2rm,mailbox ref2sbc);
    mbx=wmon2rm;
    this.ref2sbc=ref2sbc;
  endfunction
  
  task run();
    forever
      begin
        pkt_ref=new(); 		// LOCAL OBJECT OF REF MODEL
        mbx.get(pkt_wm);	// PACKET RECEIVED FROM WRITE MONIOR
                
        // COPY THE INPUT FROM WM TO REF MODEL
        pkt_ref.a=pkt_wm.a;
        pkt_ref.b=pkt_wm.b;
        
        //REFERANCE LOGIC FOR HA
        {pkt_ref.carry,pkt_ref.sum}=pkt_ref.a+pkt_ref.b;
        
        //pkt_ref.print("REFERANCE OUTPUT");
        
        //send the pkt_ref to sbc via ref2sbc mailbox: put method
        ref2sbc.put(pkt_ref);
      end
  endtask
  
endclass