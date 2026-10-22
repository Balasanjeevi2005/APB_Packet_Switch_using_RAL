class reg_seq extends uvm_sequence#(transaction);
  
  `uvm_object_utils(reg_seq)
  
  top_reg_block regblock_inst;
  
  function new(string name = "reg_seq");
    super.new(name);
  endfunction
  
  task body();
    
    uvm_status_e status;
    
    bit[`DATA_W-1:0]w_data;
    bit[`DATA_W-1:0]r_data;
    bit[`DATA_W-1:0]des,mir;
    
    for(int i = 0; i < 5 ; i++)begin
      w_data = $urandom;    
    
    //write
    regblock_inst.port_enable.write(status,w_data);
    des=regblock_inst.port_enable.get();
    mir=regblock_inst.port_enable.get_mirrored_value();
    `uvm_info("port_enable",$sformatf("write -> Desired_value : %0d | Mirror_value : %0d",des,mir),UVM_NONE);
    
    //read 
    repeat(2)begin
    regblock_inst.port_enable.read(status,r_data);
    des=regblock_inst.port_enable.get();
    mir=regblock_inst.port_enable.get_mirrored_value();
    `uvm_info("port_enable",$sformatf("Read -> Desired_value : %0d | Mirror_value : %0d",des,mir),UVM_NONE);
    end
    end
  endtask
  
endclass
