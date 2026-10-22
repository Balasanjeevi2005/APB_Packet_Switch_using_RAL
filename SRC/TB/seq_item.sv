class transaction extends uvm_sequence_item;
  
  rand bit presetn;
  rand bit psel;
  rand bit penable;
  rand bit pwrite;
  rand bit[`ADDR_W-1:0]paddr;
  rand bit[`DATA_W-1:0]pwdata;
  
  logic [`DATA_W-1:0]prdata;
  logic pready;
  logic pslverr;
  logic irq;
  
  constraint c1{ psel dist{1:=1,0:=1}; }
  constraint c2{ pwrite dist{1:=1,0:=1}; }
  constraint c3{ penable dist{1:=1,0:=1}; }
  
  `uvm_object_utils_begin(transaction)
  
  `uvm_field_int(presetn,UVM_ALL_ON)
  `uvm_field_int(psel,UVM_ALL_ON)
  `uvm_field_int(penable,UVM_ALL_ON)
  `uvm_field_int(pwrite,UVM_ALL_ON)
  `uvm_field_int(paddr,UVM_ALL_ON)
  `uvm_field_int(pwdata,UVM_ALL_ON)
   
  `uvm_field_int(prdata,UVM_ALL_ON)
  `uvm_field_int(pready,UVM_ALL_ON)
  `uvm_field_int(pslverr,UVM_ALL_ON)
  `uvm_field_int(irq,UVM_ALL_ON)
  
  `uvm_object_utils_end
  
  function new(string name = "transaction");
    super.new(name);
  endfunction
  
endclass
