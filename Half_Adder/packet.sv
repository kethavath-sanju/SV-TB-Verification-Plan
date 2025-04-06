class packet;
  
  //INPUTS 
  rand bit a,b;
  
  //OUPTUT 
  bit sum,carry;
  
  function print(string name);
    $display("********** %0s **********",name);
    $display("INPUTS ARE A=%0b B=%0b",a,b);
    $display("OUTPUTS ARE SUM=%0b CARRY=%0b",sum,carry);
  endfunction
  
endclass