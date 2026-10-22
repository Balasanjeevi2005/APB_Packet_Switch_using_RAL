class test extends uvm_test;
  
  `uvm_component_utils(test)
  
  env e_h;
  apb_config c_h;
  
  function new(string name = "test",uvm_component parent);
    super.new(name,parent);  
  endfunction
  
  function void build_phase(uvm_phase phase);
    
    super.build_phase(phase);
    c_h = apb_config::type_id::create("c_h");
    
    if(!uvm_config_db#(virtual apb_if)::get(this,"","apb_if",c_h.vif))
      `uvm_error("config_error","unable to get vif in test");
    
    uvm_config_db#(apb_config)::set(this,"*","apb_config",c_h);
    c_h.agnt_is_active = UVM_ACTIVE; 
    e_h=env::type_id::create("e_h",this);
    
  endfunction
  
endclass

//1
class test_1 extends test;
  
  `uvm_component_utils(test_1)
  
  reg_seq r1;
  
  function new(string name = "test_1",uvm_component parent=null); 
    super.new(name,parent);
  endfunction
  
  task run_phase(uvm_phase phase);
    phase.raise_objection(this);
    begin
      r1=reg_seq::type_id::create("r1");
      r1.regblock_inst=e_h.regblock_inst;
      r1.start(e_h.agnt_h.seq_h);
    end
    phase.drop_objection(this);
    phase.phase_done.set_drain_time(this,200);
  endtask
    
endclass

// //2
// class test_2 extends test;
  
//   `uvm_component_utils(test_2)
  
//   err_seq e1;
  
//   function new(string name = "test_2",uvm_component parent); 
//     super.new(name,parent);
//   endfunction
  
//   task run_phase(uvm_phase phase);
//     phase.raise_objection(this);
//     phase.drop_objection(this);
//   endtask
    
// endclass

// //3
// class test_3 extends test;
  
//   `uvm_component_utils(test_3)
  
//   err_seq e1;
  
//   function new(string name = "test_3",uvm_component parent); 
//     super.new(name,parent);
//   endfunction
  
//   task run_phase(uvm_phase phase);
//     phase.raise_objection(this);
//     phase.drop_objection(this);
//   endtask
    
// endclass

// //4
// class test_4 extends test;
  
//   `uvm_component_utils(test_4)
  
//   err_seq e1;
  
//   function new(string name = "test_4",uvm_component parent); 
//     super.new(name,parent);
//   endfunction
  
//   task run_phase(uvm_phase phase);
//     phase.raise_objection(this);
//     phase.drop_objection(this);
//   endtask
    
// endclass

// //5
// class test_5 extends test;
  
//   `uvm_component_utils(test_5)
  
//   err_seq e1;
  
//   function new(string name = "test5",uvm_component parent); 
//     super.new(name,parent);
//   endfunction
  
//   task run_phase(uvm_phase phase);
//     phase.raise_objection(this);
//     phase.drop_objection(this);
//   endtask
    
// endclass

// //6
// class test_6 extends test;
  
//   `uvm_component_utils(test_6)
  
//   err_seq e1;
  
//   function new(string name = "test_6",uvm_component parent); 
//     super.new(name,parent);
//   endfunction
  
//   task run_phase(uvm_phase phase);
//     phase.raise_objection(this);
//     phase.drop_objection(this);
//   endtask
    
// endclass

// //7
// class test_7 extends test;
  
//   `uvm_component_utils(test_7)
  
//   err_seq e1;
  
//   function new(string name = "test_7",uvm_component parent); 
//     super.new(name,parent);
//   endfunction
  
//   task run_phase(uvm_phase phase);
//     phase.raise_objection(this);
//     phase.drop_objection(this);
//   endtask
    
// endclass

// //8
// class test_8 extends test;
  
//   `uvm_component_utils(test_8)
  
//   err_seq e1;
  
//   function new(string name = "test_8",uvm_component parent); 
//     super.new(name,parent);
//   endfunction
  
//   task run_phase(uvm_phase phase);
//     phase.raise_objection(this);
//     phase.drop_objection(this);
//   endtask
    
// endclass

// //9
// class test_9 extends test;
  
//   `uvm_component_utils(test_9)
  
//   err_seq e1;
  
//   function new(string name = "test_9",uvm_component parent); 
//     super.new(name,parent);
//   endfunction
  
//   task run_phase(uvm_phase phase);
//     phase.raise_objection(this);
//     phase.drop_objection(this);
//   endtask
    
// endclass

// //10
// class test_10 extends test;
  
//   `uvm_component_utils(test_10)
  
//   err_seq e1;
  
//   function new(string name = "test_10",uvm_component parent); 
//     super.new(name,parent);
//   endfunction
  
//   task run_phase(uvm_phase phase);
//     phase.raise_objection(this);
//     phase.drop_objection(this);
//   endtask
    
// endclass
