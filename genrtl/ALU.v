module ALU(
  input         clock,
  input         reset,
  input         io_i_uop_valid,
  input  [31:0] io_i_uop_pc,
  input  [31:0] io_i_uop_inst,
  input  [6:0]  io_i_uop_func_code,
  input  [6:0]  io_i_uop_phy_dst,
  input  [6:0]  io_i_uop_stale_dst,
  input  [4:0]  io_i_uop_arch_dst,
  input  [6:0]  io_i_uop_rob_idx,
  input  [63:0] io_i_uop_src1_value,
  input  [63:0] io_i_uop_src2_value,
  input  [4:0]  io_i_uop_alu_sel,
  input         io_i_select,
  input         io_i_select_to_commit,
  output        io_o_ex_res_pack_valid,
  output        io_o_ex_res_pack_uop_valid,
  output [31:0] io_o_ex_res_pack_uop_pc,
  output [31:0] io_o_ex_res_pack_uop_inst,
  output [6:0]  io_o_ex_res_pack_uop_func_code,
  output [6:0]  io_o_ex_res_pack_uop_phy_dst,
  output [6:0]  io_o_ex_res_pack_uop_stale_dst,
  output [4:0]  io_o_ex_res_pack_uop_arch_dst,
  output [6:0]  io_o_ex_res_pack_uop_rob_idx,
  output [63:0] io_o_ex_res_pack_uop_dst_value,
  output [63:0] io_o_ex_res_pack_uop_src1_value,
  output [4:0]  io_o_ex_res_pack_uop_alu_sel,
  output        io_o_available,
  input         io_i_exception,
  input         io_i_rollback_valid,
  input  [6:0]  io_i_rollback_rob_idx
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [63:0] _RAND_9;
  reg [63:0] _RAND_10;
  reg [31:0] _RAND_11;
`endif // RANDOMIZE_REG_INIT
  reg  state; // @[execute_unit.scala 43:24]
  reg  uop_valid; // @[execute_unit.scala 46:22]
  reg [31:0] uop_pc; // @[execute_unit.scala 46:22]
  reg [31:0] uop_inst; // @[execute_unit.scala 46:22]
  reg [6:0] uop_func_code; // @[execute_unit.scala 46:22]
  reg [6:0] uop_phy_dst; // @[execute_unit.scala 46:22]
  reg [6:0] uop_stale_dst; // @[execute_unit.scala 46:22]
  reg [4:0] uop_arch_dst; // @[execute_unit.scala 46:22]
  reg [6:0] uop_rob_idx; // @[execute_unit.scala 46:22]
  reg [63:0] uop_src1_value; // @[execute_unit.scala 46:22]
  reg [63:0] uop_src2_value; // @[execute_unit.scala 46:22]
  reg [4:0] uop_alu_sel; // @[execute_unit.scala 46:22]
  wire  _io_o_ex_res_pack_uop_dst_value_T = uop_alu_sel == 5'h0; // @[execute_unit.scala 79:22]
  wire  _io_o_ex_res_pack_uop_dst_value_T_1 = uop_alu_sel == 5'h1; // @[execute_unit.scala 80:22]
  wire [63:0] _io_o_ex_res_pack_uop_dst_value_T_3 = uop_src1_value + uop_src2_value; // @[execute_unit.scala 80:48]
  wire  _io_o_ex_res_pack_uop_dst_value_T_4 = uop_alu_sel == 5'h2; // @[execute_unit.scala 81:22]
  wire  _io_o_ex_res_pack_uop_dst_value_T_7 = uop_alu_sel == 5'h3; // @[execute_unit.scala 82:22]
  wire  _io_o_ex_res_pack_uop_dst_value_T_11 = $signed(uop_src1_value) >= $signed(uop_src2_value) ? 1'h0 : 1'h1; // @[execute_unit.scala 82:46]
  wire  _io_o_ex_res_pack_uop_dst_value_T_12 = uop_alu_sel == 5'h4; // @[execute_unit.scala 83:22]
  wire  _io_o_ex_res_pack_uop_dst_value_T_14 = uop_src1_value >= uop_src2_value ? 1'h0 : 1'h1; // @[execute_unit.scala 83:45]
  wire  _io_o_ex_res_pack_uop_dst_value_T_15 = uop_alu_sel == 5'h5; // @[execute_unit.scala 84:22]
  wire [63:0] _io_o_ex_res_pack_uop_dst_value_T_16 = uop_src1_value ^ uop_src2_value; // @[execute_unit.scala 84:47]
  wire  _io_o_ex_res_pack_uop_dst_value_T_17 = uop_alu_sel == 5'h6; // @[execute_unit.scala 85:22]
  wire [63:0] _io_o_ex_res_pack_uop_dst_value_T_18 = uop_src1_value | uop_src2_value; // @[execute_unit.scala 85:47]
  wire  _io_o_ex_res_pack_uop_dst_value_T_19 = uop_alu_sel == 5'h7; // @[execute_unit.scala 86:22]
  wire [63:0] _io_o_ex_res_pack_uop_dst_value_T_20 = uop_src1_value & uop_src2_value; // @[execute_unit.scala 86:47]
  wire  _io_o_ex_res_pack_uop_dst_value_T_21 = uop_alu_sel == 5'h8; // @[execute_unit.scala 87:22]
  wire [31:0] _io_o_ex_res_pack_uop_dst_value_intermediate_T_17 = uop_src1_value[31:0] >> uop_src2_value[4:0]; // @[execute_unit.scala 107:75]
  wire [63:0] intermediate = {{32'd0}, _io_o_ex_res_pack_uop_dst_value_intermediate_T_17}; // @[execute_unit.scala 75:28 107:55]
  wire [63:0] _io_o_ex_res_pack_uop_dst_value_T_26 = {32'hffffffff,intermediate[31:0]}; // @[Cat.scala 33:92]
  wire [63:0] _io_o_ex_res_pack_uop_dst_value_T_27 = ~intermediate[31] ? {{32'd0}, intermediate[31:0]} :
    _io_o_ex_res_pack_uop_dst_value_T_26; // @[execute_unit.scala 87:80]
  wire  _io_o_ex_res_pack_uop_dst_value_T_28 = uop_alu_sel == 5'h9; // @[execute_unit.scala 88:22]
  wire [94:0] _GEN_0 = {{31'd0}, uop_src1_value}; // @[execute_unit.scala 88:53]
  wire [94:0] _io_o_ex_res_pack_uop_dst_value_T_31 = _GEN_0 << uop_src2_value[4:0]; // @[execute_unit.scala 88:53]
  wire  _io_o_ex_res_pack_uop_dst_value_T_32 = uop_alu_sel == 5'ha; // @[execute_unit.scala 89:22]
  wire [63:0] _io_o_ex_res_pack_uop_dst_value_T_35 = uop_src1_value >> uop_src2_value[4:0]; // @[execute_unit.scala 89:60]
  wire  _io_o_ex_res_pack_uop_dst_value_T_36 = uop_alu_sel == 5'hb; // @[execute_unit.scala 90:22]
  wire [63:0] _io_o_ex_res_pack_uop_dst_value_T_41 = $signed(uop_src1_value) >>> uop_src2_value[4:0]; // @[execute_unit.scala 90:73]
  wire  _io_o_ex_res_pack_uop_dst_value_T_42 = uop_alu_sel == 5'hc; // @[execute_unit.scala 91:22]
  wire [62:0] _GEN_2 = {{31'd0}, uop_src1_value[31:0]}; // @[execute_unit.scala 91:60]
  wire [62:0] _io_o_ex_res_pack_uop_dst_value_T_45 = _GEN_2 << uop_src2_value[4:0]; // @[execute_unit.scala 91:60]
  wire  _io_o_ex_res_pack_uop_dst_value_T_46 = uop_alu_sel == 5'hd; // @[execute_unit.scala 92:22]
  wire [63:0] _io_o_ex_res_pack_uop_dst_value_T_52 = intermediate[31] ? _io_o_ex_res_pack_uop_dst_value_T_26 : {{32
    'd0}, intermediate[31:0]}; // @[execute_unit.scala 92:99]
  wire  _io_o_ex_res_pack_uop_dst_value_T_53 = uop_alu_sel == 5'he; // @[execute_unit.scala 93:22]
  wire  _io_o_ex_res_pack_uop_dst_value_T_60 = uop_alu_sel == 5'hf; // @[execute_unit.scala 94:22]
  wire  _io_o_ex_res_pack_uop_dst_value_T_63 = uop_alu_sel == 5'h10; // @[execute_unit.scala 95:22]
  wire [63:0] _io_o_ex_res_pack_uop_dst_value_T_65 = uop_src1_value - uop_src2_value; // @[execute_unit.scala 95:47]
  wire  _io_o_ex_res_pack_uop_dst_value_T_66 = uop_alu_sel == 5'h11; // @[execute_unit.scala 96:22]
  wire  _io_o_ex_res_pack_uop_dst_value_T_70 = uop_alu_sel == 5'h12; // @[execute_unit.scala 97:22]
  wire  _io_o_ex_res_pack_uop_dst_value_T_75 = uop_alu_sel == 5'h13; // @[execute_unit.scala 98:22]
  wire  _io_o_ex_res_pack_uop_dst_value_T_78 = uop_alu_sel == 5'h14; // @[execute_unit.scala 99:22]
  wire  _io_o_ex_res_pack_uop_dst_value_T_80 = uop_alu_sel == 5'h15; // @[execute_unit.scala 100:22]
  wire  _io_o_ex_res_pack_uop_dst_value_T_83 = uop_alu_sel == 5'h16; // @[execute_unit.scala 101:22]
  wire  _io_o_ex_res_pack_uop_dst_value_T_88 = uop_alu_sel == 5'h17; // @[execute_unit.scala 102:22]
  wire  _io_o_ex_res_pack_uop_dst_value_T_90 = uop_alu_sel == 5'h18; // @[execute_unit.scala 103:22]
  wire  _io_o_ex_res_pack_uop_dst_value_T_92 = uop_alu_sel == 5'h19; // @[execute_unit.scala 104:22]
  wire [63:0] _io_o_ex_res_pack_uop_dst_value_T_103 = {32'hffffffff,_io_o_ex_res_pack_uop_dst_value_T_3[31:0]}; // @[Cat.scala 33:92]
  wire [63:0] _io_o_ex_res_pack_uop_dst_value_T_104 = ~_io_o_ex_res_pack_uop_dst_value_T_3[31] ? {{32'd0},
    _io_o_ex_res_pack_uop_dst_value_T_3[31:0]} : _io_o_ex_res_pack_uop_dst_value_T_103; // @[execute_unit.scala 104:45]
  wire  _io_o_ex_res_pack_uop_dst_value_T_105 = uop_alu_sel == 5'h1a; // @[execute_unit.scala 105:22]
  wire [63:0] _io_o_ex_res_pack_uop_dst_value_T_116 = {32'hffffffff,_io_o_ex_res_pack_uop_dst_value_T_65[31:0]}; // @[Cat.scala 33:92]
  wire [63:0] _io_o_ex_res_pack_uop_dst_value_T_117 = ~_io_o_ex_res_pack_uop_dst_value_T_65[31] ? {{32'd0},
    _io_o_ex_res_pack_uop_dst_value_T_65[31:0]} : _io_o_ex_res_pack_uop_dst_value_T_116; // @[execute_unit.scala 105:45]
  wire  _io_o_ex_res_pack_uop_dst_value_T_118 = uop_alu_sel == 5'h1b; // @[execute_unit.scala 106:22]
  wire  _io_o_ex_res_pack_uop_dst_value_T_125 = uop_alu_sel == 5'h1c; // @[execute_unit.scala 107:22]
  wire  _io_o_ex_res_pack_uop_dst_value_T_132 = uop_alu_sel == 5'h1d; // @[execute_unit.scala 108:22]
  wire [63:0] _io_o_ex_res_pack_uop_dst_value_T_137 = _io_o_ex_res_pack_uop_dst_value_T_132 ?
    _io_o_ex_res_pack_uop_dst_value_T_41 : 64'h0; // @[Mux.scala 101:16]
  wire [63:0] _io_o_ex_res_pack_uop_dst_value_T_138 = _io_o_ex_res_pack_uop_dst_value_T_125 ?
    _io_o_ex_res_pack_uop_dst_value_T_27 : _io_o_ex_res_pack_uop_dst_value_T_137; // @[Mux.scala 101:16]
  wire [63:0] _io_o_ex_res_pack_uop_dst_value_T_139 = _io_o_ex_res_pack_uop_dst_value_T_118 ?
    _io_o_ex_res_pack_uop_dst_value_T_27 : _io_o_ex_res_pack_uop_dst_value_T_138; // @[Mux.scala 101:16]
  wire [63:0] _io_o_ex_res_pack_uop_dst_value_T_140 = _io_o_ex_res_pack_uop_dst_value_T_105 ?
    _io_o_ex_res_pack_uop_dst_value_T_117 : _io_o_ex_res_pack_uop_dst_value_T_139; // @[Mux.scala 101:16]
  wire [63:0] _io_o_ex_res_pack_uop_dst_value_T_141 = _io_o_ex_res_pack_uop_dst_value_T_92 ?
    _io_o_ex_res_pack_uop_dst_value_T_104 : _io_o_ex_res_pack_uop_dst_value_T_140; // @[Mux.scala 101:16]
  wire [63:0] _io_o_ex_res_pack_uop_dst_value_T_142 = _io_o_ex_res_pack_uop_dst_value_T_90 ?
    _io_o_ex_res_pack_uop_dst_value_T_20 : _io_o_ex_res_pack_uop_dst_value_T_141; // @[Mux.scala 101:16]
  wire [63:0] _io_o_ex_res_pack_uop_dst_value_T_143 = _io_o_ex_res_pack_uop_dst_value_T_88 ?
    _io_o_ex_res_pack_uop_dst_value_T_18 : _io_o_ex_res_pack_uop_dst_value_T_142; // @[Mux.scala 101:16]
  wire [63:0] _io_o_ex_res_pack_uop_dst_value_T_144 = _io_o_ex_res_pack_uop_dst_value_T_83 ?
    _io_o_ex_res_pack_uop_dst_value_T_41 : _io_o_ex_res_pack_uop_dst_value_T_143; // @[Mux.scala 101:16]
  wire [63:0] _io_o_ex_res_pack_uop_dst_value_T_145 = _io_o_ex_res_pack_uop_dst_value_T_80 ?
    _io_o_ex_res_pack_uop_dst_value_T_35 : _io_o_ex_res_pack_uop_dst_value_T_144; // @[Mux.scala 101:16]
  wire [63:0] _io_o_ex_res_pack_uop_dst_value_T_146 = _io_o_ex_res_pack_uop_dst_value_T_78 ?
    _io_o_ex_res_pack_uop_dst_value_T_16 : _io_o_ex_res_pack_uop_dst_value_T_145; // @[Mux.scala 101:16]
  wire [63:0] _io_o_ex_res_pack_uop_dst_value_T_147 = _io_o_ex_res_pack_uop_dst_value_T_75 ? {{63'd0},
    _io_o_ex_res_pack_uop_dst_value_T_14} : _io_o_ex_res_pack_uop_dst_value_T_146; // @[Mux.scala 101:16]
  wire [63:0] _io_o_ex_res_pack_uop_dst_value_T_148 = _io_o_ex_res_pack_uop_dst_value_T_70 ? {{63'd0},
    _io_o_ex_res_pack_uop_dst_value_T_11} : _io_o_ex_res_pack_uop_dst_value_T_147; // @[Mux.scala 101:16]
  wire [94:0] _io_o_ex_res_pack_uop_dst_value_T_149 = _io_o_ex_res_pack_uop_dst_value_T_66 ?
    _io_o_ex_res_pack_uop_dst_value_T_31 : {{31'd0}, _io_o_ex_res_pack_uop_dst_value_T_148}; // @[Mux.scala 101:16]
  wire [94:0] _io_o_ex_res_pack_uop_dst_value_T_150 = _io_o_ex_res_pack_uop_dst_value_T_63 ? {{31'd0},
    _io_o_ex_res_pack_uop_dst_value_T_65} : _io_o_ex_res_pack_uop_dst_value_T_149; // @[Mux.scala 101:16]
  wire [94:0] _io_o_ex_res_pack_uop_dst_value_T_151 = _io_o_ex_res_pack_uop_dst_value_T_60 ? {{31'd0},
    _io_o_ex_res_pack_uop_dst_value_T_3} : _io_o_ex_res_pack_uop_dst_value_T_150; // @[Mux.scala 101:16]
  wire [94:0] _io_o_ex_res_pack_uop_dst_value_T_152 = _io_o_ex_res_pack_uop_dst_value_T_53 ? {{31'd0},
    _io_o_ex_res_pack_uop_dst_value_T_52} : _io_o_ex_res_pack_uop_dst_value_T_151; // @[Mux.scala 101:16]
  wire [94:0] _io_o_ex_res_pack_uop_dst_value_T_153 = _io_o_ex_res_pack_uop_dst_value_T_46 ? {{31'd0},
    _io_o_ex_res_pack_uop_dst_value_T_52} : _io_o_ex_res_pack_uop_dst_value_T_152; // @[Mux.scala 101:16]
  wire [94:0] _io_o_ex_res_pack_uop_dst_value_T_154 = _io_o_ex_res_pack_uop_dst_value_T_42 ? {{32'd0},
    _io_o_ex_res_pack_uop_dst_value_T_45} : _io_o_ex_res_pack_uop_dst_value_T_153; // @[Mux.scala 101:16]
  wire [94:0] _io_o_ex_res_pack_uop_dst_value_T_155 = _io_o_ex_res_pack_uop_dst_value_T_36 ? {{31'd0},
    _io_o_ex_res_pack_uop_dst_value_T_41} : _io_o_ex_res_pack_uop_dst_value_T_154; // @[Mux.scala 101:16]
  wire [94:0] _io_o_ex_res_pack_uop_dst_value_T_156 = _io_o_ex_res_pack_uop_dst_value_T_32 ? {{31'd0},
    _io_o_ex_res_pack_uop_dst_value_T_35} : _io_o_ex_res_pack_uop_dst_value_T_155; // @[Mux.scala 101:16]
  wire [94:0] _io_o_ex_res_pack_uop_dst_value_T_157 = _io_o_ex_res_pack_uop_dst_value_T_28 ?
    _io_o_ex_res_pack_uop_dst_value_T_31 : _io_o_ex_res_pack_uop_dst_value_T_156; // @[Mux.scala 101:16]
  wire [94:0] _io_o_ex_res_pack_uop_dst_value_T_158 = _io_o_ex_res_pack_uop_dst_value_T_21 ? {{31'd0},
    _io_o_ex_res_pack_uop_dst_value_T_27} : _io_o_ex_res_pack_uop_dst_value_T_157; // @[Mux.scala 101:16]
  wire [94:0] _io_o_ex_res_pack_uop_dst_value_T_159 = _io_o_ex_res_pack_uop_dst_value_T_19 ? {{31'd0},
    _io_o_ex_res_pack_uop_dst_value_T_20} : _io_o_ex_res_pack_uop_dst_value_T_158; // @[Mux.scala 101:16]
  wire [94:0] _io_o_ex_res_pack_uop_dst_value_T_160 = _io_o_ex_res_pack_uop_dst_value_T_17 ? {{31'd0},
    _io_o_ex_res_pack_uop_dst_value_T_18} : _io_o_ex_res_pack_uop_dst_value_T_159; // @[Mux.scala 101:16]
  wire [94:0] _io_o_ex_res_pack_uop_dst_value_T_161 = _io_o_ex_res_pack_uop_dst_value_T_15 ? {{31'd0},
    _io_o_ex_res_pack_uop_dst_value_T_16} : _io_o_ex_res_pack_uop_dst_value_T_160; // @[Mux.scala 101:16]
  wire [94:0] _io_o_ex_res_pack_uop_dst_value_T_162 = _io_o_ex_res_pack_uop_dst_value_T_12 ? {{94'd0},
    _io_o_ex_res_pack_uop_dst_value_T_14} : _io_o_ex_res_pack_uop_dst_value_T_161; // @[Mux.scala 101:16]
  wire [94:0] _io_o_ex_res_pack_uop_dst_value_T_163 = _io_o_ex_res_pack_uop_dst_value_T_7 ? {{94'd0},
    _io_o_ex_res_pack_uop_dst_value_T_11} : _io_o_ex_res_pack_uop_dst_value_T_162; // @[Mux.scala 101:16]
  wire [94:0] _io_o_ex_res_pack_uop_dst_value_T_164 = _io_o_ex_res_pack_uop_dst_value_T_4 ? {{31'd0},
    _io_o_ex_res_pack_uop_dst_value_T_3} : _io_o_ex_res_pack_uop_dst_value_T_163; // @[Mux.scala 101:16]
  wire [94:0] _io_o_ex_res_pack_uop_dst_value_T_165 = _io_o_ex_res_pack_uop_dst_value_T_1 ? {{31'd0},
    _io_o_ex_res_pack_uop_dst_value_T_3} : _io_o_ex_res_pack_uop_dst_value_T_164; // @[Mux.scala 101:16]
  wire [94:0] _io_o_ex_res_pack_uop_dst_value_T_166 = _io_o_ex_res_pack_uop_dst_value_T ? 95'h0 :
    _io_o_ex_res_pack_uop_dst_value_T_165; // @[Mux.scala 101:16]
  wire  _next_state_T_7 = io_i_rollback_rob_idx < uop_rob_idx & io_i_rollback_rob_idx[6] & ~uop_rob_idx[6]; // @[execute_unit.scala 117:84]
  wire  _next_state_T_9 = io_i_rollback_valid & (io_i_rollback_rob_idx > uop_rob_idx | _next_state_T_7); // @[execute_unit.scala 116:30]
  wire  _next_state_T_10 = ~io_i_exception; // @[execute_unit.scala 118:10]
  wire  _next_state_T_15 = ~io_i_exception & ~state & (uop_valid & ~io_i_select_to_commit); // @[execute_unit.scala 118:50]
  wire  _next_state_T_19 = _next_state_T_10 & state & io_i_select_to_commit; // @[execute_unit.scala 119:50]
  wire  _next_state_T_20 = _next_state_T_19 ? 1'h0 : state; // @[Mux.scala 101:16]
  wire  _next_state_T_22 = _next_state_T_9 ? 1'h0 : _next_state_T_15 | _next_state_T_20; // @[Mux.scala 101:16]
  wire  _next_state_T_23 = io_i_exception ? 1'h0 : _next_state_T_22; // @[Mux.scala 101:16]
  wire [1:0] next_state = {{1'd0}, _next_state_T_23}; // @[execute_unit.scala 114:16 44:26]
  wire [1:0] _GEN_1 = reset ? 2'h0 : next_state; // @[execute_unit.scala 43:{24,24} 45:11]
  assign io_o_ex_res_pack_valid = uop_valid; // @[execute_unit.scala 58:28]
  assign io_o_ex_res_pack_uop_valid = uop_valid; // @[execute_unit.scala 57:26]
  assign io_o_ex_res_pack_uop_pc = uop_pc; // @[execute_unit.scala 57:26]
  assign io_o_ex_res_pack_uop_inst = uop_inst; // @[execute_unit.scala 57:26]
  assign io_o_ex_res_pack_uop_func_code = uop_func_code; // @[execute_unit.scala 57:26]
  assign io_o_ex_res_pack_uop_phy_dst = uop_phy_dst; // @[execute_unit.scala 57:26]
  assign io_o_ex_res_pack_uop_stale_dst = uop_stale_dst; // @[execute_unit.scala 57:26]
  assign io_o_ex_res_pack_uop_arch_dst = uop_arch_dst; // @[execute_unit.scala 57:26]
  assign io_o_ex_res_pack_uop_rob_idx = uop_rob_idx; // @[execute_unit.scala 57:26]
  assign io_o_ex_res_pack_uop_dst_value = _io_o_ex_res_pack_uop_dst_value_T_166[63:0]; // @[execute_unit.scala 78:36]
  assign io_o_ex_res_pack_uop_src1_value = uop_src1_value; // @[execute_unit.scala 57:26]
  assign io_o_ex_res_pack_uop_alu_sel = uop_alu_sel; // @[execute_unit.scala 57:26]
  assign io_o_available = state ? 1'h0 : 1'h1; // @[execute_unit.scala 122:26]
  always @(posedge clock) begin
    state <= _GEN_1[0]; // @[execute_unit.scala 43:{24,24} 45:11]
    if (reset) begin // @[execute_unit.scala 46:22]
      uop_valid <= 1'h0; // @[execute_unit.scala 46:22]
    end else if (io_i_select_to_commit & ~io_i_select | io_i_exception) begin // @[execute_unit.scala 49:66]
      uop_valid <= 1'h0; // @[execute_unit.scala 50:23]
    end else if (io_i_select) begin // @[execute_unit.scala 48:20]
      uop_valid <= io_i_uop_valid;
    end
    if (reset) begin // @[execute_unit.scala 46:22]
      uop_pc <= 32'h0; // @[execute_unit.scala 46:22]
    end else if (io_i_select) begin // @[execute_unit.scala 48:20]
      uop_pc <= io_i_uop_pc;
    end
    if (reset) begin // @[execute_unit.scala 46:22]
      uop_inst <= 32'h0; // @[execute_unit.scala 46:22]
    end else if (io_i_select) begin // @[execute_unit.scala 48:20]
      uop_inst <= io_i_uop_inst;
    end
    if (reset) begin // @[execute_unit.scala 46:22]
      uop_func_code <= 7'h0; // @[execute_unit.scala 46:22]
    end else if (io_i_select) begin // @[execute_unit.scala 48:20]
      uop_func_code <= io_i_uop_func_code;
    end
    if (reset) begin // @[execute_unit.scala 46:22]
      uop_phy_dst <= 7'h0; // @[execute_unit.scala 46:22]
    end else if (io_i_select) begin // @[execute_unit.scala 48:20]
      uop_phy_dst <= io_i_uop_phy_dst;
    end
    if (reset) begin // @[execute_unit.scala 46:22]
      uop_stale_dst <= 7'h0; // @[execute_unit.scala 46:22]
    end else if (io_i_select) begin // @[execute_unit.scala 48:20]
      uop_stale_dst <= io_i_uop_stale_dst;
    end
    if (reset) begin // @[execute_unit.scala 46:22]
      uop_arch_dst <= 5'h0; // @[execute_unit.scala 46:22]
    end else if (io_i_select) begin // @[execute_unit.scala 48:20]
      uop_arch_dst <= io_i_uop_arch_dst;
    end
    if (reset) begin // @[execute_unit.scala 46:22]
      uop_rob_idx <= 7'h0; // @[execute_unit.scala 46:22]
    end else if (io_i_select) begin // @[execute_unit.scala 48:20]
      uop_rob_idx <= io_i_uop_rob_idx;
    end
    if (reset) begin // @[execute_unit.scala 46:22]
      uop_src1_value <= 64'h0; // @[execute_unit.scala 46:22]
    end else if (io_i_select) begin // @[execute_unit.scala 48:20]
      uop_src1_value <= io_i_uop_src1_value;
    end
    if (reset) begin // @[execute_unit.scala 46:22]
      uop_src2_value <= 64'h0; // @[execute_unit.scala 46:22]
    end else if (io_i_select) begin // @[execute_unit.scala 48:20]
      uop_src2_value <= io_i_uop_src2_value;
    end
    if (reset) begin // @[execute_unit.scala 46:22]
      uop_alu_sel <= 5'h0; // @[execute_unit.scala 46:22]
    end else if (io_i_select) begin // @[execute_unit.scala 48:20]
      uop_alu_sel <= io_i_uop_alu_sel;
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset & ~(uop_func_code == 7'h1 | uop_func_code == 7'h0)) begin
          $fwrite(32'h80000002,
            "Assertion failed: funccode is not alu\n    at execute_unit.scala:54 assert(uop.func_code ===FU_ALU || uop.func_code===0.U,\"funccode is not alu\")\n"
            ); // @[execute_unit.scala 54:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~reset & ~(uop_func_code == 7'h1 | uop_func_code == 7'h0)) begin
          $fatal; // @[execute_unit.scala 54:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  state = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  uop_valid = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  uop_pc = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  uop_inst = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  uop_func_code = _RAND_4[6:0];
  _RAND_5 = {1{`RANDOM}};
  uop_phy_dst = _RAND_5[6:0];
  _RAND_6 = {1{`RANDOM}};
  uop_stale_dst = _RAND_6[6:0];
  _RAND_7 = {1{`RANDOM}};
  uop_arch_dst = _RAND_7[4:0];
  _RAND_8 = {1{`RANDOM}};
  uop_rob_idx = _RAND_8[6:0];
  _RAND_9 = {2{`RANDOM}};
  uop_src1_value = _RAND_9[63:0];
  _RAND_10 = {2{`RANDOM}};
  uop_src2_value = _RAND_10[63:0];
  _RAND_11 = {1{`RANDOM}};
  uop_alu_sel = _RAND_11[4:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
