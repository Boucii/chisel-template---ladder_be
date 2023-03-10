module Execute(
  input         clock,
  input         reset,
  input         io_i_issue_res_packs_0_valid,
  input  [31:0] io_i_issue_res_packs_0_pc,
  input  [31:0] io_i_issue_res_packs_0_inst,
  input  [6:0]  io_i_issue_res_packs_0_func_code,
  input         io_i_issue_res_packs_0_branch_predict_pack_valid,
  input  [63:0] io_i_issue_res_packs_0_branch_predict_pack_target,
  input         io_i_issue_res_packs_0_branch_predict_pack_taken,
  input  [6:0]  io_i_issue_res_packs_0_phy_dst,
  input  [6:0]  io_i_issue_res_packs_0_stale_dst,
  input  [4:0]  io_i_issue_res_packs_0_arch_dst,
  input         io_i_issue_res_packs_0_src1_valid,
  input         io_i_issue_res_packs_0_src2_valid,
  input  [6:0]  io_i_issue_res_packs_0_rob_idx,
  input  [63:0] io_i_issue_res_packs_0_imm,
  input  [63:0] io_i_issue_res_packs_0_src1_value,
  input  [63:0] io_i_issue_res_packs_0_src2_value,
  input  [2:0]  io_i_issue_res_packs_0_op1_sel,
  input  [2:0]  io_i_issue_res_packs_0_op2_sel,
  input  [4:0]  io_i_issue_res_packs_0_alu_sel,
  input  [2:0]  io_i_issue_res_packs_0_branch_type,
  input  [1:0]  io_i_issue_res_packs_0_mem_type,
  input         io_i_issue_res_packs_1_valid,
  input  [31:0] io_i_issue_res_packs_1_pc,
  input  [31:0] io_i_issue_res_packs_1_inst,
  input  [6:0]  io_i_issue_res_packs_1_func_code,
  input         io_i_issue_res_packs_1_branch_predict_pack_valid,
  input  [63:0] io_i_issue_res_packs_1_branch_predict_pack_target,
  input         io_i_issue_res_packs_1_branch_predict_pack_taken,
  input  [6:0]  io_i_issue_res_packs_1_phy_dst,
  input  [6:0]  io_i_issue_res_packs_1_stale_dst,
  input  [4:0]  io_i_issue_res_packs_1_arch_dst,
  input         io_i_issue_res_packs_1_src1_valid,
  input         io_i_issue_res_packs_1_src2_valid,
  input  [6:0]  io_i_issue_res_packs_1_rob_idx,
  input  [63:0] io_i_issue_res_packs_1_imm,
  input  [63:0] io_i_issue_res_packs_1_src1_value,
  input  [63:0] io_i_issue_res_packs_1_src2_value,
  input  [2:0]  io_i_issue_res_packs_1_op1_sel,
  input  [2:0]  io_i_issue_res_packs_1_op2_sel,
  input  [4:0]  io_i_issue_res_packs_1_alu_sel,
  input  [2:0]  io_i_issue_res_packs_1_branch_type,
  input  [1:0]  io_i_issue_res_packs_1_mem_type,
  output [1:0]  io_o_available_funcs_0,
  output [1:0]  io_o_available_funcs_1,
  output [1:0]  io_o_available_funcs_2,
  output [1:0]  io_o_available_funcs_3,
  output [1:0]  io_o_available_funcs_4,
  output [1:0]  io_o_available_funcs_5,
  output        io_o_ex_res_packs_0_valid,
  output        io_o_ex_res_packs_0_uop_valid,
  output [31:0] io_o_ex_res_packs_0_uop_pc,
  output [31:0] io_o_ex_res_packs_0_uop_inst,
  output [6:0]  io_o_ex_res_packs_0_uop_func_code,
  output [6:0]  io_o_ex_res_packs_0_uop_phy_dst,
  output [6:0]  io_o_ex_res_packs_0_uop_stale_dst,
  output [4:0]  io_o_ex_res_packs_0_uop_arch_dst,
  output [6:0]  io_o_ex_res_packs_0_uop_rob_idx,
  output [63:0] io_o_ex_res_packs_0_uop_dst_value,
  output [63:0] io_o_ex_res_packs_0_uop_src1_value,
  output [4:0]  io_o_ex_res_packs_0_uop_alu_sel,
  output        io_o_ex_res_packs_1_valid,
  output        io_o_ex_res_packs_1_uop_valid,
  output [31:0] io_o_ex_res_packs_1_uop_pc,
  output [31:0] io_o_ex_res_packs_1_uop_inst,
  output [6:0]  io_o_ex_res_packs_1_uop_func_code,
  output [6:0]  io_o_ex_res_packs_1_uop_phy_dst,
  output [6:0]  io_o_ex_res_packs_1_uop_stale_dst,
  output [4:0]  io_o_ex_res_packs_1_uop_arch_dst,
  output [6:0]  io_o_ex_res_packs_1_uop_rob_idx,
  output [63:0] io_o_ex_res_packs_1_uop_dst_value,
  output [63:0] io_o_ex_res_packs_1_uop_src1_value,
  output [4:0]  io_o_ex_res_packs_1_uop_alu_sel,
  input  [7:0]  io_i_ROB_first_entry,
  input         io_dcache_io_data_valid,
  output        io_dcache_io_addr_valid,
  input         io_dcache_io_addr_ready,
  output        io_dcache_io_Mwout,
  output [63:0] io_dcache_io_Maddr,
  output        io_dcache_io_Men,
  output [31:0] io_dcache_io_Mlen,
  input  [63:0] io_dcache_io_MdataIn,
  output [63:0] io_dcache_io_MdataOut,
  output        io_o_branch_resolve_pack_valid,
  output        io_o_branch_resolve_pack_mispred,
  output        io_o_branch_resolve_pack_taken,
  output [63:0] io_o_branch_resolve_pack_pc,
  output [63:0] io_o_branch_resolve_pack_target,
  output [7:0]  io_o_branch_resolve_pack_rob_idx,
  output        io_o_branch_resolve_pack_prediction_valid,
  output [2:0]  io_o_branch_resolve_pack_branch_type,
  input         io_i_exception,
  input         io_i_rollback_valid,
  output        io_o_lsu_uop_valid,
  output [7:0]  io_o_lsu_uop_rob_idx
);
  wire  alu1_clock; // @[execute.scala 47:22]
  wire  alu1_reset; // @[execute.scala 47:22]
  wire  alu1_io_i_uop_valid; // @[execute.scala 47:22]
  wire [31:0] alu1_io_i_uop_pc; // @[execute.scala 47:22]
  wire [31:0] alu1_io_i_uop_inst; // @[execute.scala 47:22]
  wire [6:0] alu1_io_i_uop_func_code; // @[execute.scala 47:22]
  wire [6:0] alu1_io_i_uop_phy_dst; // @[execute.scala 47:22]
  wire [6:0] alu1_io_i_uop_stale_dst; // @[execute.scala 47:22]
  wire [4:0] alu1_io_i_uop_arch_dst; // @[execute.scala 47:22]
  wire [6:0] alu1_io_i_uop_rob_idx; // @[execute.scala 47:22]
  wire [63:0] alu1_io_i_uop_src1_value; // @[execute.scala 47:22]
  wire [63:0] alu1_io_i_uop_src2_value; // @[execute.scala 47:22]
  wire [4:0] alu1_io_i_uop_alu_sel; // @[execute.scala 47:22]
  wire  alu1_io_i_select; // @[execute.scala 47:22]
  wire  alu1_io_i_select_to_commit; // @[execute.scala 47:22]
  wire  alu1_io_o_ex_res_pack_valid; // @[execute.scala 47:22]
  wire  alu1_io_o_ex_res_pack_uop_valid; // @[execute.scala 47:22]
  wire [31:0] alu1_io_o_ex_res_pack_uop_pc; // @[execute.scala 47:22]
  wire [31:0] alu1_io_o_ex_res_pack_uop_inst; // @[execute.scala 47:22]
  wire [6:0] alu1_io_o_ex_res_pack_uop_func_code; // @[execute.scala 47:22]
  wire [6:0] alu1_io_o_ex_res_pack_uop_phy_dst; // @[execute.scala 47:22]
  wire [6:0] alu1_io_o_ex_res_pack_uop_stale_dst; // @[execute.scala 47:22]
  wire [4:0] alu1_io_o_ex_res_pack_uop_arch_dst; // @[execute.scala 47:22]
  wire [6:0] alu1_io_o_ex_res_pack_uop_rob_idx; // @[execute.scala 47:22]
  wire [63:0] alu1_io_o_ex_res_pack_uop_dst_value; // @[execute.scala 47:22]
  wire [63:0] alu1_io_o_ex_res_pack_uop_src1_value; // @[execute.scala 47:22]
  wire [4:0] alu1_io_o_ex_res_pack_uop_alu_sel; // @[execute.scala 47:22]
  wire  alu1_io_o_available; // @[execute.scala 47:22]
  wire  alu1_io_i_exception; // @[execute.scala 47:22]
  wire  alu1_io_i_rollback_valid; // @[execute.scala 47:22]
  wire [6:0] alu1_io_i_rollback_rob_idx; // @[execute.scala 47:22]
  wire  alu2_clock; // @[execute.scala 48:22]
  wire  alu2_reset; // @[execute.scala 48:22]
  wire  alu2_io_i_uop_valid; // @[execute.scala 48:22]
  wire [31:0] alu2_io_i_uop_pc; // @[execute.scala 48:22]
  wire [31:0] alu2_io_i_uop_inst; // @[execute.scala 48:22]
  wire [6:0] alu2_io_i_uop_func_code; // @[execute.scala 48:22]
  wire [6:0] alu2_io_i_uop_phy_dst; // @[execute.scala 48:22]
  wire [6:0] alu2_io_i_uop_stale_dst; // @[execute.scala 48:22]
  wire [4:0] alu2_io_i_uop_arch_dst; // @[execute.scala 48:22]
  wire [6:0] alu2_io_i_uop_rob_idx; // @[execute.scala 48:22]
  wire [63:0] alu2_io_i_uop_src1_value; // @[execute.scala 48:22]
  wire [63:0] alu2_io_i_uop_src2_value; // @[execute.scala 48:22]
  wire [4:0] alu2_io_i_uop_alu_sel; // @[execute.scala 48:22]
  wire  alu2_io_i_select; // @[execute.scala 48:22]
  wire  alu2_io_i_select_to_commit; // @[execute.scala 48:22]
  wire  alu2_io_o_ex_res_pack_valid; // @[execute.scala 48:22]
  wire  alu2_io_o_ex_res_pack_uop_valid; // @[execute.scala 48:22]
  wire [31:0] alu2_io_o_ex_res_pack_uop_pc; // @[execute.scala 48:22]
  wire [31:0] alu2_io_o_ex_res_pack_uop_inst; // @[execute.scala 48:22]
  wire [6:0] alu2_io_o_ex_res_pack_uop_func_code; // @[execute.scala 48:22]
  wire [6:0] alu2_io_o_ex_res_pack_uop_phy_dst; // @[execute.scala 48:22]
  wire [6:0] alu2_io_o_ex_res_pack_uop_stale_dst; // @[execute.scala 48:22]
  wire [4:0] alu2_io_o_ex_res_pack_uop_arch_dst; // @[execute.scala 48:22]
  wire [6:0] alu2_io_o_ex_res_pack_uop_rob_idx; // @[execute.scala 48:22]
  wire [63:0] alu2_io_o_ex_res_pack_uop_dst_value; // @[execute.scala 48:22]
  wire [63:0] alu2_io_o_ex_res_pack_uop_src1_value; // @[execute.scala 48:22]
  wire [4:0] alu2_io_o_ex_res_pack_uop_alu_sel; // @[execute.scala 48:22]
  wire  alu2_io_o_available; // @[execute.scala 48:22]
  wire  alu2_io_i_exception; // @[execute.scala 48:22]
  wire  alu2_io_i_rollback_valid; // @[execute.scala 48:22]
  wire [6:0] alu2_io_i_rollback_rob_idx; // @[execute.scala 48:22]
  wire  bru_clock; // @[execute.scala 49:21]
  wire  bru_reset; // @[execute.scala 49:21]
  wire  bru_io_o_branch_resolve_pack_valid; // @[execute.scala 49:21]
  wire  bru_io_o_branch_resolve_pack_mispred; // @[execute.scala 49:21]
  wire  bru_io_o_branch_resolve_pack_taken; // @[execute.scala 49:21]
  wire [63:0] bru_io_o_branch_resolve_pack_pc; // @[execute.scala 49:21]
  wire [63:0] bru_io_o_branch_resolve_pack_target; // @[execute.scala 49:21]
  wire [7:0] bru_io_o_branch_resolve_pack_rob_idx; // @[execute.scala 49:21]
  wire  bru_io_o_branch_resolve_pack_prediction_valid; // @[execute.scala 49:21]
  wire [2:0] bru_io_o_branch_resolve_pack_branch_type; // @[execute.scala 49:21]
  wire  bru_io_i_uop_valid; // @[execute.scala 49:21]
  wire [31:0] bru_io_i_uop_pc; // @[execute.scala 49:21]
  wire [31:0] bru_io_i_uop_inst; // @[execute.scala 49:21]
  wire [6:0] bru_io_i_uop_func_code; // @[execute.scala 49:21]
  wire  bru_io_i_uop_branch_predict_pack_valid; // @[execute.scala 49:21]
  wire [63:0] bru_io_i_uop_branch_predict_pack_target; // @[execute.scala 49:21]
  wire  bru_io_i_uop_branch_predict_pack_taken; // @[execute.scala 49:21]
  wire [6:0] bru_io_i_uop_phy_dst; // @[execute.scala 49:21]
  wire [6:0] bru_io_i_uop_stale_dst; // @[execute.scala 49:21]
  wire [4:0] bru_io_i_uop_arch_dst; // @[execute.scala 49:21]
  wire [6:0] bru_io_i_uop_rob_idx; // @[execute.scala 49:21]
  wire [63:0] bru_io_i_uop_imm; // @[execute.scala 49:21]
  wire [63:0] bru_io_i_uop_src1_value; // @[execute.scala 49:21]
  wire [63:0] bru_io_i_uop_src2_value; // @[execute.scala 49:21]
  wire [4:0] bru_io_i_uop_alu_sel; // @[execute.scala 49:21]
  wire [2:0] bru_io_i_uop_branch_type; // @[execute.scala 49:21]
  wire  bru_io_i_select; // @[execute.scala 49:21]
  wire  bru_io_i_select_to_commit; // @[execute.scala 49:21]
  wire  bru_io_o_ex_res_pack_valid; // @[execute.scala 49:21]
  wire  bru_io_o_ex_res_pack_uop_valid; // @[execute.scala 49:21]
  wire [31:0] bru_io_o_ex_res_pack_uop_pc; // @[execute.scala 49:21]
  wire [31:0] bru_io_o_ex_res_pack_uop_inst; // @[execute.scala 49:21]
  wire [6:0] bru_io_o_ex_res_pack_uop_func_code; // @[execute.scala 49:21]
  wire [6:0] bru_io_o_ex_res_pack_uop_phy_dst; // @[execute.scala 49:21]
  wire [6:0] bru_io_o_ex_res_pack_uop_stale_dst; // @[execute.scala 49:21]
  wire [4:0] bru_io_o_ex_res_pack_uop_arch_dst; // @[execute.scala 49:21]
  wire [6:0] bru_io_o_ex_res_pack_uop_rob_idx; // @[execute.scala 49:21]
  wire [63:0] bru_io_o_ex_res_pack_uop_dst_value; // @[execute.scala 49:21]
  wire [63:0] bru_io_o_ex_res_pack_uop_src1_value; // @[execute.scala 49:21]
  wire [4:0] bru_io_o_ex_res_pack_uop_alu_sel; // @[execute.scala 49:21]
  wire  bru_io_o_available; // @[execute.scala 49:21]
  wire  bru_io_i_exception; // @[execute.scala 49:21]
  wire  func_units_3_clock; // @[execute.scala 50:21]
  wire  func_units_3_reset; // @[execute.scala 50:21]
  wire  func_units_3_io_i_uop_valid; // @[execute.scala 50:21]
  wire [31:0] func_units_3_io_i_uop_pc; // @[execute.scala 50:21]
  wire [31:0] func_units_3_io_i_uop_inst; // @[execute.scala 50:21]
  wire [6:0] func_units_3_io_i_uop_func_code; // @[execute.scala 50:21]
  wire [6:0] func_units_3_io_i_uop_phy_dst; // @[execute.scala 50:21]
  wire [6:0] func_units_3_io_i_uop_stale_dst; // @[execute.scala 50:21]
  wire [4:0] func_units_3_io_i_uop_arch_dst; // @[execute.scala 50:21]
  wire [6:0] func_units_3_io_i_uop_rob_idx; // @[execute.scala 50:21]
  wire [63:0] func_units_3_io_i_uop_imm; // @[execute.scala 50:21]
  wire [63:0] func_units_3_io_i_uop_src1_value; // @[execute.scala 50:21]
  wire [63:0] func_units_3_io_i_uop_src2_value; // @[execute.scala 50:21]
  wire [4:0] func_units_3_io_i_uop_alu_sel; // @[execute.scala 50:21]
  wire [1:0] func_units_3_io_i_uop_mem_type; // @[execute.scala 50:21]
  wire  func_units_3_io_i_select; // @[execute.scala 50:21]
  wire  func_units_3_io_i_select_to_commit; // @[execute.scala 50:21]
  wire  func_units_3_io_o_ex_res_pack_valid; // @[execute.scala 50:21]
  wire  func_units_3_io_o_ex_res_pack_uop_valid; // @[execute.scala 50:21]
  wire [31:0] func_units_3_io_o_ex_res_pack_uop_pc; // @[execute.scala 50:21]
  wire [31:0] func_units_3_io_o_ex_res_pack_uop_inst; // @[execute.scala 50:21]
  wire [6:0] func_units_3_io_o_ex_res_pack_uop_func_code; // @[execute.scala 50:21]
  wire [6:0] func_units_3_io_o_ex_res_pack_uop_phy_dst; // @[execute.scala 50:21]
  wire [6:0] func_units_3_io_o_ex_res_pack_uop_stale_dst; // @[execute.scala 50:21]
  wire [4:0] func_units_3_io_o_ex_res_pack_uop_arch_dst; // @[execute.scala 50:21]
  wire [6:0] func_units_3_io_o_ex_res_pack_uop_rob_idx; // @[execute.scala 50:21]
  wire [63:0] func_units_3_io_o_ex_res_pack_uop_dst_value; // @[execute.scala 50:21]
  wire [63:0] func_units_3_io_o_ex_res_pack_uop_src1_value; // @[execute.scala 50:21]
  wire [4:0] func_units_3_io_o_ex_res_pack_uop_alu_sel; // @[execute.scala 50:21]
  wire  func_units_3_io_o_available; // @[execute.scala 50:21]
  wire [6:0] func_units_3_io_i_ROB_first_entry; // @[execute.scala 50:21]
  wire  func_units_3_io_dcache_io_data_valid; // @[execute.scala 50:21]
  wire  func_units_3_io_dcache_io_addr_valid; // @[execute.scala 50:21]
  wire  func_units_3_io_dcache_io_addr_ready; // @[execute.scala 50:21]
  wire  func_units_3_io_dcache_io_Mwout; // @[execute.scala 50:21]
  wire [63:0] func_units_3_io_dcache_io_Maddr; // @[execute.scala 50:21]
  wire  func_units_3_io_dcache_io_Men; // @[execute.scala 50:21]
  wire [31:0] func_units_3_io_dcache_io_Mlen; // @[execute.scala 50:21]
  wire [63:0] func_units_3_io_dcache_io_MdataIn; // @[execute.scala 50:21]
  wire [63:0] func_units_3_io_dcache_io_MdataOut; // @[execute.scala 50:21]
  wire  func_units_3_io_o_lsu_uop_valid; // @[execute.scala 50:21]
  wire [7:0] func_units_3_io_o_lsu_uop_rob_idx; // @[execute.scala 50:21]
  wire  func_units_3_io_i_exception; // @[execute.scala 50:21]
  wire  func_units_3_io_i_rollback_valid; // @[execute.scala 50:21]
  wire [6:0] func_units_3_io_i_rollback_rob_idx; // @[execute.scala 50:21]
  wire  func_units_4_clock; // @[execute.scala 51:21]
  wire  func_units_4_reset; // @[execute.scala 51:21]
  wire  func_units_4_io_i_uop_valid; // @[execute.scala 51:21]
  wire [31:0] func_units_4_io_i_uop_pc; // @[execute.scala 51:21]
  wire [31:0] func_units_4_io_i_uop_inst; // @[execute.scala 51:21]
  wire [6:0] func_units_4_io_i_uop_func_code; // @[execute.scala 51:21]
  wire [6:0] func_units_4_io_i_uop_phy_dst; // @[execute.scala 51:21]
  wire [6:0] func_units_4_io_i_uop_stale_dst; // @[execute.scala 51:21]
  wire [4:0] func_units_4_io_i_uop_arch_dst; // @[execute.scala 51:21]
  wire [6:0] func_units_4_io_i_uop_rob_idx; // @[execute.scala 51:21]
  wire [63:0] func_units_4_io_i_uop_src1_value; // @[execute.scala 51:21]
  wire [63:0] func_units_4_io_i_uop_src2_value; // @[execute.scala 51:21]
  wire [4:0] func_units_4_io_i_uop_alu_sel; // @[execute.scala 51:21]
  wire  func_units_4_io_i_select; // @[execute.scala 51:21]
  wire  func_units_4_io_i_select_to_commit; // @[execute.scala 51:21]
  wire  func_units_4_io_o_ex_res_pack_valid; // @[execute.scala 51:21]
  wire  func_units_4_io_o_ex_res_pack_uop_valid; // @[execute.scala 51:21]
  wire [31:0] func_units_4_io_o_ex_res_pack_uop_pc; // @[execute.scala 51:21]
  wire [31:0] func_units_4_io_o_ex_res_pack_uop_inst; // @[execute.scala 51:21]
  wire [6:0] func_units_4_io_o_ex_res_pack_uop_func_code; // @[execute.scala 51:21]
  wire [6:0] func_units_4_io_o_ex_res_pack_uop_phy_dst; // @[execute.scala 51:21]
  wire [6:0] func_units_4_io_o_ex_res_pack_uop_stale_dst; // @[execute.scala 51:21]
  wire [4:0] func_units_4_io_o_ex_res_pack_uop_arch_dst; // @[execute.scala 51:21]
  wire [6:0] func_units_4_io_o_ex_res_pack_uop_rob_idx; // @[execute.scala 51:21]
  wire [63:0] func_units_4_io_o_ex_res_pack_uop_dst_value; // @[execute.scala 51:21]
  wire [63:0] func_units_4_io_o_ex_res_pack_uop_src1_value; // @[execute.scala 51:21]
  wire [4:0] func_units_4_io_o_ex_res_pack_uop_alu_sel; // @[execute.scala 51:21]
  wire  func_units_4_io_o_available; // @[execute.scala 51:21]
  wire  func_units_4_io_i_exception; // @[execute.scala 51:21]
  wire  func_units_4_io_i_rollback_valid; // @[execute.scala 51:21]
  wire [6:0] func_units_4_io_i_rollback_rob_idx; // @[execute.scala 51:21]
  wire  div_clock; // @[execute.scala 52:21]
  wire  div_reset; // @[execute.scala 52:21]
  wire  div_io_i_uop_valid; // @[execute.scala 52:21]
  wire [31:0] div_io_i_uop_pc; // @[execute.scala 52:21]
  wire [31:0] div_io_i_uop_inst; // @[execute.scala 52:21]
  wire [6:0] div_io_i_uop_func_code; // @[execute.scala 52:21]
  wire [6:0] div_io_i_uop_phy_dst; // @[execute.scala 52:21]
  wire [6:0] div_io_i_uop_stale_dst; // @[execute.scala 52:21]
  wire [4:0] div_io_i_uop_arch_dst; // @[execute.scala 52:21]
  wire [6:0] div_io_i_uop_rob_idx; // @[execute.scala 52:21]
  wire [63:0] div_io_i_uop_src1_value; // @[execute.scala 52:21]
  wire [63:0] div_io_i_uop_src2_value; // @[execute.scala 52:21]
  wire [4:0] div_io_i_uop_alu_sel; // @[execute.scala 52:21]
  wire  div_io_i_select; // @[execute.scala 52:21]
  wire  div_io_i_select_to_commit; // @[execute.scala 52:21]
  wire  div_io_o_ex_res_pack_valid; // @[execute.scala 52:21]
  wire  div_io_o_ex_res_pack_uop_valid; // @[execute.scala 52:21]
  wire [31:0] div_io_o_ex_res_pack_uop_pc; // @[execute.scala 52:21]
  wire [31:0] div_io_o_ex_res_pack_uop_inst; // @[execute.scala 52:21]
  wire [6:0] div_io_o_ex_res_pack_uop_func_code; // @[execute.scala 52:21]
  wire [6:0] div_io_o_ex_res_pack_uop_phy_dst; // @[execute.scala 52:21]
  wire [6:0] div_io_o_ex_res_pack_uop_stale_dst; // @[execute.scala 52:21]
  wire [4:0] div_io_o_ex_res_pack_uop_arch_dst; // @[execute.scala 52:21]
  wire [6:0] div_io_o_ex_res_pack_uop_rob_idx; // @[execute.scala 52:21]
  wire [63:0] div_io_o_ex_res_pack_uop_dst_value; // @[execute.scala 52:21]
  wire [63:0] div_io_o_ex_res_pack_uop_src1_value; // @[execute.scala 52:21]
  wire [4:0] div_io_o_ex_res_pack_uop_alu_sel; // @[execute.scala 52:21]
  wire  div_io_o_available; // @[execute.scala 52:21]
  wire  div_io_i_exception; // @[execute.scala 52:21]
  wire  div_io_i_rollback_valid; // @[execute.scala 52:21]
  wire [6:0] div_io_i_rollback_rob_idx; // @[execute.scala 52:21]
  wire  csr_bf_clock; // @[execute.scala 53:24]
  wire  csr_bf_reset; // @[execute.scala 53:24]
  wire  csr_bf_io_i_uop_valid; // @[execute.scala 53:24]
  wire [31:0] csr_bf_io_i_uop_pc; // @[execute.scala 53:24]
  wire [31:0] csr_bf_io_i_uop_inst; // @[execute.scala 53:24]
  wire [6:0] csr_bf_io_i_uop_func_code; // @[execute.scala 53:24]
  wire [6:0] csr_bf_io_i_uop_phy_dst; // @[execute.scala 53:24]
  wire [6:0] csr_bf_io_i_uop_stale_dst; // @[execute.scala 53:24]
  wire [4:0] csr_bf_io_i_uop_arch_dst; // @[execute.scala 53:24]
  wire [6:0] csr_bf_io_i_uop_rob_idx; // @[execute.scala 53:24]
  wire [63:0] csr_bf_io_i_uop_src1_value; // @[execute.scala 53:24]
  wire [4:0] csr_bf_io_i_uop_alu_sel; // @[execute.scala 53:24]
  wire  csr_bf_io_i_select; // @[execute.scala 53:24]
  wire  csr_bf_io_i_select_to_commit; // @[execute.scala 53:24]
  wire  csr_bf_io_o_ex_res_pack_valid; // @[execute.scala 53:24]
  wire  csr_bf_io_o_ex_res_pack_uop_valid; // @[execute.scala 53:24]
  wire [31:0] csr_bf_io_o_ex_res_pack_uop_pc; // @[execute.scala 53:24]
  wire [31:0] csr_bf_io_o_ex_res_pack_uop_inst; // @[execute.scala 53:24]
  wire [6:0] csr_bf_io_o_ex_res_pack_uop_func_code; // @[execute.scala 53:24]
  wire [6:0] csr_bf_io_o_ex_res_pack_uop_phy_dst; // @[execute.scala 53:24]
  wire [6:0] csr_bf_io_o_ex_res_pack_uop_stale_dst; // @[execute.scala 53:24]
  wire [4:0] csr_bf_io_o_ex_res_pack_uop_arch_dst; // @[execute.scala 53:24]
  wire [6:0] csr_bf_io_o_ex_res_pack_uop_rob_idx; // @[execute.scala 53:24]
  wire [63:0] csr_bf_io_o_ex_res_pack_uop_src1_value; // @[execute.scala 53:24]
  wire [4:0] csr_bf_io_o_ex_res_pack_uop_alu_sel; // @[execute.scala 53:24]
  wire  csr_bf_io_o_available; // @[execute.scala 53:24]
  wire  csr_bf_io_i_exception; // @[execute.scala 53:24]
  wire  csr_bf_io_i_rollback_valid; // @[execute.scala 53:24]
  wire [6:0] csr_bf_io_i_rollback_rob_idx; // @[execute.scala 53:24]
  wire  _io_o_available_funcs_0_T_1 = alu1_io_o_available & ~alu2_io_o_available; // @[execute.scala 83:31]
  wire  _io_o_available_funcs_0_T_2 = ~alu1_io_o_available; // @[execute.scala 84:10]
  wire  _io_o_available_funcs_0_T_3 = ~alu1_io_o_available & alu2_io_o_available; // @[execute.scala 84:32]
  wire  _io_o_available_funcs_0_T_4 = alu1_io_o_available & alu2_io_o_available; // @[execute.scala 85:31]
  wire [1:0] _io_o_available_funcs_0_T_5 = _io_o_available_funcs_0_T_4 ? 2'h2 : 2'h0; // @[Mux.scala 101:16]
  wire [1:0] _io_o_available_funcs_0_T_6 = _io_o_available_funcs_0_T_3 ? 2'h1 : _io_o_available_funcs_0_T_5; // @[Mux.scala 101:16]
  wire  _io_o_available_funcs_1_T = bru_io_o_available; // @[execute.scala 87:33]
  wire  _io_o_available_funcs_2_T = func_units_3_io_o_available; // @[execute.scala 88:33]
  wire  _io_o_available_funcs_3_T = func_units_4_io_o_available; // @[execute.scala 89:33]
  wire  _io_o_available_funcs_4_T = div_io_o_available; // @[execute.scala 90:33]
  wire  _io_o_available_funcs_5_T = csr_bf_io_o_available; // @[execute.scala 91:33]
  wire  _alu1_io_i_select_T = ~io_i_rollback_valid; // @[execute.scala 95:25]
  wire  _alu1_io_i_select_T_1 = io_i_issue_res_packs_0_func_code == 7'h1; // @[execute.scala 95:123]
  wire  _alu1_io_i_select_T_2 = io_i_issue_res_packs_0_valid & io_i_issue_res_packs_0_func_code == 7'h1; // @[execute.scala 95:86]
  wire  _alu1_io_i_select_T_4 = io_i_issue_res_packs_1_valid & io_i_issue_res_packs_1_func_code == 7'h1; // @[execute.scala 96:53]
  wire  _alu1_io_i_select_T_5 = io_i_issue_res_packs_0_valid & io_i_issue_res_packs_0_func_code == 7'h1 |
    _alu1_io_i_select_T_4; // @[execute.scala 95:134]
  wire  _alu1_io_i_select_T_6 = _alu1_io_i_select_T_5 & alu1_io_o_available; // @[execute.scala 96:103]
  wire  _alu2_io_i_select_T_10 = _alu1_io_i_select_T_4 | _alu1_io_i_select_T_2; // @[execute.scala 100:92]
  wire  _alu2_io_i_select_T_12 = _alu2_io_i_select_T_10 & _io_o_available_funcs_0_T_2; // @[execute.scala 101:9]
  wire  _alu2_io_i_select_T_13 = _alu1_io_i_select_T_4 & io_i_issue_res_packs_0_valid & _alu1_io_i_select_T_1 |
    _alu2_io_i_select_T_12; // @[execute.scala 99:171]
  wire  _bru_io_i_select_T_3 = io_i_issue_res_packs_0_func_code == 7'h2; // @[execute.scala 104:98]
  wire  _bru_io_i_select_T_4 = io_i_issue_res_packs_0_valid & io_i_issue_res_packs_0_func_code == 7'h2; // @[execute.scala 104:61]
  wire  _lsu_io_i_select_T_3 = io_i_issue_res_packs_0_func_code == 7'h4; // @[execute.scala 107:98]
  wire  _lsu_io_i_select_T_4 = io_i_issue_res_packs_0_valid & io_i_issue_res_packs_0_func_code == 7'h4; // @[execute.scala 107:61]
  wire  _mul_io_i_select_T_3 = io_i_issue_res_packs_0_func_code == 7'h8; // @[execute.scala 110:98]
  wire  _mul_io_i_select_T_4 = io_i_issue_res_packs_0_valid & io_i_issue_res_packs_0_func_code == 7'h8; // @[execute.scala 110:61]
  wire  _div_io_i_select_T_3 = io_i_issue_res_packs_0_func_code == 7'h10; // @[execute.scala 113:98]
  wire  _div_io_i_select_T_4 = io_i_issue_res_packs_0_valid & io_i_issue_res_packs_0_func_code == 7'h10; // @[execute.scala 113:61]
  wire  _csr_bf_io_i_select_T_3 = io_i_issue_res_packs_0_func_code == 7'h20; // @[execute.scala 116:98]
  wire  _csr_bf_io_i_select_T_4 = io_i_issue_res_packs_0_valid & io_i_issue_res_packs_0_func_code == 7'h20; // @[execute.scala 116:61]
  wire [2:0] _issue_idx1_T = div_io_o_ex_res_pack_valid ? 3'h5 : 3'h6; // @[Mux.scala 47:70]
  wire [2:0] _issue_idx1_T_1 = func_units_4_io_o_ex_res_pack_valid ? 3'h4 : _issue_idx1_T; // @[Mux.scala 47:70]
  wire [2:0] _issue_idx1_T_2 = func_units_3_io_o_ex_res_pack_valid ? 3'h3 : _issue_idx1_T_1; // @[Mux.scala 47:70]
  wire [2:0] _issue_idx1_T_3 = bru_io_o_ex_res_pack_valid ? 3'h2 : _issue_idx1_T_2; // @[Mux.scala 47:70]
  wire [2:0] _issue_idx1_T_4 = alu2_io_o_ex_res_pack_valid ? 3'h1 : _issue_idx1_T_3; // @[Mux.scala 47:70]
  wire [2:0] issue_idx1 = alu1_io_o_ex_res_pack_valid ? 3'h0 : _issue_idx1_T_4; // @[Mux.scala 47:70]
  wire [2:0] _issue_idx2_T_1 = 3'h7 - 3'h1; // @[execute.scala 174:40]
  wire [2:0] _issue_idx2_T_2 = alu2_io_o_ex_res_pack_valid ? 3'h5 : 3'h6; // @[Mux.scala 47:70]
  wire [2:0] _issue_idx2_T_3 = bru_io_o_ex_res_pack_valid ? 3'h4 : _issue_idx2_T_2; // @[Mux.scala 47:70]
  wire [2:0] _issue_idx2_T_4 = func_units_3_io_o_ex_res_pack_valid ? 3'h3 : _issue_idx2_T_3; // @[Mux.scala 47:70]
  wire [2:0] _issue_idx2_T_5 = func_units_4_io_o_ex_res_pack_valid ? 3'h2 : _issue_idx2_T_4; // @[Mux.scala 47:70]
  wire [2:0] _issue_idx2_T_6 = div_io_o_ex_res_pack_valid ? 3'h1 : _issue_idx2_T_5; // @[Mux.scala 47:70]
  wire [2:0] _issue_idx2_T_7 = csr_bf_io_o_ex_res_pack_valid ? 3'h0 : _issue_idx2_T_6; // @[Mux.scala 47:70]
  wire [2:0] issue_idx2 = _issue_idx2_T_1 - _issue_idx2_T_7; // @[execute.scala 174:44]
  wire  _alu1_io_i_select_to_commit_T = 3'h0 == issue_idx1; // @[execute.scala 179:52]
  wire  _alu1_io_i_select_to_commit_T_1 = 3'h0 == issue_idx2; // @[execute.scala 179:73]
  wire  _alu2_io_i_select_to_commit_T = 3'h1 == issue_idx1; // @[execute.scala 179:52]
  wire  _alu2_io_i_select_to_commit_T_1 = 3'h1 == issue_idx2; // @[execute.scala 179:73]
  wire  _bru_io_i_select_to_commit_T = 3'h2 == issue_idx1; // @[execute.scala 179:52]
  wire  _bru_io_i_select_to_commit_T_1 = 3'h2 == issue_idx2; // @[execute.scala 179:73]
  wire  _lsu_io_i_select_to_commit_T = 3'h3 == issue_idx1; // @[execute.scala 179:52]
  wire  _lsu_io_i_select_to_commit_T_1 = 3'h3 == issue_idx2; // @[execute.scala 179:73]
  wire  _mul_io_i_select_to_commit_T = 3'h4 == issue_idx1; // @[execute.scala 179:52]
  wire  _mul_io_i_select_to_commit_T_1 = 3'h4 == issue_idx2; // @[execute.scala 179:73]
  wire  _div_io_i_select_to_commit_T = 3'h5 == issue_idx1; // @[execute.scala 179:52]
  wire  _div_io_i_select_to_commit_T_1 = 3'h5 == issue_idx2; // @[execute.scala 179:73]
  wire  _csr_bf_io_i_select_to_commit_T = 3'h6 == issue_idx1; // @[execute.scala 179:52]
  wire  _csr_bf_io_i_select_to_commit_T_1 = 3'h6 == issue_idx2; // @[execute.scala 179:73]
  wire  _io_o_ex_res_packs_0_uop_T_7_valid = _csr_bf_io_i_select_to_commit_T ? csr_bf_io_o_ex_res_pack_uop_valid :
    alu1_io_o_ex_res_pack_uop_valid; // @[Mux.scala 101:16]
  wire [31:0] _io_o_ex_res_packs_0_uop_T_7_pc = _csr_bf_io_i_select_to_commit_T ? csr_bf_io_o_ex_res_pack_uop_pc :
    alu1_io_o_ex_res_pack_uop_pc; // @[Mux.scala 101:16]
  wire [31:0] _io_o_ex_res_packs_0_uop_T_7_inst = _csr_bf_io_i_select_to_commit_T ? csr_bf_io_o_ex_res_pack_uop_inst :
    alu1_io_o_ex_res_pack_uop_inst; // @[Mux.scala 101:16]
  wire [6:0] _io_o_ex_res_packs_0_uop_T_7_func_code = _csr_bf_io_i_select_to_commit_T ?
    csr_bf_io_o_ex_res_pack_uop_func_code : alu1_io_o_ex_res_pack_uop_func_code; // @[Mux.scala 101:16]
  wire [6:0] _io_o_ex_res_packs_0_uop_T_7_phy_dst = _csr_bf_io_i_select_to_commit_T ?
    csr_bf_io_o_ex_res_pack_uop_phy_dst : alu1_io_o_ex_res_pack_uop_phy_dst; // @[Mux.scala 101:16]
  wire [6:0] _io_o_ex_res_packs_0_uop_T_7_stale_dst = _csr_bf_io_i_select_to_commit_T ?
    csr_bf_io_o_ex_res_pack_uop_stale_dst : alu1_io_o_ex_res_pack_uop_stale_dst; // @[Mux.scala 101:16]
  wire [4:0] _io_o_ex_res_packs_0_uop_T_7_arch_dst = _csr_bf_io_i_select_to_commit_T ?
    csr_bf_io_o_ex_res_pack_uop_arch_dst : alu1_io_o_ex_res_pack_uop_arch_dst; // @[Mux.scala 101:16]
  wire [6:0] _io_o_ex_res_packs_0_uop_T_7_rob_idx = _csr_bf_io_i_select_to_commit_T ?
    csr_bf_io_o_ex_res_pack_uop_rob_idx : alu1_io_o_ex_res_pack_uop_rob_idx; // @[Mux.scala 101:16]
  wire [63:0] _io_o_ex_res_packs_0_uop_T_7_dst_value = _csr_bf_io_i_select_to_commit_T ? 64'h0 :
    alu1_io_o_ex_res_pack_uop_dst_value; // @[Mux.scala 101:16]
  wire [63:0] _io_o_ex_res_packs_0_uop_T_7_src1_value = _csr_bf_io_i_select_to_commit_T ?
    csr_bf_io_o_ex_res_pack_uop_src1_value : alu1_io_o_ex_res_pack_uop_src1_value; // @[Mux.scala 101:16]
  wire [4:0] _io_o_ex_res_packs_0_uop_T_7_alu_sel = _csr_bf_io_i_select_to_commit_T ?
    csr_bf_io_o_ex_res_pack_uop_alu_sel : alu1_io_o_ex_res_pack_uop_alu_sel; // @[Mux.scala 101:16]
  wire  _io_o_ex_res_packs_0_uop_T_8_valid = _div_io_i_select_to_commit_T ? div_io_o_ex_res_pack_uop_valid :
    _io_o_ex_res_packs_0_uop_T_7_valid; // @[Mux.scala 101:16]
  wire [31:0] _io_o_ex_res_packs_0_uop_T_8_pc = _div_io_i_select_to_commit_T ? div_io_o_ex_res_pack_uop_pc :
    _io_o_ex_res_packs_0_uop_T_7_pc; // @[Mux.scala 101:16]
  wire [31:0] _io_o_ex_res_packs_0_uop_T_8_inst = _div_io_i_select_to_commit_T ? div_io_o_ex_res_pack_uop_inst :
    _io_o_ex_res_packs_0_uop_T_7_inst; // @[Mux.scala 101:16]
  wire [6:0] _io_o_ex_res_packs_0_uop_T_8_func_code = _div_io_i_select_to_commit_T ? div_io_o_ex_res_pack_uop_func_code
     : _io_o_ex_res_packs_0_uop_T_7_func_code; // @[Mux.scala 101:16]
  wire [6:0] _io_o_ex_res_packs_0_uop_T_8_phy_dst = _div_io_i_select_to_commit_T ? div_io_o_ex_res_pack_uop_phy_dst :
    _io_o_ex_res_packs_0_uop_T_7_phy_dst; // @[Mux.scala 101:16]
  wire [6:0] _io_o_ex_res_packs_0_uop_T_8_stale_dst = _div_io_i_select_to_commit_T ? div_io_o_ex_res_pack_uop_stale_dst
     : _io_o_ex_res_packs_0_uop_T_7_stale_dst; // @[Mux.scala 101:16]
  wire [4:0] _io_o_ex_res_packs_0_uop_T_8_arch_dst = _div_io_i_select_to_commit_T ? div_io_o_ex_res_pack_uop_arch_dst :
    _io_o_ex_res_packs_0_uop_T_7_arch_dst; // @[Mux.scala 101:16]
  wire [6:0] _io_o_ex_res_packs_0_uop_T_8_rob_idx = _div_io_i_select_to_commit_T ? div_io_o_ex_res_pack_uop_rob_idx :
    _io_o_ex_res_packs_0_uop_T_7_rob_idx; // @[Mux.scala 101:16]
  wire [63:0] _io_o_ex_res_packs_0_uop_T_8_dst_value = _div_io_i_select_to_commit_T ? div_io_o_ex_res_pack_uop_dst_value
     : _io_o_ex_res_packs_0_uop_T_7_dst_value; // @[Mux.scala 101:16]
  wire [63:0] _io_o_ex_res_packs_0_uop_T_8_src1_value = _div_io_i_select_to_commit_T ?
    div_io_o_ex_res_pack_uop_src1_value : _io_o_ex_res_packs_0_uop_T_7_src1_value; // @[Mux.scala 101:16]
  wire [4:0] _io_o_ex_res_packs_0_uop_T_8_alu_sel = _div_io_i_select_to_commit_T ? div_io_o_ex_res_pack_uop_alu_sel :
    _io_o_ex_res_packs_0_uop_T_7_alu_sel; // @[Mux.scala 101:16]
  wire  _io_o_ex_res_packs_0_uop_T_9_valid = _mul_io_i_select_to_commit_T ? func_units_4_io_o_ex_res_pack_uop_valid :
    _io_o_ex_res_packs_0_uop_T_8_valid; // @[Mux.scala 101:16]
  wire [31:0] _io_o_ex_res_packs_0_uop_T_9_pc = _mul_io_i_select_to_commit_T ? func_units_4_io_o_ex_res_pack_uop_pc :
    _io_o_ex_res_packs_0_uop_T_8_pc; // @[Mux.scala 101:16]
  wire [31:0] _io_o_ex_res_packs_0_uop_T_9_inst = _mul_io_i_select_to_commit_T ? func_units_4_io_o_ex_res_pack_uop_inst
     : _io_o_ex_res_packs_0_uop_T_8_inst; // @[Mux.scala 101:16]
  wire [6:0] _io_o_ex_res_packs_0_uop_T_9_func_code = _mul_io_i_select_to_commit_T ?
    func_units_4_io_o_ex_res_pack_uop_func_code : _io_o_ex_res_packs_0_uop_T_8_func_code; // @[Mux.scala 101:16]
  wire [6:0] _io_o_ex_res_packs_0_uop_T_9_phy_dst = _mul_io_i_select_to_commit_T ?
    func_units_4_io_o_ex_res_pack_uop_phy_dst : _io_o_ex_res_packs_0_uop_T_8_phy_dst; // @[Mux.scala 101:16]
  wire [6:0] _io_o_ex_res_packs_0_uop_T_9_stale_dst = _mul_io_i_select_to_commit_T ?
    func_units_4_io_o_ex_res_pack_uop_stale_dst : _io_o_ex_res_packs_0_uop_T_8_stale_dst; // @[Mux.scala 101:16]
  wire [4:0] _io_o_ex_res_packs_0_uop_T_9_arch_dst = _mul_io_i_select_to_commit_T ?
    func_units_4_io_o_ex_res_pack_uop_arch_dst : _io_o_ex_res_packs_0_uop_T_8_arch_dst; // @[Mux.scala 101:16]
  wire [6:0] _io_o_ex_res_packs_0_uop_T_9_rob_idx = _mul_io_i_select_to_commit_T ?
    func_units_4_io_o_ex_res_pack_uop_rob_idx : _io_o_ex_res_packs_0_uop_T_8_rob_idx; // @[Mux.scala 101:16]
  wire [63:0] _io_o_ex_res_packs_0_uop_T_9_dst_value = _mul_io_i_select_to_commit_T ?
    func_units_4_io_o_ex_res_pack_uop_dst_value : _io_o_ex_res_packs_0_uop_T_8_dst_value; // @[Mux.scala 101:16]
  wire [63:0] _io_o_ex_res_packs_0_uop_T_9_src1_value = _mul_io_i_select_to_commit_T ?
    func_units_4_io_o_ex_res_pack_uop_src1_value : _io_o_ex_res_packs_0_uop_T_8_src1_value; // @[Mux.scala 101:16]
  wire [4:0] _io_o_ex_res_packs_0_uop_T_9_alu_sel = _mul_io_i_select_to_commit_T ?
    func_units_4_io_o_ex_res_pack_uop_alu_sel : _io_o_ex_res_packs_0_uop_T_8_alu_sel; // @[Mux.scala 101:16]
  wire  _io_o_ex_res_packs_0_uop_T_10_valid = _lsu_io_i_select_to_commit_T ? func_units_3_io_o_ex_res_pack_uop_valid :
    _io_o_ex_res_packs_0_uop_T_9_valid; // @[Mux.scala 101:16]
  wire [31:0] _io_o_ex_res_packs_0_uop_T_10_pc = _lsu_io_i_select_to_commit_T ? func_units_3_io_o_ex_res_pack_uop_pc :
    _io_o_ex_res_packs_0_uop_T_9_pc; // @[Mux.scala 101:16]
  wire [31:0] _io_o_ex_res_packs_0_uop_T_10_inst = _lsu_io_i_select_to_commit_T ? func_units_3_io_o_ex_res_pack_uop_inst
     : _io_o_ex_res_packs_0_uop_T_9_inst; // @[Mux.scala 101:16]
  wire [6:0] _io_o_ex_res_packs_0_uop_T_10_func_code = _lsu_io_i_select_to_commit_T ?
    func_units_3_io_o_ex_res_pack_uop_func_code : _io_o_ex_res_packs_0_uop_T_9_func_code; // @[Mux.scala 101:16]
  wire [6:0] _io_o_ex_res_packs_0_uop_T_10_phy_dst = _lsu_io_i_select_to_commit_T ?
    func_units_3_io_o_ex_res_pack_uop_phy_dst : _io_o_ex_res_packs_0_uop_T_9_phy_dst; // @[Mux.scala 101:16]
  wire [6:0] _io_o_ex_res_packs_0_uop_T_10_stale_dst = _lsu_io_i_select_to_commit_T ?
    func_units_3_io_o_ex_res_pack_uop_stale_dst : _io_o_ex_res_packs_0_uop_T_9_stale_dst; // @[Mux.scala 101:16]
  wire [4:0] _io_o_ex_res_packs_0_uop_T_10_arch_dst = _lsu_io_i_select_to_commit_T ?
    func_units_3_io_o_ex_res_pack_uop_arch_dst : _io_o_ex_res_packs_0_uop_T_9_arch_dst; // @[Mux.scala 101:16]
  wire [6:0] _io_o_ex_res_packs_0_uop_T_10_rob_idx = _lsu_io_i_select_to_commit_T ?
    func_units_3_io_o_ex_res_pack_uop_rob_idx : _io_o_ex_res_packs_0_uop_T_9_rob_idx; // @[Mux.scala 101:16]
  wire [63:0] _io_o_ex_res_packs_0_uop_T_10_dst_value = _lsu_io_i_select_to_commit_T ?
    func_units_3_io_o_ex_res_pack_uop_dst_value : _io_o_ex_res_packs_0_uop_T_9_dst_value; // @[Mux.scala 101:16]
  wire [63:0] _io_o_ex_res_packs_0_uop_T_10_src1_value = _lsu_io_i_select_to_commit_T ?
    func_units_3_io_o_ex_res_pack_uop_src1_value : _io_o_ex_res_packs_0_uop_T_9_src1_value; // @[Mux.scala 101:16]
  wire [4:0] _io_o_ex_res_packs_0_uop_T_10_alu_sel = _lsu_io_i_select_to_commit_T ?
    func_units_3_io_o_ex_res_pack_uop_alu_sel : _io_o_ex_res_packs_0_uop_T_9_alu_sel; // @[Mux.scala 101:16]
  wire  _io_o_ex_res_packs_0_uop_T_11_valid = _bru_io_i_select_to_commit_T ? bru_io_o_ex_res_pack_uop_valid :
    _io_o_ex_res_packs_0_uop_T_10_valid; // @[Mux.scala 101:16]
  wire [31:0] _io_o_ex_res_packs_0_uop_T_11_pc = _bru_io_i_select_to_commit_T ? bru_io_o_ex_res_pack_uop_pc :
    _io_o_ex_res_packs_0_uop_T_10_pc; // @[Mux.scala 101:16]
  wire [31:0] _io_o_ex_res_packs_0_uop_T_11_inst = _bru_io_i_select_to_commit_T ? bru_io_o_ex_res_pack_uop_inst :
    _io_o_ex_res_packs_0_uop_T_10_inst; // @[Mux.scala 101:16]
  wire [6:0] _io_o_ex_res_packs_0_uop_T_11_func_code = _bru_io_i_select_to_commit_T ? bru_io_o_ex_res_pack_uop_func_code
     : _io_o_ex_res_packs_0_uop_T_10_func_code; // @[Mux.scala 101:16]
  wire [6:0] _io_o_ex_res_packs_0_uop_T_11_phy_dst = _bru_io_i_select_to_commit_T ? bru_io_o_ex_res_pack_uop_phy_dst :
    _io_o_ex_res_packs_0_uop_T_10_phy_dst; // @[Mux.scala 101:16]
  wire [6:0] _io_o_ex_res_packs_0_uop_T_11_stale_dst = _bru_io_i_select_to_commit_T ? bru_io_o_ex_res_pack_uop_stale_dst
     : _io_o_ex_res_packs_0_uop_T_10_stale_dst; // @[Mux.scala 101:16]
  wire [4:0] _io_o_ex_res_packs_0_uop_T_11_arch_dst = _bru_io_i_select_to_commit_T ? bru_io_o_ex_res_pack_uop_arch_dst
     : _io_o_ex_res_packs_0_uop_T_10_arch_dst; // @[Mux.scala 101:16]
  wire [6:0] _io_o_ex_res_packs_0_uop_T_11_rob_idx = _bru_io_i_select_to_commit_T ? bru_io_o_ex_res_pack_uop_rob_idx :
    _io_o_ex_res_packs_0_uop_T_10_rob_idx; // @[Mux.scala 101:16]
  wire [63:0] _io_o_ex_res_packs_0_uop_T_11_dst_value = _bru_io_i_select_to_commit_T ?
    bru_io_o_ex_res_pack_uop_dst_value : _io_o_ex_res_packs_0_uop_T_10_dst_value; // @[Mux.scala 101:16]
  wire [63:0] _io_o_ex_res_packs_0_uop_T_11_src1_value = _bru_io_i_select_to_commit_T ?
    bru_io_o_ex_res_pack_uop_src1_value : _io_o_ex_res_packs_0_uop_T_10_src1_value; // @[Mux.scala 101:16]
  wire [4:0] _io_o_ex_res_packs_0_uop_T_11_alu_sel = _bru_io_i_select_to_commit_T ? bru_io_o_ex_res_pack_uop_alu_sel :
    _io_o_ex_res_packs_0_uop_T_10_alu_sel; // @[Mux.scala 101:16]
  wire  _io_o_ex_res_packs_0_uop_T_12_valid = _alu2_io_i_select_to_commit_T ? alu2_io_o_ex_res_pack_uop_valid :
    _io_o_ex_res_packs_0_uop_T_11_valid; // @[Mux.scala 101:16]
  wire [31:0] _io_o_ex_res_packs_0_uop_T_12_pc = _alu2_io_i_select_to_commit_T ? alu2_io_o_ex_res_pack_uop_pc :
    _io_o_ex_res_packs_0_uop_T_11_pc; // @[Mux.scala 101:16]
  wire [31:0] _io_o_ex_res_packs_0_uop_T_12_inst = _alu2_io_i_select_to_commit_T ? alu2_io_o_ex_res_pack_uop_inst :
    _io_o_ex_res_packs_0_uop_T_11_inst; // @[Mux.scala 101:16]
  wire [6:0] _io_o_ex_res_packs_0_uop_T_12_func_code = _alu2_io_i_select_to_commit_T ?
    alu2_io_o_ex_res_pack_uop_func_code : _io_o_ex_res_packs_0_uop_T_11_func_code; // @[Mux.scala 101:16]
  wire [6:0] _io_o_ex_res_packs_0_uop_T_12_phy_dst = _alu2_io_i_select_to_commit_T ? alu2_io_o_ex_res_pack_uop_phy_dst
     : _io_o_ex_res_packs_0_uop_T_11_phy_dst; // @[Mux.scala 101:16]
  wire [6:0] _io_o_ex_res_packs_0_uop_T_12_stale_dst = _alu2_io_i_select_to_commit_T ?
    alu2_io_o_ex_res_pack_uop_stale_dst : _io_o_ex_res_packs_0_uop_T_11_stale_dst; // @[Mux.scala 101:16]
  wire [4:0] _io_o_ex_res_packs_0_uop_T_12_arch_dst = _alu2_io_i_select_to_commit_T ? alu2_io_o_ex_res_pack_uop_arch_dst
     : _io_o_ex_res_packs_0_uop_T_11_arch_dst; // @[Mux.scala 101:16]
  wire [6:0] _io_o_ex_res_packs_0_uop_T_12_rob_idx = _alu2_io_i_select_to_commit_T ? alu2_io_o_ex_res_pack_uop_rob_idx
     : _io_o_ex_res_packs_0_uop_T_11_rob_idx; // @[Mux.scala 101:16]
  wire [63:0] _io_o_ex_res_packs_0_uop_T_12_dst_value = _alu2_io_i_select_to_commit_T ?
    alu2_io_o_ex_res_pack_uop_dst_value : _io_o_ex_res_packs_0_uop_T_11_dst_value; // @[Mux.scala 101:16]
  wire [63:0] _io_o_ex_res_packs_0_uop_T_12_src1_value = _alu2_io_i_select_to_commit_T ?
    alu2_io_o_ex_res_pack_uop_src1_value : _io_o_ex_res_packs_0_uop_T_11_src1_value; // @[Mux.scala 101:16]
  wire [4:0] _io_o_ex_res_packs_0_uop_T_12_alu_sel = _alu2_io_i_select_to_commit_T ? alu2_io_o_ex_res_pack_uop_alu_sel
     : _io_o_ex_res_packs_0_uop_T_11_alu_sel; // @[Mux.scala 101:16]
  wire  _io_o_ex_res_packs_1_uop_T_7_valid = _csr_bf_io_i_select_to_commit_T_1 ? csr_bf_io_o_ex_res_pack_uop_valid :
    alu1_io_o_ex_res_pack_uop_valid; // @[Mux.scala 101:16]
  wire [31:0] _io_o_ex_res_packs_1_uop_T_7_pc = _csr_bf_io_i_select_to_commit_T_1 ? csr_bf_io_o_ex_res_pack_uop_pc :
    alu1_io_o_ex_res_pack_uop_pc; // @[Mux.scala 101:16]
  wire [31:0] _io_o_ex_res_packs_1_uop_T_7_inst = _csr_bf_io_i_select_to_commit_T_1 ? csr_bf_io_o_ex_res_pack_uop_inst
     : alu1_io_o_ex_res_pack_uop_inst; // @[Mux.scala 101:16]
  wire [6:0] _io_o_ex_res_packs_1_uop_T_7_func_code = _csr_bf_io_i_select_to_commit_T_1 ?
    csr_bf_io_o_ex_res_pack_uop_func_code : alu1_io_o_ex_res_pack_uop_func_code; // @[Mux.scala 101:16]
  wire [6:0] _io_o_ex_res_packs_1_uop_T_7_phy_dst = _csr_bf_io_i_select_to_commit_T_1 ?
    csr_bf_io_o_ex_res_pack_uop_phy_dst : alu1_io_o_ex_res_pack_uop_phy_dst; // @[Mux.scala 101:16]
  wire [6:0] _io_o_ex_res_packs_1_uop_T_7_stale_dst = _csr_bf_io_i_select_to_commit_T_1 ?
    csr_bf_io_o_ex_res_pack_uop_stale_dst : alu1_io_o_ex_res_pack_uop_stale_dst; // @[Mux.scala 101:16]
  wire [4:0] _io_o_ex_res_packs_1_uop_T_7_arch_dst = _csr_bf_io_i_select_to_commit_T_1 ?
    csr_bf_io_o_ex_res_pack_uop_arch_dst : alu1_io_o_ex_res_pack_uop_arch_dst; // @[Mux.scala 101:16]
  wire [6:0] _io_o_ex_res_packs_1_uop_T_7_rob_idx = _csr_bf_io_i_select_to_commit_T_1 ?
    csr_bf_io_o_ex_res_pack_uop_rob_idx : alu1_io_o_ex_res_pack_uop_rob_idx; // @[Mux.scala 101:16]
  wire [63:0] _io_o_ex_res_packs_1_uop_T_7_dst_value = _csr_bf_io_i_select_to_commit_T_1 ? 64'h0 :
    alu1_io_o_ex_res_pack_uop_dst_value; // @[Mux.scala 101:16]
  wire [63:0] _io_o_ex_res_packs_1_uop_T_7_src1_value = _csr_bf_io_i_select_to_commit_T_1 ?
    csr_bf_io_o_ex_res_pack_uop_src1_value : alu1_io_o_ex_res_pack_uop_src1_value; // @[Mux.scala 101:16]
  wire [4:0] _io_o_ex_res_packs_1_uop_T_7_alu_sel = _csr_bf_io_i_select_to_commit_T_1 ?
    csr_bf_io_o_ex_res_pack_uop_alu_sel : alu1_io_o_ex_res_pack_uop_alu_sel; // @[Mux.scala 101:16]
  wire  _io_o_ex_res_packs_1_uop_T_8_valid = _div_io_i_select_to_commit_T_1 ? div_io_o_ex_res_pack_uop_valid :
    _io_o_ex_res_packs_1_uop_T_7_valid; // @[Mux.scala 101:16]
  wire [31:0] _io_o_ex_res_packs_1_uop_T_8_pc = _div_io_i_select_to_commit_T_1 ? div_io_o_ex_res_pack_uop_pc :
    _io_o_ex_res_packs_1_uop_T_7_pc; // @[Mux.scala 101:16]
  wire [31:0] _io_o_ex_res_packs_1_uop_T_8_inst = _div_io_i_select_to_commit_T_1 ? div_io_o_ex_res_pack_uop_inst :
    _io_o_ex_res_packs_1_uop_T_7_inst; // @[Mux.scala 101:16]
  wire [6:0] _io_o_ex_res_packs_1_uop_T_8_func_code = _div_io_i_select_to_commit_T_1 ?
    div_io_o_ex_res_pack_uop_func_code : _io_o_ex_res_packs_1_uop_T_7_func_code; // @[Mux.scala 101:16]
  wire [6:0] _io_o_ex_res_packs_1_uop_T_8_phy_dst = _div_io_i_select_to_commit_T_1 ? div_io_o_ex_res_pack_uop_phy_dst :
    _io_o_ex_res_packs_1_uop_T_7_phy_dst; // @[Mux.scala 101:16]
  wire [6:0] _io_o_ex_res_packs_1_uop_T_8_stale_dst = _div_io_i_select_to_commit_T_1 ?
    div_io_o_ex_res_pack_uop_stale_dst : _io_o_ex_res_packs_1_uop_T_7_stale_dst; // @[Mux.scala 101:16]
  wire [4:0] _io_o_ex_res_packs_1_uop_T_8_arch_dst = _div_io_i_select_to_commit_T_1 ? div_io_o_ex_res_pack_uop_arch_dst
     : _io_o_ex_res_packs_1_uop_T_7_arch_dst; // @[Mux.scala 101:16]
  wire [6:0] _io_o_ex_res_packs_1_uop_T_8_rob_idx = _div_io_i_select_to_commit_T_1 ? div_io_o_ex_res_pack_uop_rob_idx :
    _io_o_ex_res_packs_1_uop_T_7_rob_idx; // @[Mux.scala 101:16]
  wire [63:0] _io_o_ex_res_packs_1_uop_T_8_dst_value = _div_io_i_select_to_commit_T_1 ?
    div_io_o_ex_res_pack_uop_dst_value : _io_o_ex_res_packs_1_uop_T_7_dst_value; // @[Mux.scala 101:16]
  wire [63:0] _io_o_ex_res_packs_1_uop_T_8_src1_value = _div_io_i_select_to_commit_T_1 ?
    div_io_o_ex_res_pack_uop_src1_value : _io_o_ex_res_packs_1_uop_T_7_src1_value; // @[Mux.scala 101:16]
  wire [4:0] _io_o_ex_res_packs_1_uop_T_8_alu_sel = _div_io_i_select_to_commit_T_1 ? div_io_o_ex_res_pack_uop_alu_sel :
    _io_o_ex_res_packs_1_uop_T_7_alu_sel; // @[Mux.scala 101:16]
  wire  _io_o_ex_res_packs_1_uop_T_9_valid = _mul_io_i_select_to_commit_T_1 ? func_units_4_io_o_ex_res_pack_uop_valid :
    _io_o_ex_res_packs_1_uop_T_8_valid; // @[Mux.scala 101:16]
  wire [31:0] _io_o_ex_res_packs_1_uop_T_9_pc = _mul_io_i_select_to_commit_T_1 ? func_units_4_io_o_ex_res_pack_uop_pc :
    _io_o_ex_res_packs_1_uop_T_8_pc; // @[Mux.scala 101:16]
  wire [31:0] _io_o_ex_res_packs_1_uop_T_9_inst = _mul_io_i_select_to_commit_T_1 ?
    func_units_4_io_o_ex_res_pack_uop_inst : _io_o_ex_res_packs_1_uop_T_8_inst; // @[Mux.scala 101:16]
  wire [6:0] _io_o_ex_res_packs_1_uop_T_9_func_code = _mul_io_i_select_to_commit_T_1 ?
    func_units_4_io_o_ex_res_pack_uop_func_code : _io_o_ex_res_packs_1_uop_T_8_func_code; // @[Mux.scala 101:16]
  wire [6:0] _io_o_ex_res_packs_1_uop_T_9_phy_dst = _mul_io_i_select_to_commit_T_1 ?
    func_units_4_io_o_ex_res_pack_uop_phy_dst : _io_o_ex_res_packs_1_uop_T_8_phy_dst; // @[Mux.scala 101:16]
  wire [6:0] _io_o_ex_res_packs_1_uop_T_9_stale_dst = _mul_io_i_select_to_commit_T_1 ?
    func_units_4_io_o_ex_res_pack_uop_stale_dst : _io_o_ex_res_packs_1_uop_T_8_stale_dst; // @[Mux.scala 101:16]
  wire [4:0] _io_o_ex_res_packs_1_uop_T_9_arch_dst = _mul_io_i_select_to_commit_T_1 ?
    func_units_4_io_o_ex_res_pack_uop_arch_dst : _io_o_ex_res_packs_1_uop_T_8_arch_dst; // @[Mux.scala 101:16]
  wire [6:0] _io_o_ex_res_packs_1_uop_T_9_rob_idx = _mul_io_i_select_to_commit_T_1 ?
    func_units_4_io_o_ex_res_pack_uop_rob_idx : _io_o_ex_res_packs_1_uop_T_8_rob_idx; // @[Mux.scala 101:16]
  wire [63:0] _io_o_ex_res_packs_1_uop_T_9_dst_value = _mul_io_i_select_to_commit_T_1 ?
    func_units_4_io_o_ex_res_pack_uop_dst_value : _io_o_ex_res_packs_1_uop_T_8_dst_value; // @[Mux.scala 101:16]
  wire [63:0] _io_o_ex_res_packs_1_uop_T_9_src1_value = _mul_io_i_select_to_commit_T_1 ?
    func_units_4_io_o_ex_res_pack_uop_src1_value : _io_o_ex_res_packs_1_uop_T_8_src1_value; // @[Mux.scala 101:16]
  wire [4:0] _io_o_ex_res_packs_1_uop_T_9_alu_sel = _mul_io_i_select_to_commit_T_1 ?
    func_units_4_io_o_ex_res_pack_uop_alu_sel : _io_o_ex_res_packs_1_uop_T_8_alu_sel; // @[Mux.scala 101:16]
  wire  _io_o_ex_res_packs_1_uop_T_10_valid = _lsu_io_i_select_to_commit_T_1 ? func_units_3_io_o_ex_res_pack_uop_valid
     : _io_o_ex_res_packs_1_uop_T_9_valid; // @[Mux.scala 101:16]
  wire [31:0] _io_o_ex_res_packs_1_uop_T_10_pc = _lsu_io_i_select_to_commit_T_1 ? func_units_3_io_o_ex_res_pack_uop_pc
     : _io_o_ex_res_packs_1_uop_T_9_pc; // @[Mux.scala 101:16]
  wire [31:0] _io_o_ex_res_packs_1_uop_T_10_inst = _lsu_io_i_select_to_commit_T_1 ?
    func_units_3_io_o_ex_res_pack_uop_inst : _io_o_ex_res_packs_1_uop_T_9_inst; // @[Mux.scala 101:16]
  wire [6:0] _io_o_ex_res_packs_1_uop_T_10_func_code = _lsu_io_i_select_to_commit_T_1 ?
    func_units_3_io_o_ex_res_pack_uop_func_code : _io_o_ex_res_packs_1_uop_T_9_func_code; // @[Mux.scala 101:16]
  wire [6:0] _io_o_ex_res_packs_1_uop_T_10_phy_dst = _lsu_io_i_select_to_commit_T_1 ?
    func_units_3_io_o_ex_res_pack_uop_phy_dst : _io_o_ex_res_packs_1_uop_T_9_phy_dst; // @[Mux.scala 101:16]
  wire [6:0] _io_o_ex_res_packs_1_uop_T_10_stale_dst = _lsu_io_i_select_to_commit_T_1 ?
    func_units_3_io_o_ex_res_pack_uop_stale_dst : _io_o_ex_res_packs_1_uop_T_9_stale_dst; // @[Mux.scala 101:16]
  wire [4:0] _io_o_ex_res_packs_1_uop_T_10_arch_dst = _lsu_io_i_select_to_commit_T_1 ?
    func_units_3_io_o_ex_res_pack_uop_arch_dst : _io_o_ex_res_packs_1_uop_T_9_arch_dst; // @[Mux.scala 101:16]
  wire [6:0] _io_o_ex_res_packs_1_uop_T_10_rob_idx = _lsu_io_i_select_to_commit_T_1 ?
    func_units_3_io_o_ex_res_pack_uop_rob_idx : _io_o_ex_res_packs_1_uop_T_9_rob_idx; // @[Mux.scala 101:16]
  wire [63:0] _io_o_ex_res_packs_1_uop_T_10_dst_value = _lsu_io_i_select_to_commit_T_1 ?
    func_units_3_io_o_ex_res_pack_uop_dst_value : _io_o_ex_res_packs_1_uop_T_9_dst_value; // @[Mux.scala 101:16]
  wire [63:0] _io_o_ex_res_packs_1_uop_T_10_src1_value = _lsu_io_i_select_to_commit_T_1 ?
    func_units_3_io_o_ex_res_pack_uop_src1_value : _io_o_ex_res_packs_1_uop_T_9_src1_value; // @[Mux.scala 101:16]
  wire [4:0] _io_o_ex_res_packs_1_uop_T_10_alu_sel = _lsu_io_i_select_to_commit_T_1 ?
    func_units_3_io_o_ex_res_pack_uop_alu_sel : _io_o_ex_res_packs_1_uop_T_9_alu_sel; // @[Mux.scala 101:16]
  wire  _io_o_ex_res_packs_1_uop_T_11_valid = _bru_io_i_select_to_commit_T_1 ? bru_io_o_ex_res_pack_uop_valid :
    _io_o_ex_res_packs_1_uop_T_10_valid; // @[Mux.scala 101:16]
  wire [31:0] _io_o_ex_res_packs_1_uop_T_11_pc = _bru_io_i_select_to_commit_T_1 ? bru_io_o_ex_res_pack_uop_pc :
    _io_o_ex_res_packs_1_uop_T_10_pc; // @[Mux.scala 101:16]
  wire [31:0] _io_o_ex_res_packs_1_uop_T_11_inst = _bru_io_i_select_to_commit_T_1 ? bru_io_o_ex_res_pack_uop_inst :
    _io_o_ex_res_packs_1_uop_T_10_inst; // @[Mux.scala 101:16]
  wire [6:0] _io_o_ex_res_packs_1_uop_T_11_func_code = _bru_io_i_select_to_commit_T_1 ?
    bru_io_o_ex_res_pack_uop_func_code : _io_o_ex_res_packs_1_uop_T_10_func_code; // @[Mux.scala 101:16]
  wire [6:0] _io_o_ex_res_packs_1_uop_T_11_phy_dst = _bru_io_i_select_to_commit_T_1 ? bru_io_o_ex_res_pack_uop_phy_dst
     : _io_o_ex_res_packs_1_uop_T_10_phy_dst; // @[Mux.scala 101:16]
  wire [6:0] _io_o_ex_res_packs_1_uop_T_11_stale_dst = _bru_io_i_select_to_commit_T_1 ?
    bru_io_o_ex_res_pack_uop_stale_dst : _io_o_ex_res_packs_1_uop_T_10_stale_dst; // @[Mux.scala 101:16]
  wire [4:0] _io_o_ex_res_packs_1_uop_T_11_arch_dst = _bru_io_i_select_to_commit_T_1 ? bru_io_o_ex_res_pack_uop_arch_dst
     : _io_o_ex_res_packs_1_uop_T_10_arch_dst; // @[Mux.scala 101:16]
  wire [6:0] _io_o_ex_res_packs_1_uop_T_11_rob_idx = _bru_io_i_select_to_commit_T_1 ? bru_io_o_ex_res_pack_uop_rob_idx
     : _io_o_ex_res_packs_1_uop_T_10_rob_idx; // @[Mux.scala 101:16]
  wire [63:0] _io_o_ex_res_packs_1_uop_T_11_dst_value = _bru_io_i_select_to_commit_T_1 ?
    bru_io_o_ex_res_pack_uop_dst_value : _io_o_ex_res_packs_1_uop_T_10_dst_value; // @[Mux.scala 101:16]
  wire [63:0] _io_o_ex_res_packs_1_uop_T_11_src1_value = _bru_io_i_select_to_commit_T_1 ?
    bru_io_o_ex_res_pack_uop_src1_value : _io_o_ex_res_packs_1_uop_T_10_src1_value; // @[Mux.scala 101:16]
  wire [4:0] _io_o_ex_res_packs_1_uop_T_11_alu_sel = _bru_io_i_select_to_commit_T_1 ? bru_io_o_ex_res_pack_uop_alu_sel
     : _io_o_ex_res_packs_1_uop_T_10_alu_sel; // @[Mux.scala 101:16]
  wire  _io_o_ex_res_packs_1_uop_T_12_valid = _alu2_io_i_select_to_commit_T_1 ? alu2_io_o_ex_res_pack_uop_valid :
    _io_o_ex_res_packs_1_uop_T_11_valid; // @[Mux.scala 101:16]
  wire [31:0] _io_o_ex_res_packs_1_uop_T_12_pc = _alu2_io_i_select_to_commit_T_1 ? alu2_io_o_ex_res_pack_uop_pc :
    _io_o_ex_res_packs_1_uop_T_11_pc; // @[Mux.scala 101:16]
  wire [31:0] _io_o_ex_res_packs_1_uop_T_12_inst = _alu2_io_i_select_to_commit_T_1 ? alu2_io_o_ex_res_pack_uop_inst :
    _io_o_ex_res_packs_1_uop_T_11_inst; // @[Mux.scala 101:16]
  wire [6:0] _io_o_ex_res_packs_1_uop_T_12_func_code = _alu2_io_i_select_to_commit_T_1 ?
    alu2_io_o_ex_res_pack_uop_func_code : _io_o_ex_res_packs_1_uop_T_11_func_code; // @[Mux.scala 101:16]
  wire [6:0] _io_o_ex_res_packs_1_uop_T_12_phy_dst = _alu2_io_i_select_to_commit_T_1 ? alu2_io_o_ex_res_pack_uop_phy_dst
     : _io_o_ex_res_packs_1_uop_T_11_phy_dst; // @[Mux.scala 101:16]
  wire [6:0] _io_o_ex_res_packs_1_uop_T_12_stale_dst = _alu2_io_i_select_to_commit_T_1 ?
    alu2_io_o_ex_res_pack_uop_stale_dst : _io_o_ex_res_packs_1_uop_T_11_stale_dst; // @[Mux.scala 101:16]
  wire [4:0] _io_o_ex_res_packs_1_uop_T_12_arch_dst = _alu2_io_i_select_to_commit_T_1 ?
    alu2_io_o_ex_res_pack_uop_arch_dst : _io_o_ex_res_packs_1_uop_T_11_arch_dst; // @[Mux.scala 101:16]
  wire [6:0] _io_o_ex_res_packs_1_uop_T_12_rob_idx = _alu2_io_i_select_to_commit_T_1 ? alu2_io_o_ex_res_pack_uop_rob_idx
     : _io_o_ex_res_packs_1_uop_T_11_rob_idx; // @[Mux.scala 101:16]
  wire [63:0] _io_o_ex_res_packs_1_uop_T_12_dst_value = _alu2_io_i_select_to_commit_T_1 ?
    alu2_io_o_ex_res_pack_uop_dst_value : _io_o_ex_res_packs_1_uop_T_11_dst_value; // @[Mux.scala 101:16]
  wire [63:0] _io_o_ex_res_packs_1_uop_T_12_src1_value = _alu2_io_i_select_to_commit_T_1 ?
    alu2_io_o_ex_res_pack_uop_src1_value : _io_o_ex_res_packs_1_uop_T_11_src1_value; // @[Mux.scala 101:16]
  wire [4:0] _io_o_ex_res_packs_1_uop_T_12_alu_sel = _alu2_io_i_select_to_commit_T_1 ? alu2_io_o_ex_res_pack_uop_alu_sel
     : _io_o_ex_res_packs_1_uop_T_11_alu_sel; // @[Mux.scala 101:16]
  wire  _io_o_ex_res_packs_0_valid_T_8 = _div_io_i_select_to_commit_T ? div_io_o_ex_res_pack_valid :
    _csr_bf_io_i_select_to_commit_T & csr_bf_io_o_ex_res_pack_valid; // @[Mux.scala 101:16]
  wire  _io_o_ex_res_packs_0_valid_T_9 = _mul_io_i_select_to_commit_T ? func_units_4_io_o_ex_res_pack_valid :
    _io_o_ex_res_packs_0_valid_T_8; // @[Mux.scala 101:16]
  wire  _io_o_ex_res_packs_0_valid_T_10 = _lsu_io_i_select_to_commit_T ? func_units_3_io_o_ex_res_pack_valid :
    _io_o_ex_res_packs_0_valid_T_9; // @[Mux.scala 101:16]
  wire  _io_o_ex_res_packs_0_valid_T_11 = _bru_io_i_select_to_commit_T ? bru_io_o_ex_res_pack_valid :
    _io_o_ex_res_packs_0_valid_T_10; // @[Mux.scala 101:16]
  wire  _io_o_ex_res_packs_0_valid_T_12 = _alu2_io_i_select_to_commit_T ? alu2_io_o_ex_res_pack_valid :
    _io_o_ex_res_packs_0_valid_T_11; // @[Mux.scala 101:16]
  wire  _io_o_ex_res_packs_0_valid_T_13 = _alu1_io_i_select_to_commit_T ? alu1_io_o_ex_res_pack_valid :
    _io_o_ex_res_packs_0_valid_T_12; // @[Mux.scala 101:16]
  wire  _io_o_ex_res_packs_1_valid_T_8 = _div_io_i_select_to_commit_T_1 ? div_io_o_ex_res_pack_valid :
    _csr_bf_io_i_select_to_commit_T_1 & csr_bf_io_o_ex_res_pack_valid; // @[Mux.scala 101:16]
  wire  _io_o_ex_res_packs_1_valid_T_9 = _mul_io_i_select_to_commit_T_1 ? func_units_4_io_o_ex_res_pack_valid :
    _io_o_ex_res_packs_1_valid_T_8; // @[Mux.scala 101:16]
  wire  _io_o_ex_res_packs_1_valid_T_10 = _lsu_io_i_select_to_commit_T_1 ? func_units_3_io_o_ex_res_pack_valid :
    _io_o_ex_res_packs_1_valid_T_9; // @[Mux.scala 101:16]
  wire  _io_o_ex_res_packs_1_valid_T_11 = _bru_io_i_select_to_commit_T_1 ? bru_io_o_ex_res_pack_valid :
    _io_o_ex_res_packs_1_valid_T_10; // @[Mux.scala 101:16]
  wire  _io_o_ex_res_packs_1_valid_T_12 = _alu2_io_i_select_to_commit_T_1 ? alu2_io_o_ex_res_pack_valid :
    _io_o_ex_res_packs_1_valid_T_11; // @[Mux.scala 101:16]
  wire  _io_o_ex_res_packs_1_valid_T_13 = _alu1_io_i_select_to_commit_T_1 ? alu1_io_o_ex_res_pack_valid :
    _io_o_ex_res_packs_1_valid_T_12; // @[Mux.scala 101:16]
  wire  _T_4 = ~reset; // @[execute.scala 192:11]
  ALU alu1 ( // @[execute.scala 47:22]
    .clock(alu1_clock),
    .reset(alu1_reset),
    .io_i_uop_valid(alu1_io_i_uop_valid),
    .io_i_uop_pc(alu1_io_i_uop_pc),
    .io_i_uop_inst(alu1_io_i_uop_inst),
    .io_i_uop_func_code(alu1_io_i_uop_func_code),
    .io_i_uop_phy_dst(alu1_io_i_uop_phy_dst),
    .io_i_uop_stale_dst(alu1_io_i_uop_stale_dst),
    .io_i_uop_arch_dst(alu1_io_i_uop_arch_dst),
    .io_i_uop_rob_idx(alu1_io_i_uop_rob_idx),
    .io_i_uop_src1_value(alu1_io_i_uop_src1_value),
    .io_i_uop_src2_value(alu1_io_i_uop_src2_value),
    .io_i_uop_alu_sel(alu1_io_i_uop_alu_sel),
    .io_i_select(alu1_io_i_select),
    .io_i_select_to_commit(alu1_io_i_select_to_commit),
    .io_o_ex_res_pack_valid(alu1_io_o_ex_res_pack_valid),
    .io_o_ex_res_pack_uop_valid(alu1_io_o_ex_res_pack_uop_valid),
    .io_o_ex_res_pack_uop_pc(alu1_io_o_ex_res_pack_uop_pc),
    .io_o_ex_res_pack_uop_inst(alu1_io_o_ex_res_pack_uop_inst),
    .io_o_ex_res_pack_uop_func_code(alu1_io_o_ex_res_pack_uop_func_code),
    .io_o_ex_res_pack_uop_phy_dst(alu1_io_o_ex_res_pack_uop_phy_dst),
    .io_o_ex_res_pack_uop_stale_dst(alu1_io_o_ex_res_pack_uop_stale_dst),
    .io_o_ex_res_pack_uop_arch_dst(alu1_io_o_ex_res_pack_uop_arch_dst),
    .io_o_ex_res_pack_uop_rob_idx(alu1_io_o_ex_res_pack_uop_rob_idx),
    .io_o_ex_res_pack_uop_dst_value(alu1_io_o_ex_res_pack_uop_dst_value),
    .io_o_ex_res_pack_uop_src1_value(alu1_io_o_ex_res_pack_uop_src1_value),
    .io_o_ex_res_pack_uop_alu_sel(alu1_io_o_ex_res_pack_uop_alu_sel),
    .io_o_available(alu1_io_o_available),
    .io_i_exception(alu1_io_i_exception),
    .io_i_rollback_valid(alu1_io_i_rollback_valid),
    .io_i_rollback_rob_idx(alu1_io_i_rollback_rob_idx)
  );
  ALU alu2 ( // @[execute.scala 48:22]
    .clock(alu2_clock),
    .reset(alu2_reset),
    .io_i_uop_valid(alu2_io_i_uop_valid),
    .io_i_uop_pc(alu2_io_i_uop_pc),
    .io_i_uop_inst(alu2_io_i_uop_inst),
    .io_i_uop_func_code(alu2_io_i_uop_func_code),
    .io_i_uop_phy_dst(alu2_io_i_uop_phy_dst),
    .io_i_uop_stale_dst(alu2_io_i_uop_stale_dst),
    .io_i_uop_arch_dst(alu2_io_i_uop_arch_dst),
    .io_i_uop_rob_idx(alu2_io_i_uop_rob_idx),
    .io_i_uop_src1_value(alu2_io_i_uop_src1_value),
    .io_i_uop_src2_value(alu2_io_i_uop_src2_value),
    .io_i_uop_alu_sel(alu2_io_i_uop_alu_sel),
    .io_i_select(alu2_io_i_select),
    .io_i_select_to_commit(alu2_io_i_select_to_commit),
    .io_o_ex_res_pack_valid(alu2_io_o_ex_res_pack_valid),
    .io_o_ex_res_pack_uop_valid(alu2_io_o_ex_res_pack_uop_valid),
    .io_o_ex_res_pack_uop_pc(alu2_io_o_ex_res_pack_uop_pc),
    .io_o_ex_res_pack_uop_inst(alu2_io_o_ex_res_pack_uop_inst),
    .io_o_ex_res_pack_uop_func_code(alu2_io_o_ex_res_pack_uop_func_code),
    .io_o_ex_res_pack_uop_phy_dst(alu2_io_o_ex_res_pack_uop_phy_dst),
    .io_o_ex_res_pack_uop_stale_dst(alu2_io_o_ex_res_pack_uop_stale_dst),
    .io_o_ex_res_pack_uop_arch_dst(alu2_io_o_ex_res_pack_uop_arch_dst),
    .io_o_ex_res_pack_uop_rob_idx(alu2_io_o_ex_res_pack_uop_rob_idx),
    .io_o_ex_res_pack_uop_dst_value(alu2_io_o_ex_res_pack_uop_dst_value),
    .io_o_ex_res_pack_uop_src1_value(alu2_io_o_ex_res_pack_uop_src1_value),
    .io_o_ex_res_pack_uop_alu_sel(alu2_io_o_ex_res_pack_uop_alu_sel),
    .io_o_available(alu2_io_o_available),
    .io_i_exception(alu2_io_i_exception),
    .io_i_rollback_valid(alu2_io_i_rollback_valid),
    .io_i_rollback_rob_idx(alu2_io_i_rollback_rob_idx)
  );
  BRU bru ( // @[execute.scala 49:21]
    .clock(bru_clock),
    .reset(bru_reset),
    .io_o_branch_resolve_pack_valid(bru_io_o_branch_resolve_pack_valid),
    .io_o_branch_resolve_pack_mispred(bru_io_o_branch_resolve_pack_mispred),
    .io_o_branch_resolve_pack_taken(bru_io_o_branch_resolve_pack_taken),
    .io_o_branch_resolve_pack_pc(bru_io_o_branch_resolve_pack_pc),
    .io_o_branch_resolve_pack_target(bru_io_o_branch_resolve_pack_target),
    .io_o_branch_resolve_pack_rob_idx(bru_io_o_branch_resolve_pack_rob_idx),
    .io_o_branch_resolve_pack_prediction_valid(bru_io_o_branch_resolve_pack_prediction_valid),
    .io_o_branch_resolve_pack_branch_type(bru_io_o_branch_resolve_pack_branch_type),
    .io_i_uop_valid(bru_io_i_uop_valid),
    .io_i_uop_pc(bru_io_i_uop_pc),
    .io_i_uop_inst(bru_io_i_uop_inst),
    .io_i_uop_func_code(bru_io_i_uop_func_code),
    .io_i_uop_branch_predict_pack_valid(bru_io_i_uop_branch_predict_pack_valid),
    .io_i_uop_branch_predict_pack_target(bru_io_i_uop_branch_predict_pack_target),
    .io_i_uop_branch_predict_pack_taken(bru_io_i_uop_branch_predict_pack_taken),
    .io_i_uop_phy_dst(bru_io_i_uop_phy_dst),
    .io_i_uop_stale_dst(bru_io_i_uop_stale_dst),
    .io_i_uop_arch_dst(bru_io_i_uop_arch_dst),
    .io_i_uop_rob_idx(bru_io_i_uop_rob_idx),
    .io_i_uop_imm(bru_io_i_uop_imm),
    .io_i_uop_src1_value(bru_io_i_uop_src1_value),
    .io_i_uop_src2_value(bru_io_i_uop_src2_value),
    .io_i_uop_alu_sel(bru_io_i_uop_alu_sel),
    .io_i_uop_branch_type(bru_io_i_uop_branch_type),
    .io_i_select(bru_io_i_select),
    .io_i_select_to_commit(bru_io_i_select_to_commit),
    .io_o_ex_res_pack_valid(bru_io_o_ex_res_pack_valid),
    .io_o_ex_res_pack_uop_valid(bru_io_o_ex_res_pack_uop_valid),
    .io_o_ex_res_pack_uop_pc(bru_io_o_ex_res_pack_uop_pc),
    .io_o_ex_res_pack_uop_inst(bru_io_o_ex_res_pack_uop_inst),
    .io_o_ex_res_pack_uop_func_code(bru_io_o_ex_res_pack_uop_func_code),
    .io_o_ex_res_pack_uop_phy_dst(bru_io_o_ex_res_pack_uop_phy_dst),
    .io_o_ex_res_pack_uop_stale_dst(bru_io_o_ex_res_pack_uop_stale_dst),
    .io_o_ex_res_pack_uop_arch_dst(bru_io_o_ex_res_pack_uop_arch_dst),
    .io_o_ex_res_pack_uop_rob_idx(bru_io_o_ex_res_pack_uop_rob_idx),
    .io_o_ex_res_pack_uop_dst_value(bru_io_o_ex_res_pack_uop_dst_value),
    .io_o_ex_res_pack_uop_src1_value(bru_io_o_ex_res_pack_uop_src1_value),
    .io_o_ex_res_pack_uop_alu_sel(bru_io_o_ex_res_pack_uop_alu_sel),
    .io_o_available(bru_io_o_available),
    .io_i_exception(bru_io_i_exception)
  );
  LSU func_units_3 ( // @[execute.scala 50:21]
    .clock(func_units_3_clock),
    .reset(func_units_3_reset),
    .io_i_uop_valid(func_units_3_io_i_uop_valid),
    .io_i_uop_pc(func_units_3_io_i_uop_pc),
    .io_i_uop_inst(func_units_3_io_i_uop_inst),
    .io_i_uop_func_code(func_units_3_io_i_uop_func_code),
    .io_i_uop_phy_dst(func_units_3_io_i_uop_phy_dst),
    .io_i_uop_stale_dst(func_units_3_io_i_uop_stale_dst),
    .io_i_uop_arch_dst(func_units_3_io_i_uop_arch_dst),
    .io_i_uop_rob_idx(func_units_3_io_i_uop_rob_idx),
    .io_i_uop_imm(func_units_3_io_i_uop_imm),
    .io_i_uop_src1_value(func_units_3_io_i_uop_src1_value),
    .io_i_uop_src2_value(func_units_3_io_i_uop_src2_value),
    .io_i_uop_alu_sel(func_units_3_io_i_uop_alu_sel),
    .io_i_uop_mem_type(func_units_3_io_i_uop_mem_type),
    .io_i_select(func_units_3_io_i_select),
    .io_i_select_to_commit(func_units_3_io_i_select_to_commit),
    .io_o_ex_res_pack_valid(func_units_3_io_o_ex_res_pack_valid),
    .io_o_ex_res_pack_uop_valid(func_units_3_io_o_ex_res_pack_uop_valid),
    .io_o_ex_res_pack_uop_pc(func_units_3_io_o_ex_res_pack_uop_pc),
    .io_o_ex_res_pack_uop_inst(func_units_3_io_o_ex_res_pack_uop_inst),
    .io_o_ex_res_pack_uop_func_code(func_units_3_io_o_ex_res_pack_uop_func_code),
    .io_o_ex_res_pack_uop_phy_dst(func_units_3_io_o_ex_res_pack_uop_phy_dst),
    .io_o_ex_res_pack_uop_stale_dst(func_units_3_io_o_ex_res_pack_uop_stale_dst),
    .io_o_ex_res_pack_uop_arch_dst(func_units_3_io_o_ex_res_pack_uop_arch_dst),
    .io_o_ex_res_pack_uop_rob_idx(func_units_3_io_o_ex_res_pack_uop_rob_idx),
    .io_o_ex_res_pack_uop_dst_value(func_units_3_io_o_ex_res_pack_uop_dst_value),
    .io_o_ex_res_pack_uop_src1_value(func_units_3_io_o_ex_res_pack_uop_src1_value),
    .io_o_ex_res_pack_uop_alu_sel(func_units_3_io_o_ex_res_pack_uop_alu_sel),
    .io_o_available(func_units_3_io_o_available),
    .io_i_ROB_first_entry(func_units_3_io_i_ROB_first_entry),
    .io_dcache_io_data_valid(func_units_3_io_dcache_io_data_valid),
    .io_dcache_io_addr_valid(func_units_3_io_dcache_io_addr_valid),
    .io_dcache_io_addr_ready(func_units_3_io_dcache_io_addr_ready),
    .io_dcache_io_Mwout(func_units_3_io_dcache_io_Mwout),
    .io_dcache_io_Maddr(func_units_3_io_dcache_io_Maddr),
    .io_dcache_io_Men(func_units_3_io_dcache_io_Men),
    .io_dcache_io_Mlen(func_units_3_io_dcache_io_Mlen),
    .io_dcache_io_MdataIn(func_units_3_io_dcache_io_MdataIn),
    .io_dcache_io_MdataOut(func_units_3_io_dcache_io_MdataOut),
    .io_o_lsu_uop_valid(func_units_3_io_o_lsu_uop_valid),
    .io_o_lsu_uop_rob_idx(func_units_3_io_o_lsu_uop_rob_idx),
    .io_i_exception(func_units_3_io_i_exception),
    .io_i_rollback_valid(func_units_3_io_i_rollback_valid),
    .io_i_rollback_rob_idx(func_units_3_io_i_rollback_rob_idx)
  );
  MUL func_units_4 ( // @[execute.scala 51:21]
    .clock(func_units_4_clock),
    .reset(func_units_4_reset),
    .io_i_uop_valid(func_units_4_io_i_uop_valid),
    .io_i_uop_pc(func_units_4_io_i_uop_pc),
    .io_i_uop_inst(func_units_4_io_i_uop_inst),
    .io_i_uop_func_code(func_units_4_io_i_uop_func_code),
    .io_i_uop_phy_dst(func_units_4_io_i_uop_phy_dst),
    .io_i_uop_stale_dst(func_units_4_io_i_uop_stale_dst),
    .io_i_uop_arch_dst(func_units_4_io_i_uop_arch_dst),
    .io_i_uop_rob_idx(func_units_4_io_i_uop_rob_idx),
    .io_i_uop_src1_value(func_units_4_io_i_uop_src1_value),
    .io_i_uop_src2_value(func_units_4_io_i_uop_src2_value),
    .io_i_uop_alu_sel(func_units_4_io_i_uop_alu_sel),
    .io_i_select(func_units_4_io_i_select),
    .io_i_select_to_commit(func_units_4_io_i_select_to_commit),
    .io_o_ex_res_pack_valid(func_units_4_io_o_ex_res_pack_valid),
    .io_o_ex_res_pack_uop_valid(func_units_4_io_o_ex_res_pack_uop_valid),
    .io_o_ex_res_pack_uop_pc(func_units_4_io_o_ex_res_pack_uop_pc),
    .io_o_ex_res_pack_uop_inst(func_units_4_io_o_ex_res_pack_uop_inst),
    .io_o_ex_res_pack_uop_func_code(func_units_4_io_o_ex_res_pack_uop_func_code),
    .io_o_ex_res_pack_uop_phy_dst(func_units_4_io_o_ex_res_pack_uop_phy_dst),
    .io_o_ex_res_pack_uop_stale_dst(func_units_4_io_o_ex_res_pack_uop_stale_dst),
    .io_o_ex_res_pack_uop_arch_dst(func_units_4_io_o_ex_res_pack_uop_arch_dst),
    .io_o_ex_res_pack_uop_rob_idx(func_units_4_io_o_ex_res_pack_uop_rob_idx),
    .io_o_ex_res_pack_uop_dst_value(func_units_4_io_o_ex_res_pack_uop_dst_value),
    .io_o_ex_res_pack_uop_src1_value(func_units_4_io_o_ex_res_pack_uop_src1_value),
    .io_o_ex_res_pack_uop_alu_sel(func_units_4_io_o_ex_res_pack_uop_alu_sel),
    .io_o_available(func_units_4_io_o_available),
    .io_i_exception(func_units_4_io_i_exception),
    .io_i_rollback_valid(func_units_4_io_i_rollback_valid),
    .io_i_rollback_rob_idx(func_units_4_io_i_rollback_rob_idx)
  );
  DIV div ( // @[execute.scala 52:21]
    .clock(div_clock),
    .reset(div_reset),
    .io_i_uop_valid(div_io_i_uop_valid),
    .io_i_uop_pc(div_io_i_uop_pc),
    .io_i_uop_inst(div_io_i_uop_inst),
    .io_i_uop_func_code(div_io_i_uop_func_code),
    .io_i_uop_phy_dst(div_io_i_uop_phy_dst),
    .io_i_uop_stale_dst(div_io_i_uop_stale_dst),
    .io_i_uop_arch_dst(div_io_i_uop_arch_dst),
    .io_i_uop_rob_idx(div_io_i_uop_rob_idx),
    .io_i_uop_src1_value(div_io_i_uop_src1_value),
    .io_i_uop_src2_value(div_io_i_uop_src2_value),
    .io_i_uop_alu_sel(div_io_i_uop_alu_sel),
    .io_i_select(div_io_i_select),
    .io_i_select_to_commit(div_io_i_select_to_commit),
    .io_o_ex_res_pack_valid(div_io_o_ex_res_pack_valid),
    .io_o_ex_res_pack_uop_valid(div_io_o_ex_res_pack_uop_valid),
    .io_o_ex_res_pack_uop_pc(div_io_o_ex_res_pack_uop_pc),
    .io_o_ex_res_pack_uop_inst(div_io_o_ex_res_pack_uop_inst),
    .io_o_ex_res_pack_uop_func_code(div_io_o_ex_res_pack_uop_func_code),
    .io_o_ex_res_pack_uop_phy_dst(div_io_o_ex_res_pack_uop_phy_dst),
    .io_o_ex_res_pack_uop_stale_dst(div_io_o_ex_res_pack_uop_stale_dst),
    .io_o_ex_res_pack_uop_arch_dst(div_io_o_ex_res_pack_uop_arch_dst),
    .io_o_ex_res_pack_uop_rob_idx(div_io_o_ex_res_pack_uop_rob_idx),
    .io_o_ex_res_pack_uop_dst_value(div_io_o_ex_res_pack_uop_dst_value),
    .io_o_ex_res_pack_uop_src1_value(div_io_o_ex_res_pack_uop_src1_value),
    .io_o_ex_res_pack_uop_alu_sel(div_io_o_ex_res_pack_uop_alu_sel),
    .io_o_available(div_io_o_available),
    .io_i_exception(div_io_i_exception),
    .io_i_rollback_valid(div_io_i_rollback_valid),
    .io_i_rollback_rob_idx(div_io_i_rollback_rob_idx)
  );
  CSR_BF csr_bf ( // @[execute.scala 53:24]
    .clock(csr_bf_clock),
    .reset(csr_bf_reset),
    .io_i_uop_valid(csr_bf_io_i_uop_valid),
    .io_i_uop_pc(csr_bf_io_i_uop_pc),
    .io_i_uop_inst(csr_bf_io_i_uop_inst),
    .io_i_uop_func_code(csr_bf_io_i_uop_func_code),
    .io_i_uop_phy_dst(csr_bf_io_i_uop_phy_dst),
    .io_i_uop_stale_dst(csr_bf_io_i_uop_stale_dst),
    .io_i_uop_arch_dst(csr_bf_io_i_uop_arch_dst),
    .io_i_uop_rob_idx(csr_bf_io_i_uop_rob_idx),
    .io_i_uop_src1_value(csr_bf_io_i_uop_src1_value),
    .io_i_uop_alu_sel(csr_bf_io_i_uop_alu_sel),
    .io_i_select(csr_bf_io_i_select),
    .io_i_select_to_commit(csr_bf_io_i_select_to_commit),
    .io_o_ex_res_pack_valid(csr_bf_io_o_ex_res_pack_valid),
    .io_o_ex_res_pack_uop_valid(csr_bf_io_o_ex_res_pack_uop_valid),
    .io_o_ex_res_pack_uop_pc(csr_bf_io_o_ex_res_pack_uop_pc),
    .io_o_ex_res_pack_uop_inst(csr_bf_io_o_ex_res_pack_uop_inst),
    .io_o_ex_res_pack_uop_func_code(csr_bf_io_o_ex_res_pack_uop_func_code),
    .io_o_ex_res_pack_uop_phy_dst(csr_bf_io_o_ex_res_pack_uop_phy_dst),
    .io_o_ex_res_pack_uop_stale_dst(csr_bf_io_o_ex_res_pack_uop_stale_dst),
    .io_o_ex_res_pack_uop_arch_dst(csr_bf_io_o_ex_res_pack_uop_arch_dst),
    .io_o_ex_res_pack_uop_rob_idx(csr_bf_io_o_ex_res_pack_uop_rob_idx),
    .io_o_ex_res_pack_uop_src1_value(csr_bf_io_o_ex_res_pack_uop_src1_value),
    .io_o_ex_res_pack_uop_alu_sel(csr_bf_io_o_ex_res_pack_uop_alu_sel),
    .io_o_available(csr_bf_io_o_available),
    .io_i_exception(csr_bf_io_i_exception),
    .io_i_rollback_valid(csr_bf_io_i_rollback_valid),
    .io_i_rollback_rob_idx(csr_bf_io_i_rollback_rob_idx)
  );
  assign io_o_available_funcs_0 = _io_o_available_funcs_0_T_1 ? 2'h1 : _io_o_available_funcs_0_T_6; // @[Mux.scala 101:16]
  assign io_o_available_funcs_1 = {{1'd0}, _io_o_available_funcs_1_T}; // @[execute.scala 87:28]
  assign io_o_available_funcs_2 = {{1'd0}, _io_o_available_funcs_2_T}; // @[execute.scala 88:28]
  assign io_o_available_funcs_3 = {{1'd0}, _io_o_available_funcs_3_T}; // @[execute.scala 89:28]
  assign io_o_available_funcs_4 = {{1'd0}, _io_o_available_funcs_4_T}; // @[execute.scala 90:28]
  assign io_o_available_funcs_5 = {{1'd0}, _io_o_available_funcs_5_T}; // @[execute.scala 91:28]
  assign io_o_ex_res_packs_0_valid = io_i_exception ? 1'h0 : _io_o_ex_res_packs_0_valid_T_13; // @[execute.scala 185:37]
  assign io_o_ex_res_packs_0_uop_valid = _alu1_io_i_select_to_commit_T ? alu1_io_o_ex_res_pack_uop_valid :
    _io_o_ex_res_packs_0_uop_T_12_valid; // @[Mux.scala 101:16]
  assign io_o_ex_res_packs_0_uop_pc = _alu1_io_i_select_to_commit_T ? alu1_io_o_ex_res_pack_uop_pc :
    _io_o_ex_res_packs_0_uop_T_12_pc; // @[Mux.scala 101:16]
  assign io_o_ex_res_packs_0_uop_inst = _alu1_io_i_select_to_commit_T ? alu1_io_o_ex_res_pack_uop_inst :
    _io_o_ex_res_packs_0_uop_T_12_inst; // @[Mux.scala 101:16]
  assign io_o_ex_res_packs_0_uop_func_code = _alu1_io_i_select_to_commit_T ? alu1_io_o_ex_res_pack_uop_func_code :
    _io_o_ex_res_packs_0_uop_T_12_func_code; // @[Mux.scala 101:16]
  assign io_o_ex_res_packs_0_uop_phy_dst = _alu1_io_i_select_to_commit_T ? alu1_io_o_ex_res_pack_uop_phy_dst :
    _io_o_ex_res_packs_0_uop_T_12_phy_dst; // @[Mux.scala 101:16]
  assign io_o_ex_res_packs_0_uop_stale_dst = _alu1_io_i_select_to_commit_T ? alu1_io_o_ex_res_pack_uop_stale_dst :
    _io_o_ex_res_packs_0_uop_T_12_stale_dst; // @[Mux.scala 101:16]
  assign io_o_ex_res_packs_0_uop_arch_dst = _alu1_io_i_select_to_commit_T ? alu1_io_o_ex_res_pack_uop_arch_dst :
    _io_o_ex_res_packs_0_uop_T_12_arch_dst; // @[Mux.scala 101:16]
  assign io_o_ex_res_packs_0_uop_rob_idx = _alu1_io_i_select_to_commit_T ? alu1_io_o_ex_res_pack_uop_rob_idx :
    _io_o_ex_res_packs_0_uop_T_12_rob_idx; // @[Mux.scala 101:16]
  assign io_o_ex_res_packs_0_uop_dst_value = _alu1_io_i_select_to_commit_T ? alu1_io_o_ex_res_pack_uop_dst_value :
    _io_o_ex_res_packs_0_uop_T_12_dst_value; // @[Mux.scala 101:16]
  assign io_o_ex_res_packs_0_uop_src1_value = _alu1_io_i_select_to_commit_T ? alu1_io_o_ex_res_pack_uop_src1_value :
    _io_o_ex_res_packs_0_uop_T_12_src1_value; // @[Mux.scala 101:16]
  assign io_o_ex_res_packs_0_uop_alu_sel = _alu1_io_i_select_to_commit_T ? alu1_io_o_ex_res_pack_uop_alu_sel :
    _io_o_ex_res_packs_0_uop_T_12_alu_sel; // @[Mux.scala 101:16]
  assign io_o_ex_res_packs_1_valid = io_i_exception ? 1'h0 : _io_o_ex_res_packs_1_valid_T_13 & issue_idx1 != issue_idx2; // @[execute.scala 186:37]
  assign io_o_ex_res_packs_1_uop_valid = _alu1_io_i_select_to_commit_T_1 ? alu1_io_o_ex_res_pack_uop_valid :
    _io_o_ex_res_packs_1_uop_T_12_valid; // @[Mux.scala 101:16]
  assign io_o_ex_res_packs_1_uop_pc = _alu1_io_i_select_to_commit_T_1 ? alu1_io_o_ex_res_pack_uop_pc :
    _io_o_ex_res_packs_1_uop_T_12_pc; // @[Mux.scala 101:16]
  assign io_o_ex_res_packs_1_uop_inst = _alu1_io_i_select_to_commit_T_1 ? alu1_io_o_ex_res_pack_uop_inst :
    _io_o_ex_res_packs_1_uop_T_12_inst; // @[Mux.scala 101:16]
  assign io_o_ex_res_packs_1_uop_func_code = _alu1_io_i_select_to_commit_T_1 ? alu1_io_o_ex_res_pack_uop_func_code :
    _io_o_ex_res_packs_1_uop_T_12_func_code; // @[Mux.scala 101:16]
  assign io_o_ex_res_packs_1_uop_phy_dst = _alu1_io_i_select_to_commit_T_1 ? alu1_io_o_ex_res_pack_uop_phy_dst :
    _io_o_ex_res_packs_1_uop_T_12_phy_dst; // @[Mux.scala 101:16]
  assign io_o_ex_res_packs_1_uop_stale_dst = _alu1_io_i_select_to_commit_T_1 ? alu1_io_o_ex_res_pack_uop_stale_dst :
    _io_o_ex_res_packs_1_uop_T_12_stale_dst; // @[Mux.scala 101:16]
  assign io_o_ex_res_packs_1_uop_arch_dst = _alu1_io_i_select_to_commit_T_1 ? alu1_io_o_ex_res_pack_uop_arch_dst :
    _io_o_ex_res_packs_1_uop_T_12_arch_dst; // @[Mux.scala 101:16]
  assign io_o_ex_res_packs_1_uop_rob_idx = _alu1_io_i_select_to_commit_T_1 ? alu1_io_o_ex_res_pack_uop_rob_idx :
    _io_o_ex_res_packs_1_uop_T_12_rob_idx; // @[Mux.scala 101:16]
  assign io_o_ex_res_packs_1_uop_dst_value = _alu1_io_i_select_to_commit_T_1 ? alu1_io_o_ex_res_pack_uop_dst_value :
    _io_o_ex_res_packs_1_uop_T_12_dst_value; // @[Mux.scala 101:16]
  assign io_o_ex_res_packs_1_uop_src1_value = _alu1_io_i_select_to_commit_T_1 ? alu1_io_o_ex_res_pack_uop_src1_value :
    _io_o_ex_res_packs_1_uop_T_12_src1_value; // @[Mux.scala 101:16]
  assign io_o_ex_res_packs_1_uop_alu_sel = _alu1_io_i_select_to_commit_T_1 ? alu1_io_o_ex_res_pack_uop_alu_sel :
    _io_o_ex_res_packs_1_uop_T_12_alu_sel; // @[Mux.scala 101:16]
  assign io_dcache_io_addr_valid = func_units_3_io_dcache_io_addr_valid; // @[execute.scala 66:38]
  assign io_dcache_io_Mwout = func_units_3_io_dcache_io_Mwout; // @[execute.scala 70:33]
  assign io_dcache_io_Maddr = func_units_3_io_dcache_io_Maddr; // @[execute.scala 71:33]
  assign io_dcache_io_Men = func_units_3_io_dcache_io_Men; // @[execute.scala 72:33]
  assign io_dcache_io_Mlen = func_units_3_io_dcache_io_Mlen; // @[execute.scala 73:33]
  assign io_dcache_io_MdataOut = func_units_3_io_dcache_io_MdataOut; // @[execute.scala 74:33]
  assign io_o_branch_resolve_pack_valid = bru_io_o_branch_resolve_pack_valid; // @[execute.scala 166:36]
  assign io_o_branch_resolve_pack_mispred = bru_io_o_branch_resolve_pack_mispred; // @[execute.scala 164:30]
  assign io_o_branch_resolve_pack_taken = bru_io_o_branch_resolve_pack_taken; // @[execute.scala 164:30]
  assign io_o_branch_resolve_pack_pc = bru_io_o_branch_resolve_pack_pc; // @[execute.scala 164:30]
  assign io_o_branch_resolve_pack_target = bru_io_o_branch_resolve_pack_target; // @[execute.scala 164:30]
  assign io_o_branch_resolve_pack_rob_idx = bru_io_o_branch_resolve_pack_rob_idx; // @[execute.scala 164:30]
  assign io_o_branch_resolve_pack_prediction_valid = bru_io_o_branch_resolve_pack_prediction_valid; // @[execute.scala 164:30]
  assign io_o_branch_resolve_pack_branch_type = bru_io_o_branch_resolve_pack_branch_type; // @[execute.scala 164:30]
  assign io_o_lsu_uop_valid = func_units_3_io_o_lsu_uop_valid; // @[execute.scala 188:24]
  assign io_o_lsu_uop_rob_idx = func_units_3_io_o_lsu_uop_rob_idx; // @[execute.scala 189:26]
  assign alu1_clock = clock;
  assign alu1_reset = reset;
  assign alu1_io_i_uop_valid = _alu1_io_i_select_T_2 ? io_i_issue_res_packs_0_valid : io_i_issue_res_packs_1_valid; // @[execute.scala 118:24]
  assign alu1_io_i_uop_pc = _alu1_io_i_select_T_2 ? io_i_issue_res_packs_0_pc : io_i_issue_res_packs_1_pc; // @[execute.scala 118:24]
  assign alu1_io_i_uop_inst = _alu1_io_i_select_T_2 ? io_i_issue_res_packs_0_inst : io_i_issue_res_packs_1_inst; // @[execute.scala 118:24]
  assign alu1_io_i_uop_func_code = _alu1_io_i_select_T_2 ? io_i_issue_res_packs_0_func_code :
    io_i_issue_res_packs_1_func_code; // @[execute.scala 118:24]
  assign alu1_io_i_uop_phy_dst = _alu1_io_i_select_T_2 ? io_i_issue_res_packs_0_phy_dst : io_i_issue_res_packs_1_phy_dst
    ; // @[execute.scala 118:24]
  assign alu1_io_i_uop_stale_dst = _alu1_io_i_select_T_2 ? io_i_issue_res_packs_0_stale_dst :
    io_i_issue_res_packs_1_stale_dst; // @[execute.scala 118:24]
  assign alu1_io_i_uop_arch_dst = _alu1_io_i_select_T_2 ? io_i_issue_res_packs_0_arch_dst :
    io_i_issue_res_packs_1_arch_dst; // @[execute.scala 118:24]
  assign alu1_io_i_uop_rob_idx = _alu1_io_i_select_T_2 ? io_i_issue_res_packs_0_rob_idx : io_i_issue_res_packs_1_rob_idx
    ; // @[execute.scala 118:24]
  assign alu1_io_i_uop_src1_value = _alu1_io_i_select_T_2 ? io_i_issue_res_packs_0_src1_value :
    io_i_issue_res_packs_1_src1_value; // @[execute.scala 118:24]
  assign alu1_io_i_uop_src2_value = _alu1_io_i_select_T_2 ? io_i_issue_res_packs_0_src2_value :
    io_i_issue_res_packs_1_src2_value; // @[execute.scala 118:24]
  assign alu1_io_i_uop_alu_sel = _alu1_io_i_select_T_2 ? io_i_issue_res_packs_0_alu_sel : io_i_issue_res_packs_1_alu_sel
    ; // @[execute.scala 118:24]
  assign alu1_io_i_select = ~io_i_rollback_valid & _alu1_io_i_select_T_6; // @[execute.scala 95:46]
  assign alu1_io_i_select_to_commit = (3'h0 == issue_idx1 | 3'h0 == issue_idx2) & alu1_io_o_ex_res_pack_valid &
    _alu1_io_i_select_T; // @[execute.scala 179:129]
  assign alu1_io_i_exception = io_i_exception; // @[execute.scala 127:28]
  assign alu1_io_i_rollback_valid = io_i_rollback_valid; // @[execute.scala 135:30]
  assign alu1_io_i_rollback_rob_idx = io_o_branch_resolve_pack_rob_idx[6:0]; // @[execute.scala 143:32]
  assign alu2_clock = clock;
  assign alu2_reset = reset;
  assign alu2_io_i_uop_valid = _io_o_available_funcs_0_T_2 & io_i_issue_res_packs_0_valid & _alu1_io_i_select_T_1 ?
    io_i_issue_res_packs_0_valid : io_i_issue_res_packs_1_valid; // @[execute.scala 120:24]
  assign alu2_io_i_uop_pc = _io_o_available_funcs_0_T_2 & io_i_issue_res_packs_0_valid & _alu1_io_i_select_T_1 ?
    io_i_issue_res_packs_0_pc : io_i_issue_res_packs_1_pc; // @[execute.scala 120:24]
  assign alu2_io_i_uop_inst = _io_o_available_funcs_0_T_2 & io_i_issue_res_packs_0_valid & _alu1_io_i_select_T_1 ?
    io_i_issue_res_packs_0_inst : io_i_issue_res_packs_1_inst; // @[execute.scala 120:24]
  assign alu2_io_i_uop_func_code = _io_o_available_funcs_0_T_2 & io_i_issue_res_packs_0_valid & _alu1_io_i_select_T_1 ?
    io_i_issue_res_packs_0_func_code : io_i_issue_res_packs_1_func_code; // @[execute.scala 120:24]
  assign alu2_io_i_uop_phy_dst = _io_o_available_funcs_0_T_2 & io_i_issue_res_packs_0_valid & _alu1_io_i_select_T_1 ?
    io_i_issue_res_packs_0_phy_dst : io_i_issue_res_packs_1_phy_dst; // @[execute.scala 120:24]
  assign alu2_io_i_uop_stale_dst = _io_o_available_funcs_0_T_2 & io_i_issue_res_packs_0_valid & _alu1_io_i_select_T_1 ?
    io_i_issue_res_packs_0_stale_dst : io_i_issue_res_packs_1_stale_dst; // @[execute.scala 120:24]
  assign alu2_io_i_uop_arch_dst = _io_o_available_funcs_0_T_2 & io_i_issue_res_packs_0_valid & _alu1_io_i_select_T_1 ?
    io_i_issue_res_packs_0_arch_dst : io_i_issue_res_packs_1_arch_dst; // @[execute.scala 120:24]
  assign alu2_io_i_uop_rob_idx = _io_o_available_funcs_0_T_2 & io_i_issue_res_packs_0_valid & _alu1_io_i_select_T_1 ?
    io_i_issue_res_packs_0_rob_idx : io_i_issue_res_packs_1_rob_idx; // @[execute.scala 120:24]
  assign alu2_io_i_uop_src1_value = _io_o_available_funcs_0_T_2 & io_i_issue_res_packs_0_valid & _alu1_io_i_select_T_1
     ? io_i_issue_res_packs_0_src1_value : io_i_issue_res_packs_1_src1_value; // @[execute.scala 120:24]
  assign alu2_io_i_uop_src2_value = _io_o_available_funcs_0_T_2 & io_i_issue_res_packs_0_valid & _alu1_io_i_select_T_1
     ? io_i_issue_res_packs_0_src2_value : io_i_issue_res_packs_1_src2_value; // @[execute.scala 120:24]
  assign alu2_io_i_uop_alu_sel = _io_o_available_funcs_0_T_2 & io_i_issue_res_packs_0_valid & _alu1_io_i_select_T_1 ?
    io_i_issue_res_packs_0_alu_sel : io_i_issue_res_packs_1_alu_sel; // @[execute.scala 120:24]
  assign alu2_io_i_select = _alu1_io_i_select_T & (alu2_io_o_available & _alu2_io_i_select_T_13); // @[execute.scala 98:46]
  assign alu2_io_i_select_to_commit = (3'h1 == issue_idx1 | 3'h1 == issue_idx2) & alu2_io_o_ex_res_pack_valid &
    _alu1_io_i_select_T; // @[execute.scala 179:129]
  assign alu2_io_i_exception = io_i_exception; // @[execute.scala 128:28]
  assign alu2_io_i_rollback_valid = io_i_rollback_valid; // @[execute.scala 136:30]
  assign alu2_io_i_rollback_rob_idx = io_o_branch_resolve_pack_rob_idx[6:0]; // @[execute.scala 144:32]
  assign bru_clock = clock;
  assign bru_reset = reset;
  assign bru_io_i_uop_valid = _bru_io_i_select_T_3 ? io_i_issue_res_packs_0_valid : io_i_issue_res_packs_1_valid; // @[execute.scala 121:24]
  assign bru_io_i_uop_pc = _bru_io_i_select_T_3 ? io_i_issue_res_packs_0_pc : io_i_issue_res_packs_1_pc; // @[execute.scala 121:24]
  assign bru_io_i_uop_inst = _bru_io_i_select_T_3 ? io_i_issue_res_packs_0_inst : io_i_issue_res_packs_1_inst; // @[execute.scala 121:24]
  assign bru_io_i_uop_func_code = _bru_io_i_select_T_3 ? io_i_issue_res_packs_0_func_code :
    io_i_issue_res_packs_1_func_code; // @[execute.scala 121:24]
  assign bru_io_i_uop_branch_predict_pack_valid = _bru_io_i_select_T_3 ?
    io_i_issue_res_packs_0_branch_predict_pack_valid : io_i_issue_res_packs_1_branch_predict_pack_valid; // @[execute.scala 121:24]
  assign bru_io_i_uop_branch_predict_pack_target = _bru_io_i_select_T_3 ?
    io_i_issue_res_packs_0_branch_predict_pack_target : io_i_issue_res_packs_1_branch_predict_pack_target; // @[execute.scala 121:24]
  assign bru_io_i_uop_branch_predict_pack_taken = _bru_io_i_select_T_3 ?
    io_i_issue_res_packs_0_branch_predict_pack_taken : io_i_issue_res_packs_1_branch_predict_pack_taken; // @[execute.scala 121:24]
  assign bru_io_i_uop_phy_dst = _bru_io_i_select_T_3 ? io_i_issue_res_packs_0_phy_dst : io_i_issue_res_packs_1_phy_dst; // @[execute.scala 121:24]
  assign bru_io_i_uop_stale_dst = _bru_io_i_select_T_3 ? io_i_issue_res_packs_0_stale_dst :
    io_i_issue_res_packs_1_stale_dst; // @[execute.scala 121:24]
  assign bru_io_i_uop_arch_dst = _bru_io_i_select_T_3 ? io_i_issue_res_packs_0_arch_dst :
    io_i_issue_res_packs_1_arch_dst; // @[execute.scala 121:24]
  assign bru_io_i_uop_rob_idx = _bru_io_i_select_T_3 ? io_i_issue_res_packs_0_rob_idx : io_i_issue_res_packs_1_rob_idx; // @[execute.scala 121:24]
  assign bru_io_i_uop_imm = _bru_io_i_select_T_3 ? io_i_issue_res_packs_0_imm : io_i_issue_res_packs_1_imm; // @[execute.scala 121:24]
  assign bru_io_i_uop_src1_value = _bru_io_i_select_T_3 ? io_i_issue_res_packs_0_src1_value :
    io_i_issue_res_packs_1_src1_value; // @[execute.scala 121:24]
  assign bru_io_i_uop_src2_value = _bru_io_i_select_T_3 ? io_i_issue_res_packs_0_src2_value :
    io_i_issue_res_packs_1_src2_value; // @[execute.scala 121:24]
  assign bru_io_i_uop_alu_sel = _bru_io_i_select_T_3 ? io_i_issue_res_packs_0_alu_sel : io_i_issue_res_packs_1_alu_sel; // @[execute.scala 121:24]
  assign bru_io_i_uop_branch_type = _bru_io_i_select_T_3 ? io_i_issue_res_packs_0_branch_type :
    io_i_issue_res_packs_1_branch_type; // @[execute.scala 121:24]
  assign bru_io_i_select = _alu1_io_i_select_T & (io_i_issue_res_packs_1_valid & io_i_issue_res_packs_1_func_code == 7'h2
     | _bru_io_i_select_T_4); // @[execute.scala 103:45]
  assign bru_io_i_select_to_commit = (3'h2 == issue_idx1 | 3'h2 == issue_idx2) & bru_io_o_ex_res_pack_valid &
    _alu1_io_i_select_T; // @[execute.scala 179:129]
  assign bru_io_i_exception = io_i_exception; // @[execute.scala 129:28]
  assign func_units_3_clock = clock;
  assign func_units_3_reset = reset;
  assign func_units_3_io_i_uop_valid = _lsu_io_i_select_T_3 ? io_i_issue_res_packs_0_valid :
    io_i_issue_res_packs_1_valid; // @[execute.scala 122:24]
  assign func_units_3_io_i_uop_pc = _lsu_io_i_select_T_3 ? io_i_issue_res_packs_0_pc : io_i_issue_res_packs_1_pc; // @[execute.scala 122:24]
  assign func_units_3_io_i_uop_inst = _lsu_io_i_select_T_3 ? io_i_issue_res_packs_0_inst : io_i_issue_res_packs_1_inst; // @[execute.scala 122:24]
  assign func_units_3_io_i_uop_func_code = _lsu_io_i_select_T_3 ? io_i_issue_res_packs_0_func_code :
    io_i_issue_res_packs_1_func_code; // @[execute.scala 122:24]
  assign func_units_3_io_i_uop_phy_dst = _lsu_io_i_select_T_3 ? io_i_issue_res_packs_0_phy_dst :
    io_i_issue_res_packs_1_phy_dst; // @[execute.scala 122:24]
  assign func_units_3_io_i_uop_stale_dst = _lsu_io_i_select_T_3 ? io_i_issue_res_packs_0_stale_dst :
    io_i_issue_res_packs_1_stale_dst; // @[execute.scala 122:24]
  assign func_units_3_io_i_uop_arch_dst = _lsu_io_i_select_T_3 ? io_i_issue_res_packs_0_arch_dst :
    io_i_issue_res_packs_1_arch_dst; // @[execute.scala 122:24]
  assign func_units_3_io_i_uop_rob_idx = _lsu_io_i_select_T_3 ? io_i_issue_res_packs_0_rob_idx :
    io_i_issue_res_packs_1_rob_idx; // @[execute.scala 122:24]
  assign func_units_3_io_i_uop_imm = _lsu_io_i_select_T_3 ? io_i_issue_res_packs_0_imm : io_i_issue_res_packs_1_imm; // @[execute.scala 122:24]
  assign func_units_3_io_i_uop_src1_value = _lsu_io_i_select_T_3 ? io_i_issue_res_packs_0_src1_value :
    io_i_issue_res_packs_1_src1_value; // @[execute.scala 122:24]
  assign func_units_3_io_i_uop_src2_value = _lsu_io_i_select_T_3 ? io_i_issue_res_packs_0_src2_value :
    io_i_issue_res_packs_1_src2_value; // @[execute.scala 122:24]
  assign func_units_3_io_i_uop_alu_sel = _lsu_io_i_select_T_3 ? io_i_issue_res_packs_0_alu_sel :
    io_i_issue_res_packs_1_alu_sel; // @[execute.scala 122:24]
  assign func_units_3_io_i_uop_mem_type = _lsu_io_i_select_T_3 ? io_i_issue_res_packs_0_mem_type :
    io_i_issue_res_packs_1_mem_type; // @[execute.scala 122:24]
  assign func_units_3_io_i_select = _alu1_io_i_select_T & (io_i_issue_res_packs_1_valid &
    io_i_issue_res_packs_1_func_code == 7'h4 | _lsu_io_i_select_T_4); // @[execute.scala 106:45]
  assign func_units_3_io_i_select_to_commit = (3'h3 == issue_idx1 | 3'h3 == issue_idx2) &
    func_units_3_io_o_ex_res_pack_valid & _alu1_io_i_select_T; // @[execute.scala 179:129]
  assign func_units_3_io_i_ROB_first_entry = io_i_ROB_first_entry[6:0]; // @[execute.scala 63:30]
  assign func_units_3_io_dcache_io_data_valid = io_dcache_io_data_valid; // @[execute.scala 64:38]
  assign func_units_3_io_dcache_io_addr_ready = io_dcache_io_addr_ready; // @[execute.scala 68:33]
  assign func_units_3_io_dcache_io_MdataIn = io_dcache_io_MdataIn; // @[execute.scala 65:38]
  assign func_units_3_io_i_exception = io_i_exception; // @[execute.scala 130:28]
  assign func_units_3_io_i_rollback_valid = io_i_rollback_valid; // @[execute.scala 138:30]
  assign func_units_3_io_i_rollback_rob_idx = io_o_branch_resolve_pack_rob_idx[6:0]; // @[execute.scala 146:31]
  assign func_units_4_clock = clock;
  assign func_units_4_reset = reset;
  assign func_units_4_io_i_uop_valid = _mul_io_i_select_T_3 ? io_i_issue_res_packs_0_valid :
    io_i_issue_res_packs_1_valid; // @[execute.scala 123:24]
  assign func_units_4_io_i_uop_pc = _mul_io_i_select_T_3 ? io_i_issue_res_packs_0_pc : io_i_issue_res_packs_1_pc; // @[execute.scala 123:24]
  assign func_units_4_io_i_uop_inst = _mul_io_i_select_T_3 ? io_i_issue_res_packs_0_inst : io_i_issue_res_packs_1_inst; // @[execute.scala 123:24]
  assign func_units_4_io_i_uop_func_code = _mul_io_i_select_T_3 ? io_i_issue_res_packs_0_func_code :
    io_i_issue_res_packs_1_func_code; // @[execute.scala 123:24]
  assign func_units_4_io_i_uop_phy_dst = _mul_io_i_select_T_3 ? io_i_issue_res_packs_0_phy_dst :
    io_i_issue_res_packs_1_phy_dst; // @[execute.scala 123:24]
  assign func_units_4_io_i_uop_stale_dst = _mul_io_i_select_T_3 ? io_i_issue_res_packs_0_stale_dst :
    io_i_issue_res_packs_1_stale_dst; // @[execute.scala 123:24]
  assign func_units_4_io_i_uop_arch_dst = _mul_io_i_select_T_3 ? io_i_issue_res_packs_0_arch_dst :
    io_i_issue_res_packs_1_arch_dst; // @[execute.scala 123:24]
  assign func_units_4_io_i_uop_rob_idx = _mul_io_i_select_T_3 ? io_i_issue_res_packs_0_rob_idx :
    io_i_issue_res_packs_1_rob_idx; // @[execute.scala 123:24]
  assign func_units_4_io_i_uop_src1_value = _mul_io_i_select_T_3 ? io_i_issue_res_packs_0_src1_value :
    io_i_issue_res_packs_1_src1_value; // @[execute.scala 123:24]
  assign func_units_4_io_i_uop_src2_value = _mul_io_i_select_T_3 ? io_i_issue_res_packs_0_src2_value :
    io_i_issue_res_packs_1_src2_value; // @[execute.scala 123:24]
  assign func_units_4_io_i_uop_alu_sel = _mul_io_i_select_T_3 ? io_i_issue_res_packs_0_alu_sel :
    io_i_issue_res_packs_1_alu_sel; // @[execute.scala 123:24]
  assign func_units_4_io_i_select = _alu1_io_i_select_T & (io_i_issue_res_packs_1_valid &
    io_i_issue_res_packs_1_func_code == 7'h8 | _mul_io_i_select_T_4); // @[execute.scala 109:45]
  assign func_units_4_io_i_select_to_commit = (3'h4 == issue_idx1 | 3'h4 == issue_idx2) &
    func_units_4_io_o_ex_res_pack_valid & _alu1_io_i_select_T; // @[execute.scala 179:129]
  assign func_units_4_io_i_exception = io_i_exception; // @[execute.scala 131:28]
  assign func_units_4_io_i_rollback_valid = io_i_rollback_valid; // @[execute.scala 139:30]
  assign func_units_4_io_i_rollback_rob_idx = io_o_branch_resolve_pack_rob_idx[6:0]; // @[execute.scala 147:31]
  assign div_clock = clock;
  assign div_reset = reset;
  assign div_io_i_uop_valid = _div_io_i_select_T_3 ? io_i_issue_res_packs_0_valid : io_i_issue_res_packs_1_valid; // @[execute.scala 124:24]
  assign div_io_i_uop_pc = _div_io_i_select_T_3 ? io_i_issue_res_packs_0_pc : io_i_issue_res_packs_1_pc; // @[execute.scala 124:24]
  assign div_io_i_uop_inst = _div_io_i_select_T_3 ? io_i_issue_res_packs_0_inst : io_i_issue_res_packs_1_inst; // @[execute.scala 124:24]
  assign div_io_i_uop_func_code = _div_io_i_select_T_3 ? io_i_issue_res_packs_0_func_code :
    io_i_issue_res_packs_1_func_code; // @[execute.scala 124:24]
  assign div_io_i_uop_phy_dst = _div_io_i_select_T_3 ? io_i_issue_res_packs_0_phy_dst : io_i_issue_res_packs_1_phy_dst; // @[execute.scala 124:24]
  assign div_io_i_uop_stale_dst = _div_io_i_select_T_3 ? io_i_issue_res_packs_0_stale_dst :
    io_i_issue_res_packs_1_stale_dst; // @[execute.scala 124:24]
  assign div_io_i_uop_arch_dst = _div_io_i_select_T_3 ? io_i_issue_res_packs_0_arch_dst :
    io_i_issue_res_packs_1_arch_dst; // @[execute.scala 124:24]
  assign div_io_i_uop_rob_idx = _div_io_i_select_T_3 ? io_i_issue_res_packs_0_rob_idx : io_i_issue_res_packs_1_rob_idx; // @[execute.scala 124:24]
  assign div_io_i_uop_src1_value = _div_io_i_select_T_3 ? io_i_issue_res_packs_0_src1_value :
    io_i_issue_res_packs_1_src1_value; // @[execute.scala 124:24]
  assign div_io_i_uop_src2_value = _div_io_i_select_T_3 ? io_i_issue_res_packs_0_src2_value :
    io_i_issue_res_packs_1_src2_value; // @[execute.scala 124:24]
  assign div_io_i_uop_alu_sel = _div_io_i_select_T_3 ? io_i_issue_res_packs_0_alu_sel : io_i_issue_res_packs_1_alu_sel; // @[execute.scala 124:24]
  assign div_io_i_select = _alu1_io_i_select_T & (io_i_issue_res_packs_1_valid & io_i_issue_res_packs_1_func_code == 7'h10
     | _div_io_i_select_T_4); // @[execute.scala 112:45]
  assign div_io_i_select_to_commit = (3'h5 == issue_idx1 | 3'h5 == issue_idx2) & div_io_o_ex_res_pack_valid &
    _alu1_io_i_select_T; // @[execute.scala 179:129]
  assign div_io_i_exception = io_i_exception; // @[execute.scala 132:28]
  assign div_io_i_rollback_valid = io_i_rollback_valid; // @[execute.scala 140:30]
  assign div_io_i_rollback_rob_idx = io_o_branch_resolve_pack_rob_idx[6:0]; // @[execute.scala 148:31]
  assign csr_bf_clock = clock;
  assign csr_bf_reset = reset;
  assign csr_bf_io_i_uop_valid = _csr_bf_io_i_select_T_3 ? io_i_issue_res_packs_0_valid : io_i_issue_res_packs_1_valid; // @[execute.scala 125:27]
  assign csr_bf_io_i_uop_pc = _csr_bf_io_i_select_T_3 ? io_i_issue_res_packs_0_pc : io_i_issue_res_packs_1_pc; // @[execute.scala 125:27]
  assign csr_bf_io_i_uop_inst = _csr_bf_io_i_select_T_3 ? io_i_issue_res_packs_0_inst : io_i_issue_res_packs_1_inst; // @[execute.scala 125:27]
  assign csr_bf_io_i_uop_func_code = _csr_bf_io_i_select_T_3 ? io_i_issue_res_packs_0_func_code :
    io_i_issue_res_packs_1_func_code; // @[execute.scala 125:27]
  assign csr_bf_io_i_uop_phy_dst = _csr_bf_io_i_select_T_3 ? io_i_issue_res_packs_0_phy_dst :
    io_i_issue_res_packs_1_phy_dst; // @[execute.scala 125:27]
  assign csr_bf_io_i_uop_stale_dst = _csr_bf_io_i_select_T_3 ? io_i_issue_res_packs_0_stale_dst :
    io_i_issue_res_packs_1_stale_dst; // @[execute.scala 125:27]
  assign csr_bf_io_i_uop_arch_dst = _csr_bf_io_i_select_T_3 ? io_i_issue_res_packs_0_arch_dst :
    io_i_issue_res_packs_1_arch_dst; // @[execute.scala 125:27]
  assign csr_bf_io_i_uop_rob_idx = _csr_bf_io_i_select_T_3 ? io_i_issue_res_packs_0_rob_idx :
    io_i_issue_res_packs_1_rob_idx; // @[execute.scala 125:27]
  assign csr_bf_io_i_uop_src1_value = _csr_bf_io_i_select_T_3 ? io_i_issue_res_packs_0_src1_value :
    io_i_issue_res_packs_1_src1_value; // @[execute.scala 125:27]
  assign csr_bf_io_i_uop_alu_sel = _csr_bf_io_i_select_T_3 ? io_i_issue_res_packs_0_alu_sel :
    io_i_issue_res_packs_1_alu_sel; // @[execute.scala 125:27]
  assign csr_bf_io_i_select = _alu1_io_i_select_T & (io_i_issue_res_packs_1_valid & io_i_issue_res_packs_1_func_code == 7'h20
     | _csr_bf_io_i_select_T_4); // @[execute.scala 115:48]
  assign csr_bf_io_i_select_to_commit = (3'h6 == issue_idx1 | 3'h6 == issue_idx2) & csr_bf_io_o_ex_res_pack_valid &
    _alu1_io_i_select_T; // @[execute.scala 179:129]
  assign csr_bf_io_i_exception = io_i_exception; // @[execute.scala 133:31]
  assign csr_bf_io_i_rollback_valid = io_i_rollback_valid; // @[execute.scala 141:33]
  assign csr_bf_io_i_rollback_rob_idx = io_o_branch_resolve_pack_rob_idx[6:0]; // @[execute.scala 149:34]
  always @(posedge clock) begin
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset & ~(io_o_ex_res_packs_0_valid & io_o_ex_res_packs_0_uop_valid | ~io_o_ex_res_packs_0_valid)) begin
          $fwrite(32'h80000002,
            "Assertion failed: exu pack valid, but uop not valid\n    at execute.scala:192 assert(((io.o_ex_res_packs(0).valid && io.o_ex_res_packs(0).uop.valid)||(!io.o_ex_res_packs(0).valid)),\"exu pack valid, but uop not valid\")\n"
            ); // @[execute.scala 192:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~reset & ~(io_o_ex_res_packs_0_valid & io_o_ex_res_packs_0_uop_valid | ~io_o_ex_res_packs_0_valid)) begin
          $fatal; // @[execute.scala 192:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_4 & ~(io_o_ex_res_packs_1_valid & io_o_ex_res_packs_1_uop_valid | ~io_o_ex_res_packs_1_valid)) begin
          $fwrite(32'h80000002,
            "Assertion failed: exu pack valid, but uop not valid\n    at execute.scala:193 assert(((io.o_ex_res_packs(1).valid && io.o_ex_res_packs(1).uop.valid)||(!io.o_ex_res_packs(1).valid)),\"exu pack valid, but uop not valid\")\n"
            ); // @[execute.scala 193:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_4 & ~(io_o_ex_res_packs_1_valid & io_o_ex_res_packs_1_uop_valid | ~io_o_ex_res_packs_1_valid)) begin
          $fatal; // @[execute.scala 193:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
  end
endmodule
