class top_adapter extends uvm_reg_adapter;
  
  `uvm_object_utils(top_adapter)
  
  function new(string name = "top_adapter");
    super.new(name);
  endfunction 
  
  virtual function uvm_sequence_item reg2bus(
    const ref uvm_reg_bus_op rw
  );
    
    transaction tr;
    tr = transaction::type_id::create("tr");
    
    tr.pwrite  = (rw.kind == UVM_WRITE);
    tr.paddr   = rw.addr;
    
    if (rw.kind == UVM_WRITE)
      tr.pwdata = rw.data;
    return tr;
    
  endfunction

  //////bus2reg
  virtual function void bus2reg(
    uvm_sequence_item bus_item,
    ref uvm_reg_bus_op rw
  );

    transaction tr;
    if (!$cast(tr, bus_item))
      `uvm_fatal("ADAPTER", "Failed to cast bus_item")

    rw.kind    = (tr.pwrite) ? UVM_WRITE : UVM_READ;
    rw.data    = (tr.pwrite) ? tr.pwdata : tr.prdata;
    rw.addr    = tr.paddr;
    rw.status = tr.pslverr ? UVM_NOT_OK : UVM_IS_OK;
    
  endfunction

endclass
