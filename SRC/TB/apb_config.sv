class apb_config extends uvm_object;
  
  `uvm_object_utils(apb_config)
  
  uvm_active_passive_enum agnt_is_active;
  virtual apb_if vif;
  
  function new(string name = "apb_config");
    super.new(name);
  endfunction
  
endclass
