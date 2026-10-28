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
      regblock_inst.lock.write(status, 32'hA5A5C3C3);
      w_data = `DATA_W'h0000_0000; //$urandom;  
      //write
      regblock_inst.port_enable.write(status,w_data);
      des=regblock_inst.port_enable.get();
      mir=regblock_inst.port_enable.get_mirrored_value();
    `uvm_info("port_enable",$sformatf("write Tx to DUT-> Desired_value : %0h | Mirror_value : %0h | w_data : %0h",des,mir,w_data),UVM_NONE);
      //read
      w_data = `DATA_W'h0000_00A; //$urandom;    
      regblock_inst.port_enable.read(status,r_data);
      des=regblock_inst.port_enable.get();
      mir=regblock_inst.port_enable.get_mirrored_value();
    `uvm_info("port_enable",$sformatf("Read Rx from DUT -> Desired_value : %0h | Mirror_value : %0h | r_data : %0h",des,mir,r_data),UVM_NONE);

      //write
      regblock_inst.port_enable.write(status,w_data);
      des=regblock_inst.port_enable.get();
      mir=regblock_inst.port_enable.get_mirrored_value();
    `uvm_info("port_enable",$sformatf("write Tx to DUT-> Desired_value : %0h | Mirror_value : %0h | w_data : %0h",des,mir,w_data),UVM_NONE);
   // for(int i = 0; i < 5 ; i++)begin
      //read 
      repeat(2)begin
      regblock_inst.port_enable.read(status,r_data);
      des=regblock_inst.port_enable.get();
      mir=regblock_inst.port_enable.get_mirrored_value();
        `uvm_info("port_enable",$sformatf("Read Rx from DUT -> Desired_value : %0h | Mirror_value : %0h | r_data : %0h",des,mir,r_data),UVM_NONE);
      end
       //read  
      regblock_inst.device_id.read(status,r_data);
      des=regblock_inst.device_id.get();
      mir=regblock_inst.device_id.get_mirrored_value();
    `uvm_info("device_id",$sformatf("Read Rx from DUT -> Desired_value : %0h | Mirror_value : %0h | r_data : %0h",des,mir,r_data),UVM_NONE);

   // end
  endtask
  
endclass
