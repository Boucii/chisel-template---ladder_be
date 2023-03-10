module Front_End(
  input         clock,
  input         reset,
  output [63:0] io_icache_io_o_addr,
  input  [63:0] io_icache_io_i_data,
  input         io_icache_io_i_addr_ready,
  output        io_icache_io_o_addr_valid,
  input         io_icache_io_i_data_valid,
  input         io_i_branch_resolve_pack_valid,
  input         io_i_branch_resolve_pack_mispred,
  input         io_i_branch_resolve_pack_taken,
  input  [63:0] io_i_branch_resolve_pack_pc,
  input  [63:0] io_i_branch_resolve_pack_target,
  input         io_i_branch_resolve_pack_prediction_valid,
  input         io_i_pc_redirect_valid,
  input  [63:0] io_i_pc_redirect_target,
  input         io_o_fetch_pack_ready,
  output        io_o_fetch_pack_valid,
  output        io_o_fetch_pack_bits_valids_0,
  output        io_o_fetch_pack_bits_valids_1,
  output [63:0] io_o_fetch_pack_bits_pc,
  output [31:0] io_o_fetch_pack_bits_insts_0,
  output [31:0] io_o_fetch_pack_bits_insts_1,
  output        io_o_fetch_pack_bits_branch_predict_pack_valid,
  output [63:0] io_o_fetch_pack_bits_branch_predict_pack_target,
  output        io_o_fetch_pack_bits_branch_predict_pack_taken
);
  wire  pc_gen_clock; // @[front_end.scala 26:24]
  wire  pc_gen_reset; // @[front_end.scala 26:24]
  wire  pc_gen_io_i_stall; // @[front_end.scala 26:24]
  wire  pc_gen_io_i_pc_redirect_valid; // @[front_end.scala 26:24]
  wire [63:0] pc_gen_io_i_pc_redirect_target; // @[front_end.scala 26:24]
  wire  pc_gen_io_i_branch_predict_pack_valid; // @[front_end.scala 26:24]
  wire [63:0] pc_gen_io_i_branch_predict_pack_target; // @[front_end.scala 26:24]
  wire  pc_gen_io_i_branch_predict_pack_taken; // @[front_end.scala 26:24]
  wire  pc_gen_io_i_branch_presolve_pack_valid; // @[front_end.scala 26:24]
  wire  pc_gen_io_i_branch_presolve_pack_taken; // @[front_end.scala 26:24]
  wire [63:0] pc_gen_io_i_branch_presolve_pack_pc; // @[front_end.scala 26:24]
  wire  pc_gen_io_i_branch_resolve_pack_valid; // @[front_end.scala 26:24]
  wire  pc_gen_io_i_branch_resolve_pack_mispred; // @[front_end.scala 26:24]
  wire [63:0] pc_gen_io_i_branch_resolve_pack_target; // @[front_end.scala 26:24]
  wire [63:0] pc_gen_io_o_pc; // @[front_end.scala 26:24]
  wire  bpu_clock; // @[front_end.scala 27:21]
  wire  bpu_reset; // @[front_end.scala 27:21]
  wire [63:0] bpu_io_i_addr; // @[front_end.scala 27:21]
  wire  bpu_io_i_branch_resolve_pack_valid; // @[front_end.scala 27:21]
  wire  bpu_io_i_branch_resolve_pack_taken; // @[front_end.scala 27:21]
  wire [63:0] bpu_io_i_branch_resolve_pack_pc; // @[front_end.scala 27:21]
  wire [63:0] bpu_io_i_branch_resolve_pack_target; // @[front_end.scala 27:21]
  wire  bpu_io_i_branch_resolve_pack_prediction_valid; // @[front_end.scala 27:21]
  wire  bpu_io_i_branch_presolve_pack_valid; // @[front_end.scala 27:21]
  wire [63:0] bpu_io_i_branch_presolve_pack_pc; // @[front_end.scala 27:21]
  wire  bpu_io_o_branch_predict_pack_valid; // @[front_end.scala 27:21]
  wire [63:0] bpu_io_o_branch_predict_pack_target; // @[front_end.scala 27:21]
  wire  bpu_io_o_branch_predict_pack_taken; // @[front_end.scala 27:21]
  wire  if1_if2_clock; // @[front_end.scala 28:25]
  wire  if1_if2_reset; // @[front_end.scala 28:25]
  wire  if1_if2_io_i_stall; // @[front_end.scala 28:25]
  wire  if1_if2_io_i_flush; // @[front_end.scala 28:25]
  wire  if1_if2_io_o_fetch_valid; // @[front_end.scala 28:25]
  wire [63:0] if1_if2_io_i_pc; // @[front_end.scala 28:25]
  wire [63:0] if1_if2_io_o_pc; // @[front_end.scala 28:25]
  wire  if1_if2_io_i_branch_predict_pack_valid; // @[front_end.scala 28:25]
  wire [63:0] if1_if2_io_i_branch_predict_pack_target; // @[front_end.scala 28:25]
  wire  if1_if2_io_i_branch_predict_pack_taken; // @[front_end.scala 28:25]
  wire  if1_if2_io_o_branch_predict_pack_valid; // @[front_end.scala 28:25]
  wire [63:0] if1_if2_io_o_branch_predict_pack_target; // @[front_end.scala 28:25]
  wire  if1_if2_io_o_branch_predict_pack_taken; // @[front_end.scala 28:25]
  wire  if2_if3_clock; // @[front_end.scala 29:25]
  wire  if2_if3_reset; // @[front_end.scala 29:25]
  wire  if2_if3_io_i_stall; // @[front_end.scala 29:25]
  wire  if2_if3_io_i_flush; // @[front_end.scala 29:25]
  wire  if2_if3_io_i_fetch_valid; // @[front_end.scala 29:25]
  wire  if2_if3_io_o_fetch_valid; // @[front_end.scala 29:25]
  wire [63:0] if2_if3_io_i_pc; // @[front_end.scala 29:25]
  wire [63:0] if2_if3_io_o_pc; // @[front_end.scala 29:25]
  wire  if2_if3_io_i_branch_predict_pack_valid; // @[front_end.scala 29:25]
  wire [63:0] if2_if3_io_i_branch_predict_pack_target; // @[front_end.scala 29:25]
  wire  if2_if3_io_i_branch_predict_pack_taken; // @[front_end.scala 29:25]
  wire  if2_if3_io_o_branch_predict_pack_valid; // @[front_end.scala 29:25]
  wire [63:0] if2_if3_io_o_branch_predict_pack_target; // @[front_end.scala 29:25]
  wire  if2_if3_io_o_branch_predict_pack_taken; // @[front_end.scala 29:25]
  wire  branch_presolve_io_i_fetch_pack_valids_0; // @[front_end.scala 30:33]
  wire [63:0] branch_presolve_io_i_fetch_pack_pc; // @[front_end.scala 30:33]
  wire [31:0] branch_presolve_io_i_fetch_pack_insts_0; // @[front_end.scala 30:33]
  wire  branch_presolve_io_i_fetch_pack_branch_predict_pack_valid; // @[front_end.scala 30:33]
  wire  branch_presolve_io_i_fetch_pack_branch_predict_pack_taken; // @[front_end.scala 30:33]
  wire  branch_presolve_io_o_branch_presolve_pack_valid; // @[front_end.scala 30:33]
  wire  branch_presolve_io_o_branch_presolve_pack_taken; // @[front_end.scala 30:33]
  wire [63:0] branch_presolve_io_o_branch_presolve_pack_pc; // @[front_end.scala 30:33]
  wire  fetch_queue_clock; // @[front_end.scala 31:29]
  wire  fetch_queue_reset; // @[front_end.scala 31:29]
  wire  fetch_queue_io_in_valid; // @[front_end.scala 31:29]
  wire  fetch_queue_io_in_bits_valids_0; // @[front_end.scala 31:29]
  wire  fetch_queue_io_in_bits_valids_1; // @[front_end.scala 31:29]
  wire [63:0] fetch_queue_io_in_bits_pc; // @[front_end.scala 31:29]
  wire [31:0] fetch_queue_io_in_bits_insts_0; // @[front_end.scala 31:29]
  wire [31:0] fetch_queue_io_in_bits_insts_1; // @[front_end.scala 31:29]
  wire  fetch_queue_io_in_bits_branch_predict_pack_valid; // @[front_end.scala 31:29]
  wire [63:0] fetch_queue_io_in_bits_branch_predict_pack_target; // @[front_end.scala 31:29]
  wire  fetch_queue_io_in_bits_branch_predict_pack_taken; // @[front_end.scala 31:29]
  wire  fetch_queue_io_out_ready; // @[front_end.scala 31:29]
  wire  fetch_queue_io_out_valid; // @[front_end.scala 31:29]
  wire  fetch_queue_io_out_bits_valids_0; // @[front_end.scala 31:29]
  wire  fetch_queue_io_out_bits_valids_1; // @[front_end.scala 31:29]
  wire [63:0] fetch_queue_io_out_bits_pc; // @[front_end.scala 31:29]
  wire [31:0] fetch_queue_io_out_bits_insts_0; // @[front_end.scala 31:29]
  wire [31:0] fetch_queue_io_out_bits_insts_1; // @[front_end.scala 31:29]
  wire  fetch_queue_io_out_bits_branch_predict_pack_valid; // @[front_end.scala 31:29]
  wire [63:0] fetch_queue_io_out_bits_branch_predict_pack_target; // @[front_end.scala 31:29]
  wire  fetch_queue_io_out_bits_branch_predict_pack_taken; // @[front_end.scala 31:29]
  wire  fetch_queue_io_full; // @[front_end.scala 31:29]
  wire  fetch_queue_io_i_flush; // @[front_end.scala 31:29]
  wire  front_end_control_io_i_pc_redirect_valid; // @[front_end.scala 32:35]
  wire  front_end_control_io_i_icache_data_valid; // @[front_end.scala 32:35]
  wire  front_end_control_io_i_icache_addr_ready; // @[front_end.scala 32:35]
  wire  front_end_control_io_i_cache_fetch_valid; // @[front_end.scala 32:35]
  wire  front_end_control_io_i_branch_resolve_pack_valid; // @[front_end.scala 32:35]
  wire  front_end_control_io_i_branch_resolve_pack_mispred; // @[front_end.scala 32:35]
  wire  front_end_control_io_i_branch_presolve_pack_valid; // @[front_end.scala 32:35]
  wire  front_end_control_io_i_branch_presolve_pack_taken; // @[front_end.scala 32:35]
  wire  front_end_control_io_i_fetch_queue_full; // @[front_end.scala 32:35]
  wire  front_end_control_io_o_stage1_stall; // @[front_end.scala 32:35]
  wire  front_end_control_io_o_stage2_stall; // @[front_end.scala 32:35]
  wire  front_end_control_io_o_stage3_stall; // @[front_end.scala 32:35]
  wire  front_end_control_io_o_stage1_flush; // @[front_end.scala 32:35]
  wire  front_end_control_io_o_stage2_flush; // @[front_end.scala 32:35]
  wire  front_end_control_io_o_stage3_flush; // @[front_end.scala 32:35]
  wire [63:0] fetch_res_io_i_pc; // @[front_end.scala 33:27]
  wire  fetch_res_io_i_flush; // @[front_end.scala 33:27]
  wire  fetch_res_io_i_stall; // @[front_end.scala 33:27]
  wire [63:0] fetch_res_io_i_fetch_res; // @[front_end.scala 33:27]
  wire  fetch_res_io_i_branch_predict_pack_valid; // @[front_end.scala 33:27]
  wire [63:0] fetch_res_io_i_branch_predict_pack_target; // @[front_end.scala 33:27]
  wire  fetch_res_io_i_branch_predict_pack_taken; // @[front_end.scala 33:27]
  wire  fetch_res_io_o_fetch_pack_valid; // @[front_end.scala 33:27]
  wire  fetch_res_io_o_fetch_pack_bits_valids_0; // @[front_end.scala 33:27]
  wire  fetch_res_io_o_fetch_pack_bits_valids_1; // @[front_end.scala 33:27]
  wire [63:0] fetch_res_io_o_fetch_pack_bits_pc; // @[front_end.scala 33:27]
  wire [31:0] fetch_res_io_o_fetch_pack_bits_insts_0; // @[front_end.scala 33:27]
  wire [31:0] fetch_res_io_o_fetch_pack_bits_insts_1; // @[front_end.scala 33:27]
  wire  fetch_res_io_o_fetch_pack_bits_branch_predict_pack_valid; // @[front_end.scala 33:27]
  wire [63:0] fetch_res_io_o_fetch_pack_bits_branch_predict_pack_target; // @[front_end.scala 33:27]
  wire  fetch_res_io_o_fetch_pack_bits_branch_predict_pack_taken; // @[front_end.scala 33:27]
  PC_Gen pc_gen ( // @[front_end.scala 26:24]
    .clock(pc_gen_clock),
    .reset(pc_gen_reset),
    .io_i_stall(pc_gen_io_i_stall),
    .io_i_pc_redirect_valid(pc_gen_io_i_pc_redirect_valid),
    .io_i_pc_redirect_target(pc_gen_io_i_pc_redirect_target),
    .io_i_branch_predict_pack_valid(pc_gen_io_i_branch_predict_pack_valid),
    .io_i_branch_predict_pack_target(pc_gen_io_i_branch_predict_pack_target),
    .io_i_branch_predict_pack_taken(pc_gen_io_i_branch_predict_pack_taken),
    .io_i_branch_presolve_pack_valid(pc_gen_io_i_branch_presolve_pack_valid),
    .io_i_branch_presolve_pack_taken(pc_gen_io_i_branch_presolve_pack_taken),
    .io_i_branch_presolve_pack_pc(pc_gen_io_i_branch_presolve_pack_pc),
    .io_i_branch_resolve_pack_valid(pc_gen_io_i_branch_resolve_pack_valid),
    .io_i_branch_resolve_pack_mispred(pc_gen_io_i_branch_resolve_pack_mispred),
    .io_i_branch_resolve_pack_target(pc_gen_io_i_branch_resolve_pack_target),
    .io_o_pc(pc_gen_io_o_pc)
  );
  BPU bpu ( // @[front_end.scala 27:21]
    .clock(bpu_clock),
    .reset(bpu_reset),
    .io_i_addr(bpu_io_i_addr),
    .io_i_branch_resolve_pack_valid(bpu_io_i_branch_resolve_pack_valid),
    .io_i_branch_resolve_pack_taken(bpu_io_i_branch_resolve_pack_taken),
    .io_i_branch_resolve_pack_pc(bpu_io_i_branch_resolve_pack_pc),
    .io_i_branch_resolve_pack_target(bpu_io_i_branch_resolve_pack_target),
    .io_i_branch_resolve_pack_prediction_valid(bpu_io_i_branch_resolve_pack_prediction_valid),
    .io_i_branch_presolve_pack_valid(bpu_io_i_branch_presolve_pack_valid),
    .io_i_branch_presolve_pack_pc(bpu_io_i_branch_presolve_pack_pc),
    .io_o_branch_predict_pack_valid(bpu_io_o_branch_predict_pack_valid),
    .io_o_branch_predict_pack_target(bpu_io_o_branch_predict_pack_target),
    .io_o_branch_predict_pack_taken(bpu_io_o_branch_predict_pack_taken)
  );
  IF1_IF2 if1_if2 ( // @[front_end.scala 28:25]
    .clock(if1_if2_clock),
    .reset(if1_if2_reset),
    .io_i_stall(if1_if2_io_i_stall),
    .io_i_flush(if1_if2_io_i_flush),
    .io_o_fetch_valid(if1_if2_io_o_fetch_valid),
    .io_i_pc(if1_if2_io_i_pc),
    .io_o_pc(if1_if2_io_o_pc),
    .io_i_branch_predict_pack_valid(if1_if2_io_i_branch_predict_pack_valid),
    .io_i_branch_predict_pack_target(if1_if2_io_i_branch_predict_pack_target),
    .io_i_branch_predict_pack_taken(if1_if2_io_i_branch_predict_pack_taken),
    .io_o_branch_predict_pack_valid(if1_if2_io_o_branch_predict_pack_valid),
    .io_o_branch_predict_pack_target(if1_if2_io_o_branch_predict_pack_target),
    .io_o_branch_predict_pack_taken(if1_if2_io_o_branch_predict_pack_taken)
  );
  IF2_IF3 if2_if3 ( // @[front_end.scala 29:25]
    .clock(if2_if3_clock),
    .reset(if2_if3_reset),
    .io_i_stall(if2_if3_io_i_stall),
    .io_i_flush(if2_if3_io_i_flush),
    .io_i_fetch_valid(if2_if3_io_i_fetch_valid),
    .io_o_fetch_valid(if2_if3_io_o_fetch_valid),
    .io_i_pc(if2_if3_io_i_pc),
    .io_o_pc(if2_if3_io_o_pc),
    .io_i_branch_predict_pack_valid(if2_if3_io_i_branch_predict_pack_valid),
    .io_i_branch_predict_pack_target(if2_if3_io_i_branch_predict_pack_target),
    .io_i_branch_predict_pack_taken(if2_if3_io_i_branch_predict_pack_taken),
    .io_o_branch_predict_pack_valid(if2_if3_io_o_branch_predict_pack_valid),
    .io_o_branch_predict_pack_target(if2_if3_io_o_branch_predict_pack_target),
    .io_o_branch_predict_pack_taken(if2_if3_io_o_branch_predict_pack_taken)
  );
  Branch_Presolve branch_presolve ( // @[front_end.scala 30:33]
    .io_i_fetch_pack_valids_0(branch_presolve_io_i_fetch_pack_valids_0),
    .io_i_fetch_pack_pc(branch_presolve_io_i_fetch_pack_pc),
    .io_i_fetch_pack_insts_0(branch_presolve_io_i_fetch_pack_insts_0),
    .io_i_fetch_pack_branch_predict_pack_valid(branch_presolve_io_i_fetch_pack_branch_predict_pack_valid),
    .io_i_fetch_pack_branch_predict_pack_taken(branch_presolve_io_i_fetch_pack_branch_predict_pack_taken),
    .io_o_branch_presolve_pack_valid(branch_presolve_io_o_branch_presolve_pack_valid),
    .io_o_branch_presolve_pack_taken(branch_presolve_io_o_branch_presolve_pack_taken),
    .io_o_branch_presolve_pack_pc(branch_presolve_io_o_branch_presolve_pack_pc)
  );
  Fetch_Queue fetch_queue ( // @[front_end.scala 31:29]
    .clock(fetch_queue_clock),
    .reset(fetch_queue_reset),
    .io_in_valid(fetch_queue_io_in_valid),
    .io_in_bits_valids_0(fetch_queue_io_in_bits_valids_0),
    .io_in_bits_valids_1(fetch_queue_io_in_bits_valids_1),
    .io_in_bits_pc(fetch_queue_io_in_bits_pc),
    .io_in_bits_insts_0(fetch_queue_io_in_bits_insts_0),
    .io_in_bits_insts_1(fetch_queue_io_in_bits_insts_1),
    .io_in_bits_branch_predict_pack_valid(fetch_queue_io_in_bits_branch_predict_pack_valid),
    .io_in_bits_branch_predict_pack_target(fetch_queue_io_in_bits_branch_predict_pack_target),
    .io_in_bits_branch_predict_pack_taken(fetch_queue_io_in_bits_branch_predict_pack_taken),
    .io_out_ready(fetch_queue_io_out_ready),
    .io_out_valid(fetch_queue_io_out_valid),
    .io_out_bits_valids_0(fetch_queue_io_out_bits_valids_0),
    .io_out_bits_valids_1(fetch_queue_io_out_bits_valids_1),
    .io_out_bits_pc(fetch_queue_io_out_bits_pc),
    .io_out_bits_insts_0(fetch_queue_io_out_bits_insts_0),
    .io_out_bits_insts_1(fetch_queue_io_out_bits_insts_1),
    .io_out_bits_branch_predict_pack_valid(fetch_queue_io_out_bits_branch_predict_pack_valid),
    .io_out_bits_branch_predict_pack_target(fetch_queue_io_out_bits_branch_predict_pack_target),
    .io_out_bits_branch_predict_pack_taken(fetch_queue_io_out_bits_branch_predict_pack_taken),
    .io_full(fetch_queue_io_full),
    .io_i_flush(fetch_queue_io_i_flush)
  );
  front_end_control front_end_control ( // @[front_end.scala 32:35]
    .io_i_pc_redirect_valid(front_end_control_io_i_pc_redirect_valid),
    .io_i_icache_data_valid(front_end_control_io_i_icache_data_valid),
    .io_i_icache_addr_ready(front_end_control_io_i_icache_addr_ready),
    .io_i_cache_fetch_valid(front_end_control_io_i_cache_fetch_valid),
    .io_i_branch_resolve_pack_valid(front_end_control_io_i_branch_resolve_pack_valid),
    .io_i_branch_resolve_pack_mispred(front_end_control_io_i_branch_resolve_pack_mispred),
    .io_i_branch_presolve_pack_valid(front_end_control_io_i_branch_presolve_pack_valid),
    .io_i_branch_presolve_pack_taken(front_end_control_io_i_branch_presolve_pack_taken),
    .io_i_fetch_queue_full(front_end_control_io_i_fetch_queue_full),
    .io_o_stage1_stall(front_end_control_io_o_stage1_stall),
    .io_o_stage2_stall(front_end_control_io_o_stage2_stall),
    .io_o_stage3_stall(front_end_control_io_o_stage3_stall),
    .io_o_stage1_flush(front_end_control_io_o_stage1_flush),
    .io_o_stage2_flush(front_end_control_io_o_stage2_flush),
    .io_o_stage3_flush(front_end_control_io_o_stage3_flush)
  );
  Fetch_Res fetch_res ( // @[front_end.scala 33:27]
    .io_i_pc(fetch_res_io_i_pc),
    .io_i_flush(fetch_res_io_i_flush),
    .io_i_stall(fetch_res_io_i_stall),
    .io_i_fetch_res(fetch_res_io_i_fetch_res),
    .io_i_branch_predict_pack_valid(fetch_res_io_i_branch_predict_pack_valid),
    .io_i_branch_predict_pack_target(fetch_res_io_i_branch_predict_pack_target),
    .io_i_branch_predict_pack_taken(fetch_res_io_i_branch_predict_pack_taken),
    .io_o_fetch_pack_valid(fetch_res_io_o_fetch_pack_valid),
    .io_o_fetch_pack_bits_valids_0(fetch_res_io_o_fetch_pack_bits_valids_0),
    .io_o_fetch_pack_bits_valids_1(fetch_res_io_o_fetch_pack_bits_valids_1),
    .io_o_fetch_pack_bits_pc(fetch_res_io_o_fetch_pack_bits_pc),
    .io_o_fetch_pack_bits_insts_0(fetch_res_io_o_fetch_pack_bits_insts_0),
    .io_o_fetch_pack_bits_insts_1(fetch_res_io_o_fetch_pack_bits_insts_1),
    .io_o_fetch_pack_bits_branch_predict_pack_valid(fetch_res_io_o_fetch_pack_bits_branch_predict_pack_valid),
    .io_o_fetch_pack_bits_branch_predict_pack_target(fetch_res_io_o_fetch_pack_bits_branch_predict_pack_target),
    .io_o_fetch_pack_bits_branch_predict_pack_taken(fetch_res_io_o_fetch_pack_bits_branch_predict_pack_taken)
  );
  assign io_icache_io_o_addr = {pc_gen_io_o_pc[63:3],3'h0}; // @[Cat.scala 33:92]
  assign io_icache_io_o_addr_valid = front_end_control_io_o_stage1_stall; // @[front_end.scala 55:31]
  assign io_o_fetch_pack_valid = fetch_queue_io_out_valid; // @[front_end.scala 90:21]
  assign io_o_fetch_pack_bits_valids_0 = fetch_queue_io_out_bits_valids_0; // @[front_end.scala 90:21]
  assign io_o_fetch_pack_bits_valids_1 = fetch_queue_io_out_bits_valids_1; // @[front_end.scala 90:21]
  assign io_o_fetch_pack_bits_pc = fetch_queue_io_out_bits_pc; // @[front_end.scala 90:21]
  assign io_o_fetch_pack_bits_insts_0 = fetch_queue_io_out_bits_insts_0; // @[front_end.scala 90:21]
  assign io_o_fetch_pack_bits_insts_1 = fetch_queue_io_out_bits_insts_1; // @[front_end.scala 90:21]
  assign io_o_fetch_pack_bits_branch_predict_pack_valid = fetch_queue_io_out_bits_branch_predict_pack_valid; // @[front_end.scala 90:21]
  assign io_o_fetch_pack_bits_branch_predict_pack_target = fetch_queue_io_out_bits_branch_predict_pack_target; // @[front_end.scala 90:21]
  assign io_o_fetch_pack_bits_branch_predict_pack_taken = fetch_queue_io_out_bits_branch_predict_pack_taken; // @[front_end.scala 90:21]
  assign pc_gen_clock = clock;
  assign pc_gen_reset = reset;
  assign pc_gen_io_i_stall = front_end_control_io_o_stage1_stall; // @[front_end.scala 46:23]
  assign pc_gen_io_i_pc_redirect_valid = io_i_pc_redirect_valid; // @[front_end.scala 47:35]
  assign pc_gen_io_i_pc_redirect_target = io_i_pc_redirect_target; // @[front_end.scala 48:36]
  assign pc_gen_io_i_branch_predict_pack_valid = bpu_io_o_branch_predict_pack_valid; // @[front_end.scala 49:37]
  assign pc_gen_io_i_branch_predict_pack_target = bpu_io_o_branch_predict_pack_target; // @[front_end.scala 49:37]
  assign pc_gen_io_i_branch_predict_pack_taken = bpu_io_o_branch_predict_pack_taken; // @[front_end.scala 49:37]
  assign pc_gen_io_i_branch_presolve_pack_valid = branch_presolve_io_o_branch_presolve_pack_valid; // @[front_end.scala 50:38]
  assign pc_gen_io_i_branch_presolve_pack_taken = branch_presolve_io_o_branch_presolve_pack_taken; // @[front_end.scala 50:38]
  assign pc_gen_io_i_branch_presolve_pack_pc = branch_presolve_io_o_branch_presolve_pack_pc; // @[front_end.scala 50:38]
  assign pc_gen_io_i_branch_resolve_pack_valid = io_i_branch_resolve_pack_valid; // @[front_end.scala 51:37]
  assign pc_gen_io_i_branch_resolve_pack_mispred = io_i_branch_resolve_pack_mispred; // @[front_end.scala 51:37]
  assign pc_gen_io_i_branch_resolve_pack_target = io_i_branch_resolve_pack_target; // @[front_end.scala 51:37]
  assign bpu_clock = clock;
  assign bpu_reset = reset;
  assign bpu_io_i_addr = pc_gen_io_o_pc; // @[front_end.scala 58:19]
  assign bpu_io_i_branch_resolve_pack_valid = io_i_branch_resolve_pack_valid; // @[front_end.scala 60:34]
  assign bpu_io_i_branch_resolve_pack_taken = io_i_branch_resolve_pack_taken; // @[front_end.scala 60:34]
  assign bpu_io_i_branch_resolve_pack_pc = io_i_branch_resolve_pack_pc; // @[front_end.scala 60:34]
  assign bpu_io_i_branch_resolve_pack_target = io_i_branch_resolve_pack_target; // @[front_end.scala 60:34]
  assign bpu_io_i_branch_resolve_pack_prediction_valid = io_i_branch_resolve_pack_prediction_valid; // @[front_end.scala 60:34]
  assign bpu_io_i_branch_presolve_pack_valid = branch_presolve_io_o_branch_presolve_pack_valid; // @[front_end.scala 59:35]
  assign bpu_io_i_branch_presolve_pack_pc = branch_presolve_io_o_branch_presolve_pack_pc; // @[front_end.scala 59:35]
  assign if1_if2_clock = clock;
  assign if1_if2_reset = reset;
  assign if1_if2_io_i_stall = front_end_control_io_o_stage1_stall; // @[front_end.scala 63:24]
  assign if1_if2_io_i_flush = front_end_control_io_o_stage1_flush; // @[front_end.scala 64:24]
  assign if1_if2_io_i_pc = pc_gen_io_o_pc; // @[front_end.scala 65:21]
  assign if1_if2_io_i_branch_predict_pack_valid = bpu_io_o_branch_predict_pack_valid; // @[front_end.scala 66:38]
  assign if1_if2_io_i_branch_predict_pack_target = bpu_io_o_branch_predict_pack_target; // @[front_end.scala 66:38]
  assign if1_if2_io_i_branch_predict_pack_taken = bpu_io_o_branch_predict_pack_taken; // @[front_end.scala 66:38]
  assign if2_if3_clock = clock;
  assign if2_if3_reset = reset;
  assign if2_if3_io_i_stall = front_end_control_io_o_stage2_stall; // @[front_end.scala 71:24]
  assign if2_if3_io_i_flush = front_end_control_io_o_stage2_flush | ~if1_if2_io_o_fetch_valid; // @[front_end.scala 72:63]
  assign if2_if3_io_i_fetch_valid = if1_if2_io_o_fetch_valid; // @[front_end.scala 75:30]
  assign if2_if3_io_i_pc = if1_if2_io_o_pc; // @[front_end.scala 73:21]
  assign if2_if3_io_i_branch_predict_pack_valid = if1_if2_io_o_branch_predict_pack_valid; // @[front_end.scala 74:38]
  assign if2_if3_io_i_branch_predict_pack_target = if1_if2_io_o_branch_predict_pack_target; // @[front_end.scala 74:38]
  assign if2_if3_io_i_branch_predict_pack_taken = if1_if2_io_o_branch_predict_pack_taken; // @[front_end.scala 74:38]
  assign branch_presolve_io_i_fetch_pack_valids_0 = fetch_res_io_o_fetch_pack_bits_valids_0; // @[front_end.scala 78:37]
  assign branch_presolve_io_i_fetch_pack_pc = fetch_res_io_o_fetch_pack_bits_pc; // @[front_end.scala 78:37]
  assign branch_presolve_io_i_fetch_pack_insts_0 = fetch_res_io_o_fetch_pack_bits_insts_0; // @[front_end.scala 78:37]
  assign branch_presolve_io_i_fetch_pack_branch_predict_pack_valid =
    fetch_res_io_o_fetch_pack_bits_branch_predict_pack_valid; // @[front_end.scala 78:37]
  assign branch_presolve_io_i_fetch_pack_branch_predict_pack_taken =
    fetch_res_io_o_fetch_pack_bits_branch_predict_pack_taken; // @[front_end.scala 78:37]
  assign fetch_queue_clock = clock;
  assign fetch_queue_reset = reset;
  assign fetch_queue_io_in_valid = fetch_res_io_o_fetch_pack_valid; // @[front_end.scala 86:24]
  assign fetch_queue_io_in_bits_valids_0 = fetch_res_io_o_fetch_pack_bits_valids_0; // @[front_end.scala 86:24]
  assign fetch_queue_io_in_bits_valids_1 = fetch_res_io_o_fetch_pack_bits_valids_1; // @[front_end.scala 86:24]
  assign fetch_queue_io_in_bits_pc = fetch_res_io_o_fetch_pack_bits_pc; // @[front_end.scala 86:24]
  assign fetch_queue_io_in_bits_insts_0 = fetch_res_io_o_fetch_pack_bits_insts_0; // @[front_end.scala 86:24]
  assign fetch_queue_io_in_bits_insts_1 = fetch_res_io_o_fetch_pack_bits_insts_1; // @[front_end.scala 86:24]
  assign fetch_queue_io_in_bits_branch_predict_pack_valid = fetch_res_io_o_fetch_pack_bits_branch_predict_pack_valid; // @[front_end.scala 86:24]
  assign fetch_queue_io_in_bits_branch_predict_pack_target = fetch_res_io_o_fetch_pack_bits_branch_predict_pack_target; // @[front_end.scala 86:24]
  assign fetch_queue_io_in_bits_branch_predict_pack_taken = fetch_res_io_o_fetch_pack_bits_branch_predict_pack_taken; // @[front_end.scala 86:24]
  assign fetch_queue_io_out_ready = io_o_fetch_pack_ready; // @[front_end.scala 90:21]
  assign fetch_queue_io_i_flush = front_end_control_io_o_stage3_flush; // @[front_end.scala 87:28]
  assign front_end_control_io_i_pc_redirect_valid = io_i_pc_redirect_valid; // @[front_end.scala 36:46]
  assign front_end_control_io_i_icache_data_valid = io_icache_io_i_data_valid; // @[front_end.scala 38:46]
  assign front_end_control_io_i_icache_addr_ready = io_icache_io_i_addr_ready; // @[front_end.scala 37:46]
  assign front_end_control_io_i_cache_fetch_valid = if2_if3_io_o_fetch_valid; // @[front_end.scala 39:46]
  assign front_end_control_io_i_branch_resolve_pack_valid = io_i_branch_resolve_pack_valid; // @[front_end.scala 41:48]
  assign front_end_control_io_i_branch_resolve_pack_mispred = io_i_branch_resolve_pack_mispred; // @[front_end.scala 41:48]
  assign front_end_control_io_i_branch_presolve_pack_valid = branch_presolve_io_o_branch_presolve_pack_valid; // @[front_end.scala 40:49]
  assign front_end_control_io_i_branch_presolve_pack_taken = branch_presolve_io_o_branch_presolve_pack_taken; // @[front_end.scala 40:49]
  assign front_end_control_io_i_fetch_queue_full = fetch_queue_io_full; // @[front_end.scala 42:45]
  assign fetch_res_io_i_pc = if2_if3_io_o_pc; // @[front_end.scala 80:23]
  assign fetch_res_io_i_flush = front_end_control_io_o_stage3_flush | ~if2_if3_io_o_fetch_valid; // @[front_end.scala 81:65]
  assign fetch_res_io_i_stall = front_end_control_io_o_stage3_stall; // @[front_end.scala 82:26]
  assign fetch_res_io_i_fetch_res = io_icache_io_i_data; // @[front_end.scala 83:30]
  assign fetch_res_io_i_branch_predict_pack_valid = if2_if3_io_o_branch_predict_pack_valid; // @[front_end.scala 84:40]
  assign fetch_res_io_i_branch_predict_pack_target = if2_if3_io_o_branch_predict_pack_target; // @[front_end.scala 84:40]
  assign fetch_res_io_i_branch_predict_pack_taken = if2_if3_io_o_branch_predict_pack_taken; // @[front_end.scala 84:40]
endmodule
