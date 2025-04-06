// Code your testbench here
// or browse Examples

`include "ha_interface.sv"
`include "packet.sv"
`include "generator.sv"
`include "driver.sv"
`include "wr_monitor.sv"
`include "ref_model.sv"
`include "rd_monitor.sv"
`include "scoreboard.sv"
`include "environment.sv"

module top();
  
  environment env;
  
  ha_intf pif();
  
  ha DUT (.a(pif.a),.b(pif.b),.sum(pif.sum),.carry(pif.carry));
  
  initial
    begin
      env=new(pif);
      env.run();
    end
endmodule